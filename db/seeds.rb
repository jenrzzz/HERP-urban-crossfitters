# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ISSUE: use create! & save! instead of create & save?

[User, WorkoutCategory, Workout, Exercise, ExerciseWorkout].each(&:delete_all)

admin = User.create(:email => "admin@test.test", :username => "admin")

girl = WorkoutCategory.create(:category => "Girl")
hero = WorkoutCategory.create(:category => "Hero")
wod = WorkoutCategory.create(:category => "WOD")
benchmark = WorkoutCategory.create(:category => "Benchmark")

#need to seed custom workout category? all user defined
#custom = WorkoutCategory.create(:category => "Custom")

#add to app/models/workout_category.rb - valid category?
#olympic = WorkoutCategory.create(:category => "Olympic Lifts")

[girl, hero, wod, benchmark].each do |category| #add custom/olympic
	category.user_id = admin.id
	category.save
end

#GIRLS------------------------------------------------------------------------
angie = Workout.create(:name => "Angie", :description => "For Time. Complete all reps of each exercise before moving to the next.")
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

barbara = Workout.create(:name => "Barbara", :description => "5 rounds, time each round. Rest precisely three minutes between each round. ")
barbara.workout_category_id = girl.id
barbara.user_id = admin.id
barbara.save
exercise = barbara.exercises.create(:repetitions => 20, :rounds => 5, :description => "Pull-ups")
exercise.user_id = admin.id
exercise.save
exercise = barbara.exercises.create(:repetitions => 30, :rounds => 5, :description => "Push-ups")
exercise.user_id = admin.id
exercise.save
exercise = barbara.exercises.create(:repetitions => 40, :rounds => 5, :description => "Sit-ups")
exercise.user_id = admin.id
exercise.save
exercise = barbara.exercises.create(:repetitions => 50, :rounds => 5, :description => "Squats")
exercise.user_id = admin.id
exercise.save
#HEROES-----------------------------------------------------------------------
jt = Workout.create(:name => "JT", :description => "21-15-9 reps, for time.")
jt.workout_category_id = hero.id
jt.user_id = admin.id
jt.save

#ISSUE: How to input 21-15-9 reps?

exercise = jt.exercises.create(:repetitions => 21, :description => "Handstand push-ups")
exercise.user_id = admin.id
exercise.save
exercise = jt.exercises.create(:repetitions => 21, :description => "Ring dips")
exercise.user_id = admin.id
exercise.save
exercise = jt.exercises.create(:repetitions => 21, :description => "Push-ups")
exercise.user_id = admin.id
exercise.save


michael = Workout.create(:name => "Michael", :description => "3 rounds for time.")
michael.workout_category_id = hero.id
michael.user_id = admin.id
michael.save
exercise = michael.exercises.create(:distance => 800, :units => "meters", :description => "Run")
exercise.user_id = admin.id
exercise.save
exercise = michael.exercises.create(:repetitions => 50, :description => "Back Extensions")
exercise.user_id = admin.id
exercise.save
exercise = michael.exercises.create(:repetitions => 50, :description => "Sit-ups")
exercise.user_id = admin.id
exercise.save
#WODS-------------------------------------------------------------------------
#BENCHMARK--------------------------------------------------------------------

