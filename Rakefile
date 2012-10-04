require 'rake'
require 'erb'
require 'fileutils'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  FileUtils.mkdir_p(File.expand_path("~/bin"))
  Dir['*'].each do |file|
    file = File.expand_path file
    next if %w[Rakefile README.rdoc LICENSE .git].include? file

    original_file = File.join(ENV['HOME'], "bin", "#{File.basename(file)}")
    if File.exist?(original_file)
      if File.identical?(original_file, file) && !File.directory?(file)
        puts "identical #{original_file}"
      elsif replace_all
        replace_file(original_file, file)
      else
        print "overwrite #{original_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(original_file, file)
        when 'y'
          replace_file(original_file, file)
        when 'q'
          exit
        else
          puts "skipping #{original_file}"
        end
      end
    else
      link_file(original_file, file)
    end
  end
end

def replace_file(original_file, new_file)
  command = %Q{rm -rf "#{original_file}"}
  puts command
  system command
  link_file(original_file, new_file)
end

def link_file(original_file, new_file)
  command = %Q{ln -fs "#{new_file}" "#{original_file}"}
  puts command
  system command
end

