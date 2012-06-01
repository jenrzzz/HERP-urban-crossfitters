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

#loop gives error at girl.id etc.

#["girl", "hero", "wOD", "benchmark"].each do |category|
#	category = WorkoutCategory.create(:category => category.capitalize)
#	category.user_id = admin.id
#	category.save
#end

girl = WorkoutCategory.create(:category => "Girl")
girl.user_id = admin.id
girl.save

hero = WorkoutCategory.create(:category => "Hero")
hero.user_id = admin.id
hero.save

wOD = WorkoutCategory.create(:category => "WOD")
wOD.user_id = admin.id
wOD.save

benchmark = WorkoutCategory.create(:category => "Benchmark")
benchmark.user_id = admin.id
benchmark.save

angie = Workout.create(:name => "Angie", :description => "For Time
Complete all reps of each exercise before moving to the next.")
#angieWorkout = angie.exercises.create
#([
#	{:repetitions => 100, :description => "Pull-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Push-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Sit-ups", :user_id => admin.id},
#	{:repetitions => 100, :description => "Squats", :user_id => admin.id}
#])

#loop
angie.workout_category_id = girl.id
angie.user_id = admin.id
angie.save

#Exercise.create(:repetitions => 100, :description => "Pull-ups")
#Exercise.create(:repetitions => 100, :description => "Push-ups")
#Exercise.create(:repetitions => 100, :description => "Sit-ups")
#Exercise.create(:repetitions => 100, :description => "Squats")
