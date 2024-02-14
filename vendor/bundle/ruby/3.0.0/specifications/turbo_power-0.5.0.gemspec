# -*- encoding: utf-8 -*-
# stub: turbo_power 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turbo_power".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/marcoroth/turbo_power-rails/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/marcoroth/turbo_power-rails", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/marcoroth/turbo_power-rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marco Roth".freeze]
  s.date = "2023-10-15"
  s.description = "Power-pack for Turbo Streams".freeze
  s.email = ["marco.roth@hey.com".freeze]
  s.homepage = "https://github.com/marcoroth/turbo_power-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Power-pack for Turbo Streams".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<turbo-rails>.freeze, ["~> 1.3"])
  else
    s.add_dependency(%q<turbo-rails>.freeze, ["~> 1.3"])
  end
end
