
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rnba/version"

Gem::Specification.new do |spec|
  spec.name          = "rnba"
  spec.license       = "MIT"
  spec.version       = Rnba::VERSION
  spec.authors       = ["Ricky"]
  spec.email         = ["rickyyim@gmail.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = "https://github.com/codingricky/rnba"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/codingricky/rnba"
    spec.metadata["changelog_uri"] = "https://github.com/codingricky/rnba"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-color", "~> 0.4.2"
  spec.add_dependency "tty-command", "~> 0.8.0"
  spec.add_dependency "tty-config", "~> 0.2.0"
  spec.add_dependency "tty-cursor", "~> 0.5.0"
  spec.add_dependency "tty-editor", "~> 0.4.0"
  spec.add_dependency "tty-file", "~> 0.6.0"
  spec.add_dependency "tty-font", "~> 0.2.0"
  spec.add_dependency "tty-markdown", "~> 0.4.0"
  spec.add_dependency "tty-pager", "~> 0.11.0"
  spec.add_dependency "tty-platform", "~> 0.1.0"
  spec.add_dependency "tty-progressbar", "~> 0.15.0"
  spec.add_dependency "tty-prompt", "~> 0.16.1"
  spec.add_dependency "tty-screen", "~> 0.6.4"
  spec.add_dependency "tty-spinner", "~> 0.8.0"
  spec.add_dependency "tty-table", "~> 0.10.0"
  spec.add_dependency "tty-tree", "~> 0.1.0"
  spec.add_dependency "tty-which", "~> 0.3.0"
  spec.add_dependency "pastel", "~> 0.7.2"
  spec.add_dependency "thor", "~> 0.20.0"
  spec.add_dependency "tzinfo"
  spec.add_dependency "nba_api_wrapper", "0.2.3"
  spec.add_dependency "geocoder"
  spec.add_dependency "json", "1.8.6"
  spec.add_dependency "timezone"
  spec.add_dependency "timezone_finder"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
