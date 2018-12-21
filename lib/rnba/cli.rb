# frozen_string_literal: true

require 'thor'

module Rnba
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'rnba version'
    def version
      require_relative 'version'
      puts "v#{Rnba::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'tomorrow', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def tomorrow(*)
      if options[:help]
        invoke :help, ['tomorrow']
      else
        require_relative 'commands/tomorrow'
        Rnba::Commands::Tomorrow.new(options).execute
      end
    end

    desc 'game', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def game(*team)
      if options[:help]
        invoke :help, ['game']
      else
        require_relative 'commands/game'
        Rnba::Commands::Game.new(team, options).execute
      end
    end

    desc 'today', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def today(*)
      if options[:help]
        invoke :help, ['today']
      else
        require_relative 'commands/today'
        Rnba::Commands::Today.new(options).execute
      end
    end
  end
end
