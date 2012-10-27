class Admins::AdminsController < ApplicationController
	layout 'admin'
	before_filter :logged_in

	def index
	end

	 private
    def logged_in
    authenticate_admin!
  end
end