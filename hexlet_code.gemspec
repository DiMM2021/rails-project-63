# frozen_string_literal: true

require_relative "lib/hexlet_code/version"

Gem::Specification.new do |spec|
  spec.name = "hexlet_code"
  spec.version = HexletCode::VERSION
  spec.authors = ["Diana Mashkina"]
  spec.email = ["momentservice@gmail.com"]

  spec.summary = "Form generator."
  spec.description = "Form generator, a simplified analogue of Simple Form."
  spec.homepage = "https://github.com/DiMM2021/rails-project-63"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/DiMM2021/rails-project-63"
  spec.metadata["changelog_uri"] = "https://github.com/DiMM2021/rails-project-63/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
