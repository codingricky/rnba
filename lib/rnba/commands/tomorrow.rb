# frozen_string_literal: true

require_relative 'date_command'

module Rnba
  module Commands
    class Tomorrow < DateCommand

      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        table = new_game_table

        matches = Nba.new.games_tomorrow
        matches.each {|m| table << m.to_row }
        render(output, table)
      end
    end
  end
end
