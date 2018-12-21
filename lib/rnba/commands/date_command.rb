# frozen_string_literal: true

require_relative '../command'
require_relative '../models/match'
require_relative '../models/nba'
require 'tty-table'
require 'nba_api_wrapper'
require 'tzinfo'

module Rnba
  module Commands
    class DateCommand < Rnba::Command
      def new_game_table
        table = TTY::Table.new header: ['Away', 'Score', 'Home', 'Score', 'Time']
        table.render do |renderer|
          renderer.border.separator = :each_row
        end

        table
      end

      def render(output, table)
        output.puts table.render(:unicode, width: 80, padding: [1,2,1,2], resize: true)
      end
    end
  end
end