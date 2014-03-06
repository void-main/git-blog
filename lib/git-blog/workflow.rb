#!/usr/bin/env ruby
require_relative './storage'
require_relative './configuration'
require 'FileUtils'

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
		# Setup basic configuration
		def setup
			conf = GitBlog::Configuration.new
			print "Path to blog: "
			$stdin.flush
			conf.blog_path = File.expand_path $stdin.gets.chomp
			conf.write

			# Also, create the hook files
			current_path = File.expand_path(File.dirname(__FILE__))
			hook_path = File.join current_path, "hooks"
			source_template_path = File.join hook_path, "prepare-commit-msg"
			target_template_path = GitBlog::Storage.prepare_commit_msg_template_path
			if !File.file? target_template_path
				FileUtils.cp source_template_path, target_template_path
				FileUtils.chmod 0755, target_template_path
			end

			source_commit_script_path = File.join hook_path, "commit-msg"
			target_commit_script_path = GitBlog::Storage.commit_msg_script_path
			if !File.file? target_commit_script_path
				FileUtils.cp source_commit_script_path, target_commit_script_path
				FileUtils.chmod 0755, target_commit_script_path
			end
		end

		# Test if config is setup
		def need_setup?
			!File.file?(GitBlog::Storage.config_path) ||
			!File.file?(GitBlog::Storage.prepare_commit_msg_template_path) ||
			!File.file?(GitBlog::Storage.commit_msg_script_path)
		end

		# Do the job
		def start_blogging cli_params
			current_path = Dir.pwd

			if !current_path.repo?
				puts "Error: please run git-blog inside a git repo."
				return
			end

			if need_setup?
				puts "Haven't setup git-repo, setting up now"
				setup
			end

			hooks_path = File.join current_path, ".git", "hooks"
			source_template_path = GitBlog::Storage.prepare_commit_msg_template_path
			target_template_path = File.join hooks_path, "prepare-commit-msg"
			FileUtils.cp source_template_path, target_template_path
			FileUtils.chmod 0755, target_template_path

			source_commit_script_path = GitBlog::Storage.commit_msg_script_path
			target_commit_script_path = File.join hooks_path, "commit-msg"
			FileUtils.cp source_commit_script_path, target_commit_script_path
			FileUtils.chmod 0755, target_commit_script_path

			# Pass to git commit
			puts %x(git commit #{cli_params.join(" ")})

			# Clean up
			FileUtils.rm target_template_path
			FileUtils.rm target_commit_script_path
			end
	end
end


# Test it!
# puts ".".repo?
# puts "~".repo?
# puts "/DoesNotExists".repo?
# puts "~/Workspace/Projects/OctoEvent".repo?
#
# workflow = GitBlog::Workflow.new
# workflow.setup