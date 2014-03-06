require './lib/git-blog/version'

Gem::Specification.new do |s|
  s.name = 'git-blog'
  s.version = GitBlog::VERSION
  s.author = 'Peng Sun'
  s.email = 'voidmain1313113@gmail.com'

  s.summary = 'Turn git commit message into blog article.'
  s.description = "There are tons of books yelling about how you shouldn't repeat yourself, how you should keep it DRY(Don't Repeat Yourself). 
Well, we tried hard to keep the code clean, but when it comes to blog we wrote, we seems quite ignorante to the DRY principle. 
During the whole developement process, there will always be some interesting points you want to record, so git gurus told us to write proper git commit messages for further reference or so. 
And yes, I followed, and I spent quite a time writing about the problem I encountered, how I found the solution, and what should might be useful in the future. That's nice, right?
But I've also got a blog to write! Wait, I don't want to REPEAT MYSELF. And that leads to a barely touched blog site. And git-blog is here to help."
  s.homepage = 'https://github.com/void-main/git-blog'
  s.license = 'The MIT License (MIT)'

  s.platform = Gem::Platform::RUBY
  s.require_paths = %w[lib]
  s.files = `git ls-files`.split("\n")
  s.test_files = Dir['spec/**/*.rb']
  s.executables = ['git-blog']

  s.add_development_dependency 'rake',    '~> 0.9.0'
  s.add_development_dependency 'rspec',   '~> 2.6.0'

  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'git-blog', '--main', 'README.md']
end