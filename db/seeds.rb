# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
WorkoutCategory.delete_all
Workout.delete_all
Exercise.delete_all

admin = User.create(:email => "admin@test.test", :username => "admin")

girl = WorkoutCategory.create(:category => "Girl")
hero = WorkoutCategory.create(:category => "Hero")
wod = WorkoutCategory.create(:category => "WOD")
benchmark = WorkoutCategory.create(:category => "Benchmark")
#custom workout category?

[girl, hero, wod, benchmark].each do |category|
	category.user_id = admin.id
	category.save
end

angie = Workout.create(:name => "Angie", :description => "For Time
Complete all reps of each exercise before moving to the next.")
#angieWorkout = angie.exercises.create
#([
#	{:repetitions => 100, :description => "Pull-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Push-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Sit-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Squats", :user_id => admin.id}
#])

[angie].each do |girls|
	girls.workout_category_id = girl.id
	girls.user_id = admin.id
	girls.save
end

#Exercise.create(:repetitions => 100, :description => "Pull-ups")
#Exercise.create(:repetitions => 100, :description => "Push-ups")
#Exercise.create(:repetitions => 100, :description => "Sit-ups")
#Exercise.create(:repetitions => 100, :description => "Squats")
