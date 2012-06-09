class ShareController < ApplicationController

  	def show
	    if session[:fbaccess]['token'] then
	  		@graph = Koala::Facebook::API.new session[:fbaccess]['token']
  		begin	
            @graph.put_wall_post('shit') 
        rescue 
            flash[:notice] = 'You have already posted this workout to Facebook!'
        else
            flash[:notice] = 'Successfully posted on Facebook!'
        ensure
        redirect_to(:back)
        end
  		end
  	end
end
