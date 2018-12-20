# frozen_string_literal: true

require_relative '../command'
require_relative '../models/match'
require 'tty-table'
require 'nba_api_wrapper'
require 'tzinfo'

module Rnba
  module Commands
    class Game < Rnba::Command
      def initialize(team='', options)
        @team = team
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        
        table = TTY::Table.new header: ['Away', 'Score', 'Home', 'Score', 'Time']
        table.render do |renderer|
          renderer.border.separator = :each_row
        end


        tz = TZInfo::Timezone.get('US/Pacific')
        # today = Time.now.getlocal(tz.current_period.offset.utc_total_offset).strftime('%Y%m%d')
        today = '20181219'
        games = NBA::Game.get_games(today)['sports_content']['games']['game']
        games.each do |game|
          match = Match.new(game)
          table << match.to_row
        end

        output.puts table.render(:unicode, width: 80, padding: [1,2,1,2], resize: true)      
      end
    end
  end
end
