lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake'
require 'sidekiq_glass/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-glass"
  spec.version       = SidekiqGlass::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Maciej Mensfeld', 'Pavlo Vavruk']
  spec.email         = %w( maciej@mensfeld.pl pavlo.vavruk@gmail.com )
  spec.summary       = 'Sidekiq worker timeout and reentrancy!'
  spec.description   = 'Sidekiq worker wrapper that provides optional timeout and after failure (reentrancy)'
  spec.homepage      = 'https://github.com/karafka/sidekiq-glass'
  spec.license       = 'MIT'

  spec.add_dependency 'sidekiq', '4.0.1'
  spec.add_dependency 'null-logger'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w( lib )
end
