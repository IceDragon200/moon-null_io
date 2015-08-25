Gem::Specification.new do |s|
  s.name        = 'moon-null_io'
  s.summary     = 'NullIO'
  s.description = 'An empty, no-op IO object in ruby.'
  s.homepage    = 'https://github.com/polyfox/moon-null_io'
  s.email       = 'mistdragon100@gmail.com'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.date        = Time.now.to_date.to_s
  s.license     = 'MIT'
  s.authors     = ['Blaž Hrastnik', 'Corey Powell']

  s.add_dependency             'rake',  '~> 10.3'
  s.add_development_dependency 'yard',  '~> 0.8'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'simplecov'

  s.require_path = 'lib'
  s.files = []
  s.files += Dir.glob('lib/**/*.{rb,yml}')
  s.files += Dir.glob('spec/**/*')
end
