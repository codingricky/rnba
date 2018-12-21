# frozen_string_literal: true

require_relative '../command'
require_relative '../models/match'
require_relative '../models/nba'
require 'tty-table'
require 'nba_api_wrapper'
require 'tzinfo'

module Rnba
  module Commands
    class Today < Rnba::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        table = TTY::Table.new header: ['Away', 'Score', 'Home', 'Score', 'Time']
        table.render do |renderer|
          renderer.border.separator = :each_row
        end

        matches = Nba.new.games_today
        matches.each {|m| table << m.to_row }
        output.puts table.render(:unicode, width: 80, padding: [1,2,1,2], resize: true)   
      end
    end
  end
end
