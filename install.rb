#!/usr/bin/env ruby
require 'erb'
require 'fileutils'

def install
  FileUtils.mkdir_p(File.expand_path("~/bin"))
  replace_all = !!ENV["FORCE"]
  Dir['*'].each do |file|
    next if %w[install.rb Rakefile README README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], "bin", "#{file.sub('.erb', '')}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/bin/#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/bin/#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/bin/#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/bin/#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], "bin", "#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/bin/#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/bin/#{file}"}
  end
end

install()
