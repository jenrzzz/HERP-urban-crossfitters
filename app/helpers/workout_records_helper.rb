module WorkoutRecordsHelper

def fbwallpost
    if session[:fbaccess]['token'] then
		@graph =	Koala::Facebook::API.new session[:fbaccess]['token']
		if @workout_record.time && !@workout_record.points && !@workout_record.rounds
      $fbwall = "I just completed "+@workout_record.workout.workout_category.category+" - "+@workout_record.workout.name+" in "+@workout_record.time[:string] 
      end 
    if !@workout_record.time && !@workout_record.points && @workout_record.rounds  
        $fbwall = "I just completed "+@workout_record.rounds+ " rounds of "+@workout_record.workout.workout_category.category+" - "+@workout_record.workout.name   
        end  
      
        if !@workout_record.time && @workout_record.points && !@workout_record.rounds  
        $fbwall = "I just gained "+@workout_record.points+" of points from " +@workout_record.workout.workout_category.category+" - "+@workout_record.workout.name   
        end  
      
        if @workout_record.time && @workout_record.points && !@workout_record.rounds  
        $fbwall = "I just gained "+@workout_record.points+" of points from "+ @workout_record.workout.workout_category.category+" - "+@workout_record.workout.name+" in "+@workout_record.time[:string]  
        end  
      
        if @workout_record.time && !@workout_record.points && @workout_record.rounds  
        $fbwall = "I just completed "+@workout_record.rounds+" of points from "+ @workout_record.workout.workout_category.category+" - "+@workout_record.workout.name+" in "+@workout_record.time[:string]  
        end  
      
        if !@workout_record.time && @workout_record.points && @workout_record.rounds  
        $fbwall = "I just gained "+@workout_record.points+" of points from "+ @workout_record.workout.workout_category.category+" - "+@workout_record.workout.name+" in "+@workout_record.rounds+ " rounds!"  
        end  
      
        if @workout_record.time && @workout_record.points && @workout_record.rounds  
        $fbwall = "I just gained "+@workout_record.points+" of points from "+ @workout_record.workout.workout_category.category+" - "+@workout_record.workout.name+" in "+@workout_record.time[:string]+ " while doing "+ @workout_record.rounds+" rounds!"  
        end  
  
		@postfb = @graph.put_wall_post($fbwall)	
  	end
  	
  	end
end
