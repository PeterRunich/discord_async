# frozen_string_literal: true

require_relative 'lib/discord_async/version'

Gem::Specification.new do |spec|
  spec.name = 'discord_async'
  spec.version = DiscordAsync::VERSION
  spec.authors = ['Peter Runich']
  spec.email = ['p.runich@bk.ru']

  spec.summary = 'Wrapper for developing async discord bots.'
  spec.description = 'Wrapper for developing async discord bots.'
  spec.homepage = 'https://github.com/PeterRunich/discord_async'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.3'

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
