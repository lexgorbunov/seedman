$:.push File.expand_path('../lib', __FILE__)

require 'seedman/version'

Gem::Specification.new do |s|
  s.name        = 'seedman'
  s.version     = Seedman::VERSION
  s.authors     = ['Alexander Gorbunov']
  s.email       = ['lexgorbunov@gmail.com']
  s.homepage    = 'https://github.com/lexgorbunov/seedman'
  s.summary     = 'Gem for add progressbar at seed'
  s.description = 'Gem for add progressbar at seed'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.1'
end
