#!/usr/bin/env ruby

# Test if a (String) path is a repo
class String
	def repo?
		ret = false

		# Use git rev-parse command to test if a directory is a repo
		full_path = File.expand_path self
		if File.directory? full_path
			Dir.chdir full_path do
				system "git rev-parse > /dev/null 2>&1"
				ret = $?.exitstatus == 0
			end
		end

		ret
	end
end

module GitBlog
	class Workflow
		
	end
end

# Test it!
puts ".".repo?
puts "~".repo?
puts "/DoesNotExists".repo?
puts "~/Workspace/Projects/OctoEvent".repo?