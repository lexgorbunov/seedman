$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'focus_watcher/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'focus_watcher'
  s.version     = FocusWatcher::VERSION
  s.authors     = ['Alexander Gorbunov']
  s.email       = ['lexgorbunov@gmail.com']
  s.homepage    = 'https://github.com/lexgorbunov/focus_watcher'
  s.summary     = 'Gem for tracking the receipt and loss focus of dom elements'
  s.description = 'Gem for tracking the receipt and loss focus of dom elements'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 3.2'
end
