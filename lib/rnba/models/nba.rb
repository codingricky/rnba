class Nba
  ONE_DAY_IN_SECONDS = 60 * 60 * 24

  def games_today
    tz = TZInfo::Timezone.get('US/Pacific')
    today = Time.now.getlocal(tz.current_period.offset.utc_total_offset).strftime('%Y%m%d')
    games = NBA::Game.get_games(today)['sports_content']['games']['game']
    games.map {|g| Match.new(g)}
  end

  def games_tomorrow
    tz = TZInfo::Timezone.get('US/Pacific')
    tomorrow = (Time.now.getlocal(tz.current_period.offset.utc_total_offset) + ONE_DAY_IN_SECONDS).strftime('%Y%m%d')
    games = NBA::Game.get_games(tomorrow)['sports_content']['games']['game']
    games.map {|g| Match.new(g)}
  end
end