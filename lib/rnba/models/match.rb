require 'date'
require 'geocoder'
require 'timezone_finder'

class Match
    BASKETBALL = "\u{1F3C0}"

    def initialize(hash)
        @hash = hash
        @visitor = TeamMatch.new(hash['visitor'])
        @home = TeamMatch.new(hash['home'])
    end

    def status
        period_time['game_status'].to_i
    end

    def method_missing(m, *args, &block)
        return @hash[m.to_s] if @hash.has_key?(m.to_s)

        raise ArgumentError.new("Method `#{m}` doesn't exist.")
    end

    def status_as_string
        return "Not yet started" if not_yet_started?
        return "Started" if started?
        return "Finished"
    end

    def time_remaining
        return "starting at " + formatted_start_time if not_yet_started?
        return "Finished" if finished?
        return "Halftime" if halftime?
        return "#{period_time['period_name']}#{period_time['period_value']}  #{period_time['game_clock']}"
    end

    def date_time
        DateTime.parse("#{date}#{time}", timezone)
    end

    def formatted_start_time
      date_time_without_tz.strftime('%F %T')
    end

    def date_time_without_tz
      DateTime.parse("#{date}#{time}")
    end

    def time_in_local_timezone
        date_time.to_s
    end

    def visitor
        "#{@visitor.abbreviation}" + (visitor_win? ? BASKETBALL : " ")
    end

    def visitor_score
        @visitor.score.to_i
    end

    def home
        "#{@home.abbreviation}" + (home_win? ? BASKETBALL : " ")
    end

    def home_score
        @home.score.to_i
    end

    def visitor_win?
        visitor_score > home_score
    end

    def home_win?
        home_score > visitor_score
    end

    def to_row
        [visitor, visitor_score, home, home_score, time_remaining]
    end

    private

    def timezone
        location = "#{city}, #{state}, #{country}"
        results = Geocoder.search location
        return "" if results.empty?

        data = results.first.data
        lat = data['lat'].to_f
        lon = data['lon'].to_f
        timezone_where_match_is_on = TimezoneFinder.create.timezone_at(lng: lon, lat: lat)
        timezone_where_match_is_on
    end

    def started?
        status == 2
    end

    def finished?
        status == 3
    end

    def not_yet_started?
        status == 1
    end

    def halftime?
        period_time['period_status'] == 'Halftime'
    end
end

class TeamMatch
    def initialize(hash)
        @hash = hash
    end

    def score
        @hash['score'].to_i
    end

    def method_missing(m, *args, &block)
        return @hash[m.to_s] if @hash.has_key?(m.to_s)

        raise ArgumentError.new("Method `#{m}` doesn't exist.")
    end
end