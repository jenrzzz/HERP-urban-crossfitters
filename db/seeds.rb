# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ISSUE: use create! & save! instead of create & save?

[User, WorkoutCategory, Workout, ExerciseCategory, Exercise, ExerciseWorkout].each(&:delete_all)

admin = User.create(:email => "admin@test.test", :username => "admin")

girl = WorkoutCategory.create(:category => "Girl")
hero = WorkoutCategory.create(:category => "Hero")
wod = WorkoutCategory.create(:category => "WOD")
benchmark = WorkoutCategory.create(:category => "Benchmark")

#need to seed custom workout category? all user defined
#custom = WorkoutCategory.create(:category => "Custom")

#add to app/models/workout_category.rb - valid category?
#olympic = WorkoutCategory.create(:category => "Olympic Lifts")

[girl, hero, wod, benchmark].each do |workoutCategory| #add custom/olympic
	workoutCategory.user_id = admin.id
	workoutCategory.save
end

pullups = ExerciseCategory.create(:category => "Pull-ups")
pushups = ExerciseCategory.create(:category => "Push-ups")
situps = ExerciseCategory.create(:category => "Sit-ups")
squats = ExerciseCategory.create(:category => "Squats")
handstand_pushups = ExerciseCategory.create(:category => "Handstand Push-ups")
ring_dips = ExerciseCategory.create(:category => "Ring Dips")
running = ExerciseCategory.create(:category => "Running")
back_extensions = ExerciseCategory.create(:category => "Back Extensions")

[pullups, pushups, situps, squats, handstand_pushups, ring_dips, back_extensions].each do |exerciseCategory|
	exerciseCategory.user_id = admin.id
	exerciseCategory.save
end

#GIRLS------------------------------------------------------------------------
angie = Workout.create(:name => "Angie", :description => "For Time. Complete all reps of each exercise before moving to the next.")
angie.workout_category_id = girl.id
angie.user_id = admin.id
angie.save

angie1 = angie.exercises.create(:repetitions => 100)
angie1.exercise_category_id = pullups.id
angie1.user_id = admin.id
angie1.save
angie2 = angie.exercises.create(:repetitions => 100)
angie2.exercise_category_id = pushups.id
angie2.user_id = admin.id
angie2.save
angie3 = angie.exercises.create(:repetitions => 100)
angie3.exercise_category_id = situps.id
angie3.user_id = admin.id
angie3.save
angie4 = angie.exercises.create(:repetitions => 100)
angie4.exercise_category_id = squats.id
angie4.user_id = admin.id
angie4.save

#ISSUE: Does this even need to be created or is it self-generated from above?
#ERROR: ID's cannot be null, cannot assign protected attributes
#ew = angie.exercise_workouts.create
#ew.workout_id = angie.id
#ew.exercise_id = exercise.id

barbara = Workout.create(:name => "Barbara", :description => "5 rounds, time each round. Rest precisely three minutes between each round. ")
barbara.workout_category_id = girl.id
barbara.user_id = admin.id
barbara.save
barbara1 = barbara.exercises.create(:repetitions => 20, :rounds => 5)
barbara1.exercise_category_id = pullups.id
barbara1.user_id = admin.id
barbara1.save
barbara2 = barbara.exercises.create(:repetitions => 30, :rounds => 5)
barbara2.exercise_category_id = pushups.id
barbara2.user_id = admin.id
barbara2.save
barbara3 = barbara.exercises.create(:repetitions => 40, :rounds => 5)
barbara3.exercise_category_id = situps.id
barbara3.user_id = admin.id
barbara3.save
barbara4 = barbara.exercises.create(:repetitions => 50, :rounds => 5)
barbara4.exercise_category_id = squats.id
barbara4.user_id = admin.id
barbara4.save
#HEROES-----------------------------------------------------------------------
jt = Workout.create(:name => "JT", :description => "21-15-9 reps, for time.")
jt.workout_category_id = hero.id
jt.user_id = admin.id
jt.save

#ISSUE: How to input 21-15-9 reps?

jt1 = jt.exercises.create(:repetitions => 21)
jt1.exercise_category_id = handstand_pushups.id
jt1.user_id = admin.id
jt1.save
jt2 = jt.exercises.create(:repetitions => 21)
jt2.exercise_category_id = ring_dips.id
jt2.user_id = admin.id
jt2.save
jt3 = jt.exercises.create(:repetitions => 21)
jt3.exercise_category_id = pushups.id
jt3.user_id = admin.id
jt3.save


michael = Workout.create(:name => "Michael", :description => "3 rounds for time.")
michael.workout_category_id = hero.id
michael.user_id = admin.id
michael.save
michael1 = michael.exercises.create(:distance => 800, :units => "meters")
michael1.exercise_category_id = running.id
michael1.user_id = admin.id
michael1.save
michael2 = michael.exercises.create(:repetitions => 50)
michael2.exercise_category_id = back_extensions.id
michael2.user_id = admin.id
michael2.save
michael3 = michael.exercises.create(:repetitions => 50)
michael3.exercise_category_id = situps.id
michael3.user_id = admin.id
michael3.save
#WODS-------------------------------------------------------------------------
#BENCHMARK--------------------------------------------------------------------

