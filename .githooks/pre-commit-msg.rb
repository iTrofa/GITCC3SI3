#!/usr/bin/env ruby
def story
 return $1 if `git status -b` =~ /([A-Z]+-[0-9]+)/
 puts "Branch name does not contain story number."
 puts "Aborting commit."
 exit 1
end
def prepend_commit_message
 file = ARGV[0]
 msg = File.read file
 File.open file, 'w' do |f|
 f.write "#{story} #{msg}"
 end
end
prepend_commit_message
story
