class ShareController < ApplicationController



    def create
        string = params[:fb_string]
        #raise params.to_yaml
	    if session[:fbaccess]['token'] then
	  		@graph = Koala::Facebook::API.new session[:fbaccess]['token']
  		begin	
            @graph.put_wall_post($string) 

        rescue 
            flash[:notice] = 'You have already posted this workout to Facebook!'
        else
            flash[:notice] = 'Successfully posted on Facebook!'
        ensure
            redirect_to(:back)
        
        end
  		end
  	end

    def show
        redirect_to(:back)
    end

    
end
