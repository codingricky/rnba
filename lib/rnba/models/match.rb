class Match
    BASKETBALL = "\u{1F3C0}"

    def initialize(hash)
        @hash = hash
        @visitor = TeamMatch.new(hash['visitor'])
        @home = TeamMatch.new(hash['home'])
    end

    def status
        @hash['period_time']['game_status']
    end

    def status_as_string
        return "Not yet started" if status == 1 
        return "Started" if status == 2
        return "Finished"
    end

    def visitor
        "#{@visitor.abbreviation}" + (visitor_win? ? BASKETBALL : " ")
    end

    def visitor_score
        @visitor.score
    end

    def home
        "#{@home.abbreviation}" + (home_win? ? BASKETBALL : " ")
    end

    def home_score
        @home.score
    end

    def visitor_win?
        visitor_score > home_score
    end

    def home_win?
        home_score > visitor_score
    end

    def to_row
        [visitor, visitor_score, home, home_score, status_as_string]
    end
end

class TeamMatch
    def initialize(hash)
        @hash = hash
    end

    def score
        @hash['score']
    end

    def abbreviation
        @hash['abbreviation']
    end
end