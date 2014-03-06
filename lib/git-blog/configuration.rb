#!/usr/bin/env ruby
require_relative "./storage"

module GitBlog
	class Configuration
		attr_accessor :blog_path
		attr_accessor :template_content

		def read
			dict = Storage::config_dict
			@blog_path = dict["blog-path"]
		end

		def write
			dict = { "blog-path" => @blog_path }
			Storage::save_config_dict dict
		end
	end
end

# blog = GitBlog::Configuration.new
# blog.read
# puts blog.blog_path