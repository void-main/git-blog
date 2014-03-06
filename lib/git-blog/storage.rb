#!/usr/bin/env ruby
require 'json'
require 'FileUtils'

module GitBlog
	class Storage
		BASE_PATH = "~/.git-blog"

		def self.storage_base_path
			File.expand_path BASE_PATH
		end

		def self.config_path
			File.join storage_base_path, "config.json"
		end

		def self.prepare_commit_msg_template_path
			File.join storage_base_path, "prepare-commit-msg"
		end

		def self.commit_msg_script_path
			File.join storage_base_path, "commit-msg"
		end

		def self.config_dict
			dict = nil
			
			path = Storage::config_path
			if File.exists? path
				dict = JSON.parse(File.read(path))
			end

			dict
		end

		def self.save_config_dict dict
			FileUtils.mkdir_p Storage::storage_base_path
			path = Storage::config_path
			File.open(path, "w") { |file| file.write dict.to_json }
		end
	end
end