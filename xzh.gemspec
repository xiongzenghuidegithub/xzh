# lib = File.expand_path("../lib", __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require "xzh/version"

require File.expand_path('../lib/xzh/gem_version', __FILE__)
require 'date'

Gem::Specification.new do |spec|
  spec.name          = "xzh"
  spec.version       = Xzh::VERSION
  spec.date          = Date.today
  spec.authors       = ["xiongzenghui"]
  spec.email         = ["xiongzenghui@zhihu.com"]

  spec.summary       = %q{a iOS devops command line tool RubyGemspec.}
  spec.description   = %q{a iOS devops command line tool RubyGemspec.}
  spec.homepage      = "https://github.com/xiongzenghuidegithub/ios_devops"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGemspec.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
    # spec.metadata["homepage_uri"] = spec.homepage
    # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushespec."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # spec.bindir        = "exe"
  # spec.executables   = spec.filespec.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*.rb"] + %w{ bin/xzh README.md LICENSE CHANGELOG.md }
  spec.executables   = %w{ xzh }
  spec.require_paths = %w{ lib }

  ## iOS tools
  spec.add_development_dependency "claide"
  spec.add_development_dependency "cocoapods"
  spec.add_development_dependency "xcodeproj"
  spec.add_development_dependency "fastlane"
  spec.add_development_dependency "gitlab"

  ## Version 5 needs Ruby 2.2, so we specify an upper bound to stay compatible with system ruby
  spec.add_runtime_dependency 'activesupport', '>= 4.0.2', '< 5'
  spec.add_runtime_dependency 'colored2',       '~> 3.1'
  spec.add_runtime_dependency 'escape',        '~> 0.0.4'
  spec.add_runtime_dependency 'fourflusher',   '>= 2.2.0', '< 3.0'
  spec.add_runtime_dependency 'gh_inspector',  '~> 1.0'
  spec.add_runtime_dependency 'nap',           '~> 1.0'
  spec.add_runtime_dependency 'ruby-macho',    '~> 1.4'

  ## Make sure you can build the gem on older versions of RubyGems too:
  spec.rubygems_version = "1.6.2"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=
  spec.required_ruby_version = '>= 2.0.0'
  spec.specification_version = 3 if spec.respond_to? :specification_version

  ## basic
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  ## ruby tools
  spec.add_dependency 'highline'
  spec.add_dependency 'facets'
end
