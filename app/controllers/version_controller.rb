class VersionController < ApplicationController
	def view
		@github = Github.new
		@github.repos.releases.list 'uygunes', 'mutfak'
		render "version"
	end

	 def new
    @version = Version.new
  end
end
