require 'colored2'
require 'claide'

module Xzh
  class Command < CLAide::Command
    # include Options
    # require 'xzh/command/cfg/config'
    # require 'cocoapods/command/options/repo_update'
    # require 'cocoapods/command/options/project_directory'
    # require 'cocoapods/command/cache'
    # require 'cocoapods/command/env'
    # require 'cocoapods/command/init'
    # require 'cocoapods/command/install'
    # require 'cocoapods/command/ipc'
    # require 'cocoapods/command/lib'
    # require 'cocoapods/command/list'
    # require 'cocoapods/command/outdated'
    # require 'cocoapods/command/repo'
    # require 'cocoapods/command/setup'
    # require 'cocoapods/command/spec'
    # require 'cocoapods/command/update'

    self.abstract_command = true
    self.command = 'xzh'
    self.version = VERSION
    self.description = 'xzh, a iOS command line tool enjoy !!'
    self.plugin_prefixes = %w(claide xzh)

    # def self.options
    #   [
    #     ['--silent', 'Show nothing'],
    #   ].concat(super)
    # end

    def self.run(argv)
      # help! 'You cannot run CocoaPods as root.' if Process.uid == 0 && !Gem.win_platform?
      super(argv)
      # UI.print_warnings
    end

    # @todo If a command is run inside another one some settings which where
    #       true might return false.
    #
    # @todo We should probably not even load colored unless needed.
    #
    # @todo Move silent flag to CLAide.
    #
    # @note It is important that the commands don't override the default
    #       settings if their flag is missing (i.e. their value is nil)
    #
    def initialize(argv)
      super
      # config.silent = argv.flag?('silent', config.silent)
      # config.verbose = self.verbose? unless verbose.nil?
      # unless self.ansi_output?
      #   Colored2.disable!
      #   String.send(:define_method, :colorize) { |string, _| string }
      # end
    end
  end
end
