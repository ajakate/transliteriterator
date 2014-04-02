task :compile_coffee do
  require 'coffee-script'

  compile_coffee [ 'assets/javascripts/**/*.coffee' ], '/spec/javascripts/cache/scripts.js'
  compile_coffee [ 'spec/javascripts/**/*.coffee' ], '/spec/javascripts/cache/specs.js'
end

task :specs do
  require 'jasmine'
  require 'jasmine-phantom'
  load 'jasmine/tasks/jasmine.rake'
  load 'jasmine-phantom/tasks.rake'

  Rake::Task['compile_coffee'].invoke
  Rake::Task['jasmine:phantom:ci'].invoke
end

private

def compile_coffee(dirs, target_file)
  def path(relative)
    root = File.dirname(__FILE__)
    File.join(root, relative)
  end

  target_file = path(target_file)

  dirs.each do |pattern|
    js = Dir.glob(path(pattern)).map do |coffee_file_path|
      CoffeeScript.compile(File.read(coffee_file_path))
    end.join(' ')

    Dir.mkdir(File.dirname(target_file)) unless File.exists?(File.dirname(target_file))
    #FileUtils.mkdir_p(File.dirname(target_file))
    File.write(target_file, js)
  end
end