class Nba
    def games_today
        tz = TZInfo::Timezone.get('US/Pacific')
        today = Time.now.getlocal(tz.current_period.offset.utc_total_offset).strftime('%Y%m%d')
        games = NBA::Game.get_games(today)['sports_content']['games']['game']
        games.map {|g| Match.new(g)}
    end
end