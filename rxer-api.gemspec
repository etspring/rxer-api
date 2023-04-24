# frozen_string_literal: true

require_relative "lib/rxer/api/version"

Gem::Specification.new do |spec|
  spec.name = "rxer-api"
  spec.version = Rxer::Api::VERSION
  spec.authors = ["SundayNight"]
  spec.email = ["etspring@gmail.com"]

  spec.summary = "Simple client for Reindexer REST Api"
  spec.description = "Simple HTTP-client for https://reindexer.io/"
  spec.homepage = "https://github.com/etspring/rxer-api/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/etspring/rxer-api.git"
  spec.metadata["changelog_uri"] = "https://github.com/etspring/rxer-api/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "excon", ">= 0.27.4"
  spec.add_dependency "faraday", ">= 2.1.0"
  spec.add_dependency "faraday-excon", ">= 2.1.0"

  spec.add_development_dependency "webmock"
end
