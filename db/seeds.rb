# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ISSUE: should be using create! and save! instead of create & save

[User, WorkoutCategory, Workout, Exercise, ExerciseWorkout].each(&:delete_all)

admin = User.create(:email => "admin@test.test", :username => "admin")

girl = WorkoutCategory.create(:category => "Girl")
hero = WorkoutCategory.create(:category => "Hero")
wod = WorkoutCategory.create(:category => "WOD")
benchmark = WorkoutCategory.create(:category => "Benchmark")

#add to app/models/workout_category.rb - valid category?
#olympic = WorkoutCategory.create(:category => "Olympic Lifts")

#need to seed custom workout category? all user defined
#custom = WorkoutCategory.create(:category => "Custom")

[girl, hero, wod, benchmark].each do |category| #add olympic/custom
	category.user_id = admin.id
	category.save
end

angie = Workout.create(:name => "Angie", :description => "For Time
Complete all reps of each exercise before moving to the next.")
angie.workout_category_id = girl.id
angie.user_id = admin.id
angie.save

exercise = angie.exercises.create(:repetitions => 100, :description => "Pull-ups")
exercise.user_id = admin.id
exercise.save
exercise = angie.exercises.create(:repetitions => 100, :description => "Push-ups")
exercise.user_id = admin.id
exercise.save
exercise = angie.exercises.create(:repetitions => 100, :description => "Sit-ups")
exercise.user_id = admin.id
exercise.save
exercise = angie.exercises.create(:repetitions => 100, :description => "Squats")
exercise.user_id = admin.id
exercise.save

#ISSUE: Does this even need to be created or is it self-generated from above?
#ERROR: ID's cannot be null, cannot assign protected attributes

#ew = angie.exercise_workouts.create
#ew.workout_id = angie.id
#ew.exercise_id = exercise.id
