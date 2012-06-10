class ShareController < ApplicationController


 def create
#raise params.to_yaml
        
          if session[:fbaccess]['token'] then
             @graph = Koala::Facebook::API.new session[:fbaccess]['token']
            begin   
							@graph.put_wall_post(params[:fb_string])
            rescue 
                flash[:error] = 'You have already posted this workout to Facebook.'
            else
                flash[:notice] = 'Successfully posted on Facebook!'
            ensure
                redirect_to(:back)
                return
            end
        
    end
  
    
end
end
