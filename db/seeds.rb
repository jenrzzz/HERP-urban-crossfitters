# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[WorkoutCategory, Workout, ExerciseCategory, Exercise, ExerciseWorkout].each(&:delete_all)

# Create an admin user who will own all "official" exercises and workouts
admin = User.find_or_create_by_id(:email => "admin@test.test", :username => "admin")

# Initialize calendar colors
EventColor.create :name => 'green', :hex_value => '#7BD148'
EventColor.create :name => 'blue', :hex_value => '#4986E7'
EventColor.create :name => 'red', :hex_value => '#F83A22'
EventColor.create :name => 'pink', :hex_value => '#CD74E6'

girl = WorkoutCategory.create(:category => "Girl")
hero = WorkoutCategory.create(:category => "Hero")
wod = WorkoutCategory.create(:category => "WOD")
benchmark = WorkoutCategory.create(:category => "Benchmark")

WorkoutCategory.all.each do |workoutCategory|
	workoutCategory.user_id = admin.id
	workoutCategory.save
end

pullup = ExerciseCategory.create(:category => "Pull-up")
jumping_pullup = ExerciseCategory.create(:category => "Jumping Pull-up")
l_pullup = ExerciseCategory.create(:category => "L pull-up")
pushup = ExerciseCategory.create(:category => "Push-up")
ring_pushup = ExerciseCategory.create(:category => "Ring Push-up")
handstand_pushup = ExerciseCategory.create(:category => "Handstand Push-up")
ring_handstand_pushup = ExerciseCategory.create(:category => "Ring Handstand Push-up")
situp = ExerciseCategory.create(:category => "Sit-up")
gluteham_situp = ExerciseCategory.create(:category => "Glute-ham Sit-up")
squat = ExerciseCategory.create(:category => "Squat")
front_squat = ExerciseCategory.create(:category => "Front Squat")
air_squat = ExerciseCategory.create(:category => "Air Squat")
one_legged_squat = ExerciseCategory.create(:category => "One Legged Squat")
overhead_squat = ExerciseCategory.create(:category => "Overhead Squat")
squat_clean = ExerciseCategory.create(:category => "Squat Clean")
clean = ExerciseCategory.create(:category => "Clean")
power_clean = ExerciseCategory.create(:category => "Power Clean")
hang_power_clean = ExerciseCategory.create(:category => "Hang Power Clean")
dumbbell_split_clean = ExerciseCategory.create(:category => "Dumbbell Split Clean")
dumbbell_squat_clean = ExerciseCategory.create(:category => "Dumbbell Squat Clean")
clean_and_jerk = ExerciseCategory.create(:category => "Clean and Jerk")
push_jerk = ExerciseCategory.create(:category => "Push Jerk")
snatch = ExerciseCategory.create(:category => "Snatch")
power_snatch = ExerciseCategory.create(:category => "Power Snatch")
dumbbell_snatch = ExerciseCategory.create(:category => "Dumbbell Snatch")
press = ExerciseCategory.create(:category => "Press")
push_press = ExerciseCategory.create(:category => "Push-press")
bench = ExerciseCategory.create(:category => "Bench")
deadlift = ExerciseCategory.create(:category => "Deadlift")
stiff_legged_deadlift = ExerciseCategory.create(:category => "Stiff Legged Deadlift")
sumo_deadlift_highpull = ExerciseCategory.create(:category => "Sumo Deadlift High-pull")
running = ExerciseCategory.create(:category => "Running")
ring_dip = ExerciseCategory.create(:category => "Ring Dip")
back_extension = ExerciseCategory.create(:category => "Back Extension")
double_under = ExerciseCategory.create(:category => "Double Under")
thruster = ExerciseCategory.create(:category => "Thruster")
kbswing = ExerciseCategory.create(:category => "Kettlebell Swing")
wallball = ExerciseCategory.create(:category => "Wall-ball")
box_jump = ExerciseCategory.create(:category => "Box Jump")
row = ExerciseCategory.create(:category => "Row")
musculeup = ExerciseCategory.create(:category => "Muscule-up")
rope_climb = ExerciseCategory.create(:category => "Rope Climb")
barbell_curl = ExerciseCategory.create(:category => "Barbell Curl")
burpee = ExerciseCategory.create(:category => "Burpee")
walking_lunge = ExerciseCategory.create(:category => "Walking Lunge")
knees_to_elbows = ExerciseCategory.create(:category => "Knees to Elbows")
overhead_walk = ExerciseCategory.create(:category => "Overhead Walk")
turkish_getup = ExerciseCategory.create(:category => "Turkish get-up")
swing = ExerciseCategory.create(:category => "Swing")
toes_to_bar = ExerciseCategory.create(:category => "Toes to Bar")
bear_crawl = ExerciseCategory.create(:category => "Bear Crawl")
standing_broadjump = ExerciseCategory.create(:category => "Standing broad-jump")
sandbag = ExerciseCategory.create(:category => "Carry Sandbag")

ExerciseCategory.all.each do |exerciseCategory|
	exerciseCategory.user_id = admin.id
	exerciseCategory.save
end

#GIRLS------------------------------------------------------------------------
angie = Workout.create(:name => "Angie", :description => "For Time. Complete all reps of each exercise before moving to the next.")
angie.workout_category_id = girl.id
angie.user_id = admin.id
angie.save
angie1 = angie.exercises.create(:repetitions => 100)
angie1.exercise_category_id = pullup.id
angie1.user_id = admin.id
angie1.save
angie2 = angie.exercises.create(:repetitions => 100)
angie2.exercise_category_id = pushup.id
angie2.user_id = admin.id
angie2.save
angie3 = angie.exercises.create(:repetitions => 100)
angie3.exercise_category_id = situp.id
angie3.user_id = admin.id
angie3.save
angie4 = angie.exercises.create(:repetitions => 100)
angie4.exercise_category_id = squat.id
angie4.user_id = admin.id
angie4.save

barbara = Workout.create(:name => "Barbara", :description => "5 rounds, time each round. Rest precisely three minutes between each round. ")
barbara.workout_category_id = girl.id
barbara.user_id = admin.id
barbara.save
barbara1 = barbara.exercises.create(:repetitions => 20, :rounds => 5)
barbara1.exercise_category_id = pullup.id
barbara1.user_id = admin.id
barbara1.save
barbara2 = barbara.exercises.create(:repetitions => 30, :rounds => 5)
barbara2.exercise_category_id = pushup.id
barbara2.user_id = admin.id
barbara2.save
barbara3 = barbara.exercises.create(:repetitions => 40, :rounds => 5)
barbara3.exercise_category_id = situp.id
barbara3.user_id = admin.id
barbara3.save
barbara4 = barbara.exercises.create(:repetitions => 50, :rounds => 5)
barbara4.exercise_category_id = squat.id
barbara4.user_id = admin.id
barbara4.save

chelsea = Workout.create(:name => "Chelsea", :description => "Each min on the min for 30 min.")
chelsea.workout_category_id = girl.id
chelsea.user_id = admin.id
chelsea.save
chelsea1 = chelsea.exercises.create(:repetitions => 5, :rounds => 30)
chelsea1.exercise_category_id = pullup.id
chelsea1.user_id = admin.id
chelsea1.save
chelsea2 = chelsea.exercises.create(:repetitions => 10, :rounds => 30)
chelsea2.exercise_category_id = pushup.id
chelsea2.user_id = admin.id
chelsea2.save
chelsea3 = chelsea.exercises.create(:repetitions => 15, :rounds => 30)
chelsea3.exercise_category_id = squat.id
chelsea3.user_id = admin.id
chelsea3.save

cindy = Workout.create(:name => "Cindy", :description => "As many rounds as possible in 20 min.")
cindy.workout_category_id = girl.id
cindy.user_id = admin.id
cindy.save
cindy1 = cindy.exercises.create(:repetitions => 5)
cindy1.exercise_category_id = pullup.id
cindy1.user_id = admin.id
cindy1.save
cindy2 = cindy.exercises.create(:repetitions => 10)
cindy2.exercise_category_id = pushup.id
cindy2.user_id = admin.id
cindy2.save
cindy3 = cindy.exercises.create(:repetitions => 15)
cindy3.exercise_category_id = squat.id
cindy3.user_id = admin.id
cindy3.save

diane = Workout.create(:name => "Diane", :description => "21-15-9 reps, for time.")
diane.workout_category_id = girl.id
diane.user_id = admin.id
diane.save
diane1 = diane.exercises.create(:weight => 225, :units => "pounds", :rounds => 3)
diane1.exercise_category_id = deadlift.id
diane1.user_id = admin.id
diane1.save
diane2 = diane.exercises.create(:rounds => 3)
diane2.exercise_category_id = handstand_pushup.id
diane2.user_id = admin.id
diane2.save

elizabeth = Workout.create(:name => "Elizabeth", :description => "21-15-9 reps, for time.")
elizabeth.workout_category_id = girl.id
elizabeth.user_id = admin.id
elizabeth.save
elizabeth1 = elizabeth.exercises.create(:weight => 135, :units => "pounds", :rounds => 3)
elizabeth1.exercise_category_id = clean.id
elizabeth1.user_id = admin.id
elizabeth1.save
elizabeth2 = elizabeth.exercises.create(:rounds => 3)
elizabeth2.exercise_category_id = ring_dip.id
elizabeth2.user_id = admin.id
elizabeth2.save

fran = Workout.create(:name => "Fran", :description => "21-15-9 reps, for time.")
fran.workout_category_id = girl.id
fran.user_id = admin.id
fran.save
fran1 = fran.exercises.create(:weight => 95, :units => "pounds")
fran1.exercise_category_id = thruster.id
fran1.user_id = admin.id
fran1.save
fran2 = fran.exercises.create
fran2.exercise_category_id = pullup.id
fran2.user_id = admin.id
fran2.save

grace = Workout.create(:name => "Grace", :description => "30 reps for time.")
grace.workout_category_id = girl.id
grace.user_id = admin.id
grace.save
grace1 = grace.exercises.create(:repetitions => 30, :weight => 135, :units => "pounds")
grace1.exercise_category_id = clean_and_jerk.id
grace1.user_id = admin.id
grace1.save

helen = Workout.create(:name => "Helen", :description => "3 reps for time.")
helen.workout_category_id = girl.id
helen.user_id = admin.id
helen.save
helen1 = helen.exercises.create(:distance => 400, :units => "meters")
helen1.exercise_category_id = running.id
helen1.user_id = admin.id
helen1.save
helen2 = helen.exercises.create(:repetitions => 21, :weight => 1.5, :units => "pood")
helen2.exercise_category_id = kbswing.id
helen2.user_id = admin.id
helen2.save
helen3 = helen.exercises.create(:repetitions => 12)
helen3.exercise_category_id = pullup.id
helen3.user_id = admin.id
helen3.save

isabel = Workout.create(:name => "Isabel", :description => "30 reps for time.")
isabel.workout_category_id = girl.id
isabel.user_id = admin.id
isabel.save
isabel1 = isabel.exercises.create(:repetitions => 30, :weight => 135, :units => "pounds")
isabel1.exercise_category_id = snatch.id
isabel1.user_id = admin.id
isabel1.save

jackie = Workout.create(:name => "Jackie", :description => "For time.")
jackie.workout_category_id = girl.id
jackie.user_id = admin.id
jackie.save
jackie1 = jackie.exercises.create(:distance => 30, :units => "meters")
jackie1.exercise_category_id = row.id
jackie1.user_id = admin.id
jackie1.save
jackie2= jackie.exercises.create(:repetitions => 50, :weight => 45, :units => "pounds")
jackie2.exercise_category_id = thruster.id
jackie2.user_id = admin.id
jackie2.save
jackie3 = jackie.exercises.create(:repetitions => 30)
jackie3.exercise_category_id = pullup.id
jackie3.user_id = admin.id
jackie3.save

karen = Workout.create(:name => "Karen", :description => "For time.")
karen.workout_category_id = girl.id
karen.user_id = admin.id
karen.save
karen1 = karen.exercises.create(:repetitions => 150)
karen1.exercise_category_id = wallball.id
karen1.user_id = admin.id
karen1.save

linda = Workout.create(:name => "Linda", :description => "10/9/8/7/6/5/4/3/2/1 reps. Rounds for time.")
linda.workout_category_id = girl.id
linda.user_id = admin.id
linda.save
linda1 = linda.exercises.create(:description => "1.5x body weight")
linda1.exercise_category_id = deadlift.id
linda1.user_id = admin.id
linda1.save
linda2 = linda.exercises.create(:description => "1x body weight")
linda2.exercise_category_id = bench.id
linda2.user_id = admin.id
linda2.save
linda3 = linda.exercises.create(:description => ".75x body weight")
linda3.exercise_category_id = clean.id
linda3.user_id = admin.id
linda3.save

mary = Workout.create(:name => "Mary", :description => "As many rounds as possible in 20 min.")
mary.workout_category_id = girl.id
mary.user_id = admin.id
mary.save
mary1 = mary.exercises.create(:repetitions => 5)
mary1.exercise_category_id = handstand_pushup.id
mary1.user_id = admin.id
mary1.save
mary2 = mary.exercises.create(:repetitions => 10)
mary2.exercise_category_id = one_legged_squat.id
mary2.user_id = admin.id
mary2.save
mary3 = mary.exercises.create(:repetitions => 15)
mary3.exercise_category_id = pullup.id
mary3.user_id = admin.id
mary3.save

nancy = Workout.create(:name => "Nancy", :description => "5 rounds for time.")
nancy.workout_category_id = girl.id
nancy.user_id = admin.id
nancy.save
nancy1 = nancy.exercises.create(:distance => 400, :rounds => 5, :units => "meters")
nancy1.exercise_category_id = running.id
nancy1.user_id = admin.id
nancy1.save
nancy2 = nancy.exercises.create(:repetitions => 15, :weight => 95, :rounds => 5, :units => "pounds")
nancy2.exercise_category_id = overhead_squat.id
nancy2.user_id = admin.id
nancy2.save

annie = Workout.create(:name => "Annie", :description => "50-40-30-20 and 10 rep rounds; for time.")
annie.workout_category_id = girl.id
annie.user_id = admin.id
annie.save
annie1 = annie.exercises.create(:rounds => 5)
annie1.exercise_category_id = double_under.id
annie1.user_id = admin.id
annie1.save
annie2 = annie.exercises.create(:rounds => 5)
annie2.exercise_category_id = situp.id
annie2.user_id = admin.id
annie2.save

eva = Workout.create(:name => "Eva", :description => "5 rounds for time.")
eva.workout_category_id = girl.id
eva.user_id = admin.id
eva.save
eva1 = eva.exercises.create(:distance => 800, :rounds => 5, :units => "meters")
eva1.exercise_category_id = running.id
eva1.user_id = admin.id
eva1.save
eva2 = eva.exercises.create(:repetitions => 30, :weight => 2, :rounds => 5, :units => "pood")
eva2.exercise_category_id = kbswing.id
eva2.user_id = admin.id
eva2.save
eva3 = eva.exercises.create(:repetitions => 30, :rounds => 5)
eva3.exercise_category_id = pullup.id
eva3.user_id = admin.id
eva3.save

kelly = Workout.create(:name => "Kelly", :description => "5 rounds for time.")
kelly.workout_category_id = girl.id
kelly.user_id = admin.id
kelly.save
kelly1 = kelly.exercises.create(:distance => 400, :rounds => 5, :units => "meters")
kelly1.exercise_category_id = running.id
kelly1.user_id = admin.id
kelly1.save
kelly2 = kelly.exercises.create(:repetitions => 30, :rounds => 5, :description => "24 inch box")
kelly2.exercise_category_id = box_jump.id
kelly2.user_id = admin.id
kelly2.save
kelly3 = kelly.exercises.create(:repetitions => 30, :weight => 20, :rounds => 5, :units => "pounds")
kelly3.exercise_category_id = wallball.id
kelly3.user_id = admin.id
kelly3.save

lynne = Workout.create(:name => "Lynne", :description => "5 rounds for max reps.")
lynne.workout_category_id = girl.id
lynne.user_id = admin.id
lynne.save
lynne1 = lynne.exercises.create(:description => "1x body weight")
lynne1.exercise_category_id = bench.id
lynne1.user_id = admin.id
lynne1.save
lynne2 = lynne.exercises.create
lynne2.exercise_category_id = pullup.id
lynne2.user_id = admin.id
lynne2.save

nicole = Workout.create(:name => "Nicole", :description => "As many rounds as possible in 20 minutes. Note number of pull-ups completed for each round. ")
nicole.workout_category_id = girl.id
nicole.user_id = admin.id
nicole.save
nicole1 = nicole.exercises.create(:distance => 400, :units => "meters")
nicole1.exercise_category_id = running.id
nicole1.user_id = admin.id
nicole1.save
nicole2 = nicole.exercises.create
nicole2.exercise_category_id = pullup.id
nicole2.user_id = admin.id
nicole2.save

amanda = Workout.create(:name => "Amanda", :description => "9, 7 and 5 reps, for time.")
amanda.workout_category_id = girl.id
amanda.user_id = admin.id
amanda.save
amanda1 = amanda.exercises.create
amanda1.exercise_category_id = musculeup.id
amanda1.user_id = admin.id
amanda1.save
amanda2 = amanda.exercises.create(:weight => 135, :units => "pounds")
amanda2.exercise_category_id = snatch.id
amanda2.user_id = admin.id
amanda2.save

#HEROES-----------------------------------------------------------------------
jt = Workout.create(:name => "JT", :description => "21-15-9 reps, for time.")
jt.workout_category_id = hero.id
jt.user_id = admin.id
jt.save
jt1 = jt.exercises.create(:rounds => 3)
jt1.exercise_category_id = handstand_pushup.id
jt1.user_id = admin.id
jt1.save
jt2 = jt.exercises.create(:rounds => 3)
jt2.exercise_category_id = ring_dip.id
jt2.user_id = admin.id
jt2.save
jt3 = jt.exercises.create(:rounds => 3)
jt3.exercise_category_id = pushup.id
jt3.user_id = admin.id
jt3.save

michael = Workout.create(:name => "Michael", :description => "3 rounds for time.")
michael.workout_category_id = hero.id
michael.user_id = admin.id
michael.save
michael1 = michael.exercises.create(:distance => 800, :rounds => 3, :units => "meters")
michael1.exercise_category_id = running.id
michael1.user_id = admin.id
michael1.save
michael2 = michael.exercises.create(:repetitions => 50, :rounds => 3)
michael2.exercise_category_id = back_extension.id
michael2.user_id = admin.id
michael2.save
michael3 = michael.exercises.create(:repetitions => 50, :rounds => 3)
michael3.exercise_category_id = situp.id
michael3.user_id = admin.id
michael3.save

murph = Workout.create(:name => "Murph", :description => "For time.
Partition the pull-ups, push-ups, and squats as needed. Start and finish with a mile run. If you've got a twenty pound vest or body armor, wear it.")
murph.workout_category_id = hero.id
murph.user_id = admin.id
murph.save
murph1 = murph.exercises.create(:distance => 1, :units => "mile")
murph1.exercise_category_id = running.id
murph1.user_id = admin.id
murph1.save
murph2 = murph.exercises.create(:repetitions => 100)
murph2.exercise_category_id = pullup.id
murph2.save
murph3 = murph.exercises.create(:repetitions => 200)
murph3.exercise_category_id = pushup.id
murph3.user_id = admin.id
murph3.save
murph4 = murph.exercises.create(:repetitions => 300)
murph4.exercise_category_id = squat.id
murph4.user_id = admin.id
murph4.save
murph5 = murph.exercises.create(:distance => 1, :units => "mile")
murph5.exercise_category_id = running.id
murph5.user_id = admin.id
murph5.save

daniel = Workout.create(:name => "Daniel", :description => "For time.")
daniel.workout_category_id = hero.id
daniel.user_id = admin.id
daniel.save
daniel1 = daniel.exercises.create(:repetitions => 50)
daniel1.exercise_category_id = pullup.id
daniel1.user_id = admin.id
daniel1.save
daniel2 = daniel.exercises.create(:distance => 400, :units => "meters")
daniel2.exercise_category_id = running.id
daniel2.user_id = admin.id
daniel2.save
daniel3 = daniel.exercises.create(:repetitions => 21, :weight => 95, :units => "pounds")
daniel3.exercise_category_id = thruster.id
daniel3.user_id = admin.id
daniel3.save
daniel4 = daniel.exercises.create(:distance => 800, :units => "meters")
daniel4.exercise_category_id = running.id
daniel4.user_id = admin.id
daniel4.save
daniel5 = daniel.exercises.create(:repetitions => 21, :weight => 95, :units => "pounds")
daniel5.exercise_category_id = thruster.id
daniel5.user_id = admin.id
daniel5.save
daniel6 = daniel.exercises.create(:distance => 400, :units => "meters")
daniel6.exercise_category_id = running.id
daniel6.user_id = admin.id
daniel6.save
daniel7 = daniel.exercises.create(:repetitions => 50)
daniel7.exercise_category_id = pullup.id
daniel7.user_id = admin.id
daniel7.save

josh = Workout.create(:name => "Josh", :description => "For time.")
josh.workout_category_id = hero.id
josh.user_id = admin.id
josh.save
josh1 = josh.exercises.create(:repetitions => 21, :weight => 95, :units => "pounds")
josh1.exercise_category_id = overhead_squat.id
josh1.user_id = admin.id
josh1.save
josh2 = josh.exercises.create(:repetitions => 42)
josh2.exercise_category_id = pullup.id
josh2.user_id = admin.id
josh2.save
josh3 = josh.exercises.create(:repetitions => 15, :weight => 95, :units => "pounds")
josh3.exercise_category_id = overhead_squat.id
josh3.user_id = admin.id
josh3.save
josh4 = josh.exercises.create(:repetitions => 30)
josh4.exercise_category_id = pullup.id
josh4.user_id = admin.id
josh4.save
josh5 = josh.exercises.create(:repetitions => 9, :weight => 95, :units => "pounds")
josh5.exercise_category_id = overhead_squat.id
josh5.user_id = admin.id
josh5.save
josh6 = josh.exercises.create(:repetitions => 18)
josh6.exercise_category_id = pullup.id
josh6.user_id = admin.id
josh6.save

jason = Workout.create(:name => "Jason", :description => "For time.")
jason.workout_category_id = hero.id
jason.user_id = admin.id
jason.save
jason1 = jason.exercises.create(:repetitions => 100)
jason1.exercise_category_id = squat.id
jason1.user_id = admin.id
jason1.save
jason2 = jason.exercises.create(:repetitions => 5)
jason2.exercise_category_id = musculeup.id
jason2.user_id = admin.id
jason2.save
jason3 = jason.exercises.create(:repetitions => 75)
jason3.exercise_category_id = squat.id
jason3.user_id = admin.id
jason3.save
jason4 = jason.exercises.create(:repetitions => 10)
jason4.exercise_category_id = musculeup.id
jason4.user_id = admin.id
jason4.save
jason5 = jason.exercises.create(:repetitions => 50)
jason5.exercise_category_id = squat.id
jason5.user_id = admin.id
jason5.save
jason6 = jason.exercises.create(:repetitions => 15)
jason6.exercise_category_id = musculeup.id
jason6.user_id = admin.id
jason6.save
jason7 = jason.exercises.create(:repetitions => 25)
jason7.exercise_category_id = squat.id
jason7.user_id = admin.id
jason7.save
jason8 = jason.exercises.create(:repetitions => 20)
jason8.exercise_category_id = musculeup.id
jason8.user_id = admin.id
jason8.save

badger = Workout.create(:name => "Badger", :description => "3 rounds for time.")
badger.workout_category_id = hero.id
badger.user_id = admin.id
badger.save
badger1 = badger.exercises.create(:repetitions => 30, :weight => 95, :rounds => 3, :units => "pounds")
badger1.exercise_category_id = squat_clean.id
badger1.user_id = admin.id
badger1.save
badger2 = badger.exercises.create(:repetitions => 30, :rounds => 3)
badger2.exercise_category_id = pullup.id
badger2.user_id = admin.id
badger2.save
badger3 = badger.exercises.create(:distance => 800, :rounds => 3, :units => "meters")
badger3.exercise_category_id = running.id
badger3.user_id = admin.id
badger3.save

joshie = Workout.create(:name => "Joshie", :description => "3 rounds for time. The snatches are full squat snatches.")
joshie.workout_category_id = hero.id
joshie.user_id = admin.id
joshie.save
joshie1 = joshie.exercises.create(:repetitions => 21, :weight => 40, :rounds => 3, :units => "pounds", :description => "right arm")
joshie1.exercise_category_id = dumbbell_snatch.id
joshie1.user_id = admin.id
joshie1.save
joshie2 = joshie.exercises.create(:repetitions => 21, :rounds => 3)
joshie2.exercise_category_id = l_pullup.id
joshie2.user_id = admin.id
joshie2.save
joshie3 = joshie.exercises.create(:repetitions => 21, :weight => 40, :rounds => 3, :units => "pounds", :description => "left arm")
joshie3.exercise_category_id = dumbbell_snatch.id
joshie3.user_id = admin.id
joshie3.save
joshie4 = joshie.exercises.create(:repetitions => 21, :rounds => 3)
joshie4.exercise_category_id = l_pullup.id
joshie4.user_id = admin.id
joshie4.save

nate = Workout.create(:name => "Nate", :description => "As many rounds as possible in 20 minutes.")
nate.workout_category_id = hero.id
nate.user_id = admin.id
nate.save
nate1 = nate.exercises.create(:repetitions => 2)
nate1.exercise_category_id = musculeup.id
nate1.user_id = admin.id
nate1.save
nate2 = nate.exercises.create(:repetitions => 4)
nate2.exercise_category_id = handstand_pushup.id
nate2.user_id = admin.id
nate2.save
nate3 = nate.exercises.create(:repetitions => 8, :weight => 2, :units => "pood")
nate3.exercise_category_id = kbswing.id
nate3.user_id = admin.id
nate3.save

randy = Workout.create(:name => "Randy", :description => "For time.")
randy.workout_category_id = hero.id
randy.user_id = admin.id
randy.save
randy1 = randy.exercises.create(:repetitions => 75)
randy1.exercise_category_id = power_snatch.id
randy1.user_id = admin.id
randy1.save

tommyV = Workout.create(:name => "Tommy V", :description => "For time.")
tommyV.workout_category_id = hero.id
tommyV.user_id = admin.id
tommyV.save
tommyV1 = tommyV.exercises.create(:repetitions => 21, :weight => 115, :units => "pounds")
tommyV1.exercise_category_id = thruster.id
tommyV1.user_id = admin.id
tommyV1.save
tommyV2 = tommyV.exercises.create(:repetitions => 12, :distance => 15, :units => "feet")
tommyV2.exercise_category_id = rope_climb.id
tommyV2.user_id = admin.id
tommyV2.save
tommyV3 = tommyV.exercises.create(:repetitions => 15, :weight => 115, :units => "pounds")
tommyV3.exercise_category_id = thruster.id
tommyV3.user_id = admin.id
tommyV3.save
tommyV4 = tommyV.exercises.create(:repetitions => 9, :distance => 15, :units => "feet")
tommyV4.exercise_category_id = rope_climb.id
tommyV4.user_id = admin.id
tommyV4.save
tommyV5 = tommyV.exercises.create(:repetitions => 9, :weight => 115, :units => "pounds")
tommyV5.exercise_category_id = thruster.id
tommyV5.user_id = admin.id
tommyV5.save
tommyV6 = tommyV.exercises.create(:repetitions => 6, :distance => 15, :units => "feet")
tommyV6.exercise_category_id = rope_climb.id
tommyV6.user_id = admin.id
tommyV6.save


griff = Workout.create(:name => "Griff", :description => "For time.")
griff.workout_category_id = hero.id
griff.user_id = admin.id
griff.save
griff1 = griff.exercises.create(:distance => 800, :units => "meters")
griff1.exercise_category_id = running.id
griff1.user_id = admin.id
griff1.save
griff2 = griff.exercises.create(:distance => 400, :units => "meters", :description => "backwards")
griff2.exercise_category_id = running.id
griff2.user_id = admin.id
griff2.save
griff3 = griff.exercises.create(:distance => 800, :units => "meters")
griff3.exercise_category_id = running.id
griff3.user_id = admin.id
griff3.save
griff4 = griff.exercises.create(:distance => 400, :units => "meters", :description => "backwards")
griff4.exercise_category_id = running.id
griff4.user_id = admin.id
griff4.save

ryan = Workout.create(:name => "Ryan", :description => "5 rounds for time.")
ryan.workout_category_id = hero.id
ryan.user_id = admin.id
ryan.save
ryan1 = ryan.exercises.create(:repetitions => 7, :rounds => 5)
ryan1.exercise_category_id = musculeup.id
ryan1.user_id = admin.id
ryan1.save
ryan2 = ryan.exercises.create(:repetitions => 21, :rounds => 5, :description => "Each burpee terminates with a jump one foot above max standing reach.")
ryan2.exercise_category_id = burpee.id
ryan2.user_id = admin.id
ryan2.save

erin = Workout.create(:name => "Erin", :description => "For time.")
erin.workout_category_id = hero.id
erin.user_id = admin.id
erin.save
erin1 = erin.exercises.create(:repetitions => 15, :weight => 40, :rounds => 5, :units => "pounds")
erin1.exercise_category_id = dumbbell_split_clean.id
erin1.user_id = admin.id
erin1.save
erin2 = erin.exercises.create(:repetitions => 21, :rounds => 5)
erin2.exercise_category_id = pullup.id
erin2.user_id = admin.id
erin2.save

mrjoshua = Workout.create(:name => "Mr. Joshua", :description => "For time.")
mrjoshua.workout_category_id = hero.id
mrjoshua.user_id = admin.id
mrjoshua.save
mrjoshua1 = mrjoshua.exercises.create(:distance => 400, :units => "meters")
mrjoshua1.exercise_category_id = dumbbell_split_clean.id
mrjoshua1.user_id = admin.id
mrjoshua1.save
mrjoshua2 = mrjoshua.exercises.create(:repetitions => 30)
mrjoshua2.exercise_category_id = gluteham_situp.id
mrjoshua2.user_id = admin.id
mrjoshua2.save
mrjoshua3 = mrjoshua.exercises.create(:repetitions => 15, :weight => 250, :units => "pounds")
mrjoshua3.exercise_category_id = deadlift.id
mrjoshua3.user_id = admin.id
mrjoshua3.save

dt = Workout.create(:name => "DT", :description => "5 rounds for time.")
dt.workout_category_id = hero.id
dt.user_id = admin.id
dt.save
dt1 = dt.exercises.create(:repetitions => 12, :weight => 155, :units => "pounds")
dt1.exercise_category_id = deadlift.id
dt1.user_id = admin.id
dt1.save
dt2 = dt.exercises.create(:repetitions => 9, :weight => 155, :units => "pounds")
dt2.exercise_category_id = power_clean.id
dt2.user_id = admin.id
dt2.save
dt3 = dt.exercises.create(:repetitions => 6, :weight => 155, :units => "pounds")
dt3.exercise_category_id = push_jerk.id
dt3.user_id = admin.id
dt3.save

danny = Workout.create(:name => "Danny", :description => "As many rounds as possible in 20 min.")
danny.workout_category_id = hero.id
danny.user_id = admin.id
danny.save
danny1 = danny.exercises.create(:repetitions => 30, :description => "24 inch box")
danny1.exercise_category_id = box_jump.id
danny1.user_id = admin.id
danny1.save
danny2 = danny.exercises.create(:repetitions => 20, :weight => 115, :units => "pounds")
danny2.exercise_category_id = push_press.id
danny2.user_id = admin.id
danny2.save
danny3 = danny.exercises.create(:repetitions => 30)
danny3.exercise_category_id = pullup.id
danny3.user_id = admin.id
danny3.save

hansen = Workout.create(:name => "Hansen", :description => "For time.")
hansen.workout_category_id = hero.id
hansen.user_id = admin.id
hansen.save
hansen1 = hansen.exercises.create(:repetitions => 30, :weight => 2, :units => "pood")
hansen1.exercise_category_id = kbswing.id
hansen1.user_id = admin.id
hansen1.save
hansen2 = hansen.exercises.create(:repetitions => 30)
hansen2.exercise_category_id = burpee.id
hansen2.user_id = admin.id
hansen2.save
hansen3 = hansen.exercises.create(:repetitions => 30)
hansen3.exercise_category_id = gluteham_situp.id
hansen3.user_id = admin.id
hansen3.save

tyler = Workout.create(:name => "Tyler", :description => "For time.")
tyler.workout_category_id = hero.id
tyler.user_id = admin.id
tyler.save
tyler1 = tyler.exercises.create(:repetitions => 7)
tyler1.exercise_category_id = musculeup.id
tyler1.user_id = admin.id
tyler1.save
tyler2 = tyler.exercises.create(:repetitions => 21, :weight => 95, :units => "pounds")
tyler2.exercise_category_id = sumo_deadlift_highpull.id
tyler2.user_id = admin.id
tyler2.save

lumberjack20 = Workout.create(:name => "Lumberjack 20", :description => "For time.")
lumberjack20.workout_category_id = hero.id
lumberjack20.user_id = admin.id
lumberjack20.save
lumberjack201 = lumberjack20.exercises.create(:repetitions => 20, :weight => 275, :units => "pounds")
lumberjack201.exercise_category_id = deadlift.id
lumberjack201.user_id = admin.id
lumberjack201.save
lumberjack202 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack202.exercise_category_id = running.id
lumberjack202.user_id = admin.id
lumberjack202.save
lumberjack203 = lumberjack20.exercises.create(:repetitions => 20, :weight => 2, :units => "pood")
lumberjack203.exercise_category_id = kbswing.id
lumberjack203.user_id = admin.id
lumberjack203.save
lumberjack204 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack204.exercise_category_id = running.id
lumberjack204.user_id = admin.id
lumberjack204.save
lumberjack205 = lumberjack20.exercises.create(:repetitions => 20)
lumberjack205.exercise_category_id = overhead_squat.id
lumberjack205.user_id = admin.id
lumberjack205.save
lumberjack206 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack206.exercise_category_id = running.id
lumberjack206.user_id = admin.id
lumberjack206.save
lumberjack207 = lumberjack20.exercises.create(:repetitions => 20)
lumberjack207.exercise_category_id = burpee.id
lumberjack207.user_id = admin.id
lumberjack207.save
lumberjack208 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack208.exercise_category_id = running.id
lumberjack208.user_id = admin.id
lumberjack208.save
lumberjack209 = lumberjack20.exercises.create(:repetitions => 20, :description => "chest to bar")
lumberjack209.exercise_category_id = pullup.id
lumberjack209.user_id = admin.id
lumberjack209.save
lumberjack2010 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack2010.exercise_category_id = running.id
lumberjack2010.user_id = admin.id
lumberjack2010.save
lumberjack2011 = lumberjack20.exercises.create(:repetitions => 20, :description => "24 inch box")
lumberjack2011.exercise_category_id = box_jump.id
lumberjack2011.user_id = admin.id
lumberjack2011.save
lumberjack2012 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack2012.exercise_category_id = running.id
lumberjack2012.user_id = admin.id
lumberjack2012.save
lumberjack2013 = lumberjack20.exercises.create(:repetitions => 20, :weight => 45, :units => "pounds")
lumberjack2013.exercise_category_id = dumbbell_squat_clean.id
lumberjack2013.user_id = admin.id
lumberjack2013.save
lumberjack2014 = lumberjack20.exercises.create(:distance => 400, :units => "meters")
lumberjack2014.exercise_category_id = running.id
lumberjack2014.user_id = admin.id
lumberjack2014.save

stephen = Workout.create(:name => "Stephen", :description => "30-25-20-15-10-5 rep, for time.")
stephen.workout_category_id = hero.id
stephen.user_id = admin.id
stephen.save
stephen1 = stephen.exercises.create
stephen1.exercise_category_id = gluteham_situp.id
stephen1.user_id = admin.id
stephen1.save
stephen2 = stephen.exercises.create
stephen2.exercise_category_id = back_extension.id
stephen2.user_id = admin.id
stephen2.save
stephen3 = stephen.exercises.create
stephen3.exercise_category_id = knees_to_elbows.id
stephen3.user_id = admin.id
stephen3.save
stephen4 = stephen.exercises.create
stephen4.exercise_category_id = stiff_legged_deadlift.id
stephen4.user_id = admin.id
stephen4.save

garrett = Workout.create(:name => "Garrett", :description => "3 rounds for time.")
garrett.workout_category_id = hero.id
garrett.user_id = admin.id
garrett.save
garrett1 = garrett.exercises.create(:repetitions => 75, :rounds => 3)
garrett1.exercise_category_id = squat.id
garrett1.user_id = admin.id
garrett1.save
garrett2 = garrett.exercises.create(:repetitions => 25, :rounds => 3)
garrett2.exercise_category_id = ring_handstand_pushup.id
garrett2.user_id = admin.id
garrett2.save
garrett3 = garrett.exercises.create(:repetitions => 25, :rounds => 3)
garrett3.exercise_category_id = l_pullup.id
garrett3.user_id = admin.id
garrett3.save

warFrank = Workout.create(:name => "War Frank", :description => "3 rounds for time.")
warFrank.workout_category_id = hero.id
warFrank.user_id = admin.id
warFrank.save
warFrank1 = warFrank.exercises.create(:repetitions => 25, :rounds => 3)
warFrank1.exercise_category_id = musculeup.id
warFrank1.user_id = admin.id
warFrank1.save
warFrank2 = warFrank.exercises.create(:repetitions => 100, :rounds => 3)
warFrank2.exercise_category_id = squat.id
warFrank2.user_id = admin.id
warFrank2.save
warFrank3 = warFrank.exercises.create(:repetitions => 35, :rounds => 3)
warFrank3.exercise_category_id = gluteham_situp.id
warFrank3.user_id = admin.id
warFrank3.save

mcghee = Workout.create(:name => "Mcghee", :description => "As many rounds as possible in 30 min.")
mcghee.workout_category_id = hero.id
mcghee.user_id = admin.id
mcghee.save
mcghee1 = mcghee.exercises.create(:repetitions => 5, :weight => 275, :units => "pounds")
mcghee1.exercise_category_id = deadlift.id
mcghee1.user_id = admin.id
mcghee1.save
mcghee2 = mcghee.exercises.create(:repetitions => 13)
mcghee2.exercise_category_id = pushup.id
mcghee2.user_id = admin.id
mcghee2.save
mcghee3 = mcghee.exercises.create(:repetitions => 9, :description => "24 inch box")
mcghee3.exercise_category_id = box_jump.id
mcghee3.user_id = admin.id
mcghee3.save

paul = Workout.create(:name => "Paul", :description => "5 rounds for time.")
paul.workout_category_id = hero.id
paul.user_id = admin.id
paul.save
paul1 = paul.exercises.create(:repetitions => 50, :rounds => 5)
paul1.exercise_category_id = double_under.id
paul1.user_id = admin.id
paul1.save
paul2 = paul.exercises.create(:repetitions => 35, :rounds => 5)
paul2.exercise_category_id = knees_to_elbows.id
paul2.user_id = admin.id
paul2.save
paul3 = paul.exercises.create(:distance => 20, :weight => 185, :units => "yards, pounds")
paul3.exercise_category_id = overhead_walk.id
paul3.user_id = admin.id
paul3.save

jerry = Workout.create(:name => "Jerry", :description => "For time.")
jerry.workout_category_id = hero.id
jerry.user_id = admin.id
jerry.save
jerry1 = jerry.exercises.create(:repetitions => 1, :units => "mile")
jerry1.exercise_category_id = running.id
jerry1.user_id = admin.id
jerry1.save
jerry2 = jerry.exercises.create(:distance => 2000)
jerry2.exercise_category_id = row.id
jerry2.user_id = admin.id
jerry2.save
jerry3 = jerry.exercises.create(:repetitions => 1, :units => "mile")
jerry3.exercise_category_id = running.id
jerry3.user_id = admin.id
jerry3.save

nutts = Workout.create(:name => "Nutts", :description => "For time.")
nutts.workout_category_id = hero.id
nutts.user_id = admin.id
nutts.save
nutts1 = nutts.exercises.create(:repetitions => 10)
nutts1.exercise_category_id = handstand_pushup.id
nutts1.user_id = admin.id
nutts1.save
nutts2 = nutts.exercises.create(:repetitions => 15, :weight => 250, :units => "pounds")
nutts2.exercise_category_id = deadlift.id
nutts2.user_id = admin.id
nutts2.save
nutts3 = nutts.exercises.create(:repetitions => 25, :description => "30 inch box")
nutts3.exercise_category_id = box_jump.id
nutts3.user_id = admin.id
nutts3.save
nutts4 = nutts.exercises.create(:repetitions => 50)
nutts4.exercise_category_id = pullup.id
nutts4.user_id = admin.id
nutts4.save
nutts5 = nutts.exercises.create(:repetitions => 100, :weight => 20, :units => "pounds", :description => "10 ft target")
nutts5.exercise_category_id = wallball.id
nutts5.user_id = admin.id
nutts5.save
nutts6 = nutts.exercises.create(:repetitions => 200)
nutts6.exercise_category_id = double_under.id
nutts6.user_id = admin.id
nutts6.save
nutts7 = nutts.exercises.create(:distance => 400, :units => "meters", :description => "with a 45 pound plate")
nutts7.exercise_category_id = running.id
nutts7.user_id = admin.id
nutts7.save

arnie = Workout.create(:name => "Arnie", :description => "With a single 2 pood kettlebell, for time.")
arnie.workout_category_id = hero.id
arnie.user_id = admin.id
arnie.save
arnie1 = arnie.exercises.create(:repetitions => 21, :description => "right arm")
arnie1.exercise_category_id = turkish_getup.id
arnie1.user_id = admin.id
arnie1.save
arnie2 = arnie.exercises.create(:repetitions => 50)
arnie2.exercise_category_id = swing.id
arnie2.user_id = admin.id
arnie2.save
arnie3 = arnie.exercises.create(:repetitions => 21, :description => "left arm")
arnie3.exercise_category_id = overhead_squat.id
arnie3.user_id = admin.id
arnie3.save
arnie4 = arnie.exercises.create(:repetitions => 50)
arnie4.exercise_category_id = swing.id
arnie4.user_id = admin.id
arnie4.save
arnie5 = arnie.exercises.create(:repetitions => 21, :description => "right arm")
arnie5.exercise_category_id = overhead_squat.id
arnie5.user_id = admin.id
arnie5.save
arnie6 = arnie.exercises.create(:repetitions => 50)
arnie6.exercise_category_id = swing.id
arnie6.user_id = admin.id
arnie6.save
arnie7 = arnie.exercises.create(:repetitions => 21, :description => "left arm")
arnie7.exercise_category_id = turkish_getup.id
arnie7.user_id = admin.id
arnie7.save

theSeven = Workout.create(:name => "The Seven", :description => "7 rounds for time.")
theSeven.workout_category_id = hero.id
theSeven.user_id = admin.id
theSeven.save
theSeven1 = theSeven.exercises.create(:repetitions => 7, :rounds => 7)
theSeven1.exercise_category_id = handstand_pushup.id
theSeven1.user_id = admin.id
theSeven1.save
theSeven2 = theSeven.exercises.create(:repetitions => 7, :weight => 135, :rounds => 7, :units => "pounds")
theSeven2.exercise_category_id = thruster.id
theSeven2.user_id = admin.id
theSeven2.save
theSeven3 = theSeven.exercises.create(:repetitions => 7, :rounds => 7)
theSeven3.exercise_category_id = knees_to_elbows.id
theSeven3.user_id = admin.id
theSeven3.save
theSeven4 = theSeven.exercises.create(:repetitions => 7, :weight => 245, :rounds => 7, :units => "pounds")
theSeven4.exercise_category_id = deadlift.id
theSeven4.user_id = admin.id
theSeven4.save
theSeven5 = theSeven.exercises.create(:repetitions => 7, :rounds => 7)
theSeven5.exercise_category_id = burpee.id
theSeven5.user_id = admin.id
theSeven5.save
theSeven6 = theSeven.exercises.create(:repetitions => 7, :weight => 2, :rounds => 7, :units => "pood")
theSeven6.exercise_category_id = kbswing.id
theSeven6.user_id = admin.id
theSeven6.save
theSeven7 = theSeven.exercises.create(:repetitions => 7, :rounds => 7)
theSeven7.exercise_category_id = pullup.id
theSeven7.user_id = admin.id
theSeven7.save

rj = Workout.create(:name => "RJ", :description => "5 rounds for time.")
rj.workout_category_id = hero.id
rj.user_id = admin.id
rj.save
rj1 = rj.exercises.create(:distance => 800, :rounds => 5, :units => "meters")
rj1.exercise_category_id = running.id
rj1.user_id = admin.id
rj1.save
rj2 = rj.exercises.create(:repetitions => 5, :distance => 15, :rounds => 5, :units => "feet")
rj2.exercise_category_id = rope_climb.id
rj2.user_id = admin.id
rj2.save
rj3 = rj.exercises.create(:repetitions => 50, :rounds => 5)
rj3.exercise_category_id = pushup.id
rj3.user_id = admin.id
rj3.save

luce = Workout.create(:name => "Luce", :description => "Wearing a 20 pound vest, three rounds for time.")
luce.workout_category_id = hero.id
luce.user_id = admin.id
luce.save
luce1 = luce.exercises.create(:distance => 1000, :rounds => 3)
luce1.exercise_category_id = running.id
luce1.user_id = admin.id
luce1.save
luce2 = luce.exercises.create(:repetitions => 10, :rounds => 3)
luce2.exercise_category_id = musculeup.id
luce2.user_id = admin.id
luce2.save
luce3 = luce.exercises.create(:repetitions => 100, :rounds => 3)
luce3.exercise_category_id = squat.id
luce3.user_id = admin.id
luce3.save

johnson = Workout.create(:name => "Johnson", :description => "As many rounds as possible in 20 min.")
johnson.workout_category_id = hero.id
johnson.user_id = admin.id
johnson.save
johnson1 = johnson.exercises.create(:repetitions => 9, :weight => 245, :units => "pounds")
johnson1.exercise_category_id = deadlift.id
johnson1.user_id = admin.id
johnson1.save
johnson2 = johnson.exercises.create(:repetitions => 8)
johnson2.exercise_category_id = musculeup.id
johnson2.user_id = admin.id
johnson2.save
johnson3 = johnson.exercises.create(:repetitions => 9, :weight => 155, :units => "pounds")
johnson3.exercise_category_id = squat_clean.id
johnson3.user_id = admin.id
johnson3.save

roy = Workout.create(:name => "Roy", :description => "5 rounds for time.")
roy.workout_category_id = hero.id
roy.user_id = admin.id
roy.save
roy1 = roy.exercises.create(:repetitions => 15, :weight => 225, :rounds => 5, :units => "pounds")
roy1.exercise_category_id = deadlift.id
roy1.user_id = admin.id
roy1.save
roy2 = roy.exercises.create(:repetitions => 20, :rounds => 5, :description => "24 inch box")
roy2.exercise_category_id = box_jump.id
roy2.user_id = admin.id
roy2.save
roy3 = roy.exercises.create(:repetitions => 25)
roy3.exercise_category_id = pullup.id
roy3.user_id = admin.id
roy3.save

adamBrown = Workout.create(:name => "Adam Brown", :description => "2 rounds for time.")
adamBrown.workout_category_id = hero.id
adamBrown.user_id = admin.id
adamBrown.save
adamBrown1 = adamBrown.exercises.create(:repetitions => 24, :weight => 295, :rounds => 2, :units => "pounds")
adamBrown1.exercise_category_id = deadlift.id
adamBrown1.user_id = admin.id
adamBrown1.save
adamBrown2 = adamBrown.exercises.create(:repetitions => 24, :rounds => 2, :description => "24 inch box")
adamBrown2.exercise_category_id = box_jump.id
adamBrown2.user_id = admin.id
adamBrown2.save
adamBrown3 = adamBrown.exercises.create(:repetitions => 24, :weight => 20, :rounds => 2, :units => "pounds")
adamBrown3.exercise_category_id = wallball.id
adamBrown3.user_id = admin.id
adamBrown3.save
adamBrown4 = adamBrown.exercises.create(:repetitions => 24, :weight => 195, :rounds => 2, :units => "pounds")
adamBrown4.exercise_category_id = bench.id
adamBrown4.user_id = admin.id
adamBrown4.save
adamBrown5 = adamBrown.exercises.create(:repetitions => 24, :rounds => 2, :description => "24 inch box")
adamBrown5.exercise_category_id = box_jump.id
adamBrown5.user_id = admin.id
adamBrown5.save
adamBrown6 = adamBrown.exercises.create(:repetitions => 24, :weight => 20, :rounds => 2, :units => "pounds")
adamBrown6.exercise_category_id = wallball.id
adamBrown6.user_id = admin.id
adamBrown6.save
adamBrown7 = adamBrown.exercises.create(:repetitions => 24, :weight => 145, :rounds => 2, :units => "pounds")
adamBrown7.exercise_category_id = clean.id
adamBrown7.user_id = admin.id
adamBrown7.save

coe = Workout.create(:name => "Coe", :description => "10 rounds for time.")
coe.workout_category_id = hero.id
coe.user_id = admin.id
coe.save
coe1 = coe.exercises.create(:repetitions => 10, :weight => 95, :rounds => 10, :units => "pounds")
coe1.exercise_category_id = thruster.id
coe1.user_id = admin.id
coe1.save
coe2 = coe.exercises.create(:repetitions => 10)
coe2.exercise_category_id = ring_pushup.id
coe2.user_id = admin.id
coe2.save

severin = Workout.create(:name => "Severin", :description => "For time.")
severin.workout_category_id = hero.id
severin.user_id = admin.id
severin.save
severin1 = severin.exercises.create(:repetitions => 50)
severin1.exercise_category_id = pullup.id
severin1.user_id = admin.id
severin1.save
severin2 = severin.exercises.create(:repetitions => 100, :description => "release hands from floor at the bottom.")
severin2.exercise_category_id = pushup.id
severin2.user_id = admin.id
severin2.save
severin3 = severin.exercises.create(:distance => 5000, :description => "If you've got a twenty pound vest or body armor, wear it.")
severin3.exercise_category_id = running.id
severin3.user_id = admin.id
severin3.save

helton = Workout.create(:name => "Helton", :description => "3 rounds for time.")
helton.workout_category_id = hero.id
helton.user_id = admin.id
helton.save
helton1 = helton.exercises.create(:distance => 800, :rounds => 3, :units => "meters")
helton1.exercise_category_id = running.id
helton1.user_id = admin.id
helton1.save
helton2 = helton.exercises.create(:repetitions => 30, :weight => 50, :units => "pounds")
helton2.exercise_category_id = dumbbell_squat_clean.id
helton2.user_id = admin.id
helton2.save
helton3 = helton.exercises.create(:repetitions => 30)
helton3.exercise_category_id = burpee.id
helton3.user_id = admin.id
helton3.save

jack = Workout.create(:name => "Jack", :description => "As many rounds as possible in 20 min.")
jack.workout_category_id = hero.id
jack.user_id = admin.id
jack.save
jack1 = jack.exercises.create(:repetitions => 10, :weight => 115, :units => "pounds")
jack1.exercise_category_id = push_press.id
jack1.user_id = admin.id
jack1.save
jack2 = jack.exercises.create(:repetitions => 10, :description => "1.5 pood")
jack2.exercise_category_id = kbswing.id
jack2.user_id = admin.id
jack2.save
jack3 = jack.exercises.create(:repetitions => 10, :description => "24 inch box")
jack3.exercise_category_id = box_jump.id
jack3.user_id = admin.id
jack3.save

forrest = Workout.create(:name => "Jack", :description => "3 rounds for time.")
forrest.workout_category_id = hero.id
forrest.user_id = admin.id
forrest.save
forrest1 = forrest.exercises.create(:repetitions => 20, :rounds => 3)
forrest1.exercise_category_id = l_pullup.id
forrest1.user_id = admin.id
forrest1.save
forrest2 = forrest.exercises.create(:repetitions => 30, :rounds => 3)
forrest2.exercise_category_id = toes_to_bar.id
forrest2.user_id = admin.id
forrest2.save
forrest3 = forrest.exercises.create(:repetitions => 40, :rounds => 3)
forrest3.exercise_category_id = burpee.id
forrest3.user_id = admin.id
forrest3.save
forrest4 = forrest.exercises.create(:distance => 800, :rounds => 3, :units => "meters")
forrest4.exercise_category_id = running.id
forrest4.user_id = admin.id
forrest4.save

bulger = Workout.create(:name => "Bulger", :description => "10 rounds for time.")
bulger.workout_category_id = hero.id
bulger.user_id = admin.id
bulger.save
bulger1 = bulger.exercises.create(:distance => 150, :rounds => 10, :units => "meters")
bulger1.exercise_category_id = running.id
bulger1.user_id = admin.id
bulger1.save
bulger2 = bulger.exercises.create(:repetitions => 7, :rounds => 10, :description => "chest to bar")
bulger2.exercise_category_id = pullup.id
bulger2.user_id = admin.id
bulger2.save
bulger3 = bulger.exercises.create(:repetitions => 7, :weight => 135, :rounds => 10)
bulger3.exercise_category_id = front_squat.id
bulger3.user_id = admin.id
bulger3.save
bulger4 = bulger.exercises.create(:repetitions => 7, :rounds => 10)
bulger4.exercise_category_id = handstand_pushup.id
bulger4.user_id = admin.id
bulger4.save

brenton = Workout.create(:name => "Brenton", :description => "5 rounds for time.")
brenton.workout_category_id = hero.id
brenton.user_id = admin.id
brenton.save
brenton1 = brenton.exercises.create(:distance => 100, :rounds => 5, :units => "feet")
brenton1.exercise_category_id = bear_crawl.id
brenton1.user_id = admin.id
brenton1.save
brenton2 = brenton.exercises.create(:distance => 100, :rounds => 5, :units => "feet", :description => "do three burpees after every five broad-jumps. If you've got a twenty pound vest or body armor, wear it.")
brenton2.exercise_category_id = standing_broadjump.id
brenton2.user_id = admin.id
brenton2.save

blake = Workout.create(:name => "Blake", :description => "4 rounds for time.")
blake.workout_category_id = hero.id
blake.user_id = admin.id
blake.save
blake1 = blake.exercises.create(:distance => 100, :rounds => 4, :units => "feet", :description => "45 pound plate held overhead")
blake1.exercise_category_id = walking_lunge.id
blake1.user_id = admin.id
blake1.save
blake2 = blake.exercises.create(:repetitions => 30, :rounds => 4, :description => "24 inch box")
blake2.exercise_category_id = box_jump.id
blake2.user_id = admin.id
blake2.save
blake3 = blake.exercises.create(:repetitions => 20, :weight => 20, :rounds => 4, :units => "pounds")
blake3.exercise_category_id = wallball.id
blake3.user_id = admin.id
blake3.save
blake4 = blake.exercises.create(:repetitions => 10, :rounds => 4)
blake4.exercise_category_id = handstand_pushup.id
blake4.user_id = admin.id
blake4.save

collin = Workout.create(:name => "Collin", :description => "6 rounds for time.")
collin.workout_category_id = hero.id
collin.user_id = admin.id
collin.save
collin1 = collin.exercises.create(:distance => 400, :weight => 50, :rounds => 6, :units => "meters, pounds")
collin1.exercise_category_id = sandbag.id
collin1.user_id = admin.id
collin1.save
collin2 = collin.exercises.create(:repetitions => 12, :weight => 115, :rounds => 6, :units => "pounds")
collin2.exercise_category_id = push_press.id
collin2.user_id = admin.id
collin2.save
collin3 = collin.exercises.create(:repetitions => 12, :rounds => 6, :description => "24 inch box")
collin3.exercise_category_id = box_jump.id
collin3.user_id = admin.id
collin3.save
collin4 = collin.exercises.create(:repetitions => 12, :weight => 95, :rounds => 6, :units => "pounds")
collin4.exercise_category_id = sumo_deadlift_highpull.id
collin4.user_id = admin.id
collin4.save

#WODS-------------------------------------------------------------------------
candy = Workout.create(:name => "Candy", :description => "5 rounds for time.")
candy.workout_category_id = wod.id
candy.user_id = admin.id
candy.save
candy1 = candy.exercises.create(:repetitions => 20, :rounds => 5)
candy1.exercise_category_id = pullup.id
candy1.user_id = admin.id
candy1.save
candy2 = candy.exercises.create(:repetitions => 40, :rounds => 5)
candy2.exercise_category_id = pushup.id
candy2.user_id = admin.id
candy2.save
candy3 = candy.exercises.create(:repetitions => 60, :rounds => 5)
candy3.exercise_category_id = squat.id
candy3.user_id = admin.id
candy3.save

dan = Workout.create(:name => "Dan", :description => "4 rounds for time.")
dan.workout_category_id = wod.id
dan.user_id = admin.id
dan.save
dan1 = dan.exercises.create(:repetitions => 21, :rounds => 4)
dan1.exercise_category_id = overhead_squat.id
dan1.user_id = admin.id
dan1.save
dan2 = dan.exercises.create(:distance => 400, :rounds => 4, :units => "meters")
dan2.exercise_category_id = running.id
dan2.user_id = admin.id
dan2.save

datingSage = Workout.create(:name => "Dating Sage", :description => "5 rounds for time.")
datingSage.workout_category_id = wod.id
datingSage.user_id = admin.id
datingSage.save
datingSage1 = datingSage.exercises.create(:repetitions => 10, :weight => 95, :rounds => 5, :units => "pounds")
datingSage1.exercise_category_id = snatch.id
datingSage1.user_id = admin.id
datingSage1.save
datingSage2 = datingSage.exercises.create(:repetitions => 15, :rounds => 5)
datingSage2.exercise_category_id = pullup.id
datingSage2.user_id = admin.id
datingSage2.save
datingSage3 = datingSage.exercises.create(:repetitions => 20, :weight => 75, :rounds => 5, :units => "pounds")
datingSage3.exercise_category_id = thruster.id
datingSage3.user_id = admin.id
datingSage3.save

easyMary = Workout.create(:name => "Easy Mary", :description => "As many rounds as possible in 20 min.")
easyMary.workout_category_id = wod.id
easyMary.user_id = admin.id
easyMary.save
easyMary1 = easyMary.exercises.create(:repetitions => 5)
easyMary1.exercise_category_id = handstand_pushup.id
easyMary1.user_id = admin.id
easyMary1.save
easyMary2 = easyMary.exercises.create(:repetitions => 10)
easyMary2.exercise_category_id = pullup.id
easyMary2.user_id = admin.id
easyMary2.save
easyMary3 = easyMary.exercises.create(:repetitions => 25)
easyMary3.exercise_category_id = squat.id
easyMary3.user_id = admin.id
easyMary3.save

fracturedFran = Workout.create(:name => "Fractured Fran", :description => "5 rounds for time.")
fracturedFran.workout_category_id = wod.id
fracturedFran.user_id = admin.id
fracturedFran.save
fracturedFran1 = fracturedFran.exercises.create(:repetitions => 9, :weight => 95, :units => "pounds")
fracturedFran1.exercise_category_id = thruster.id
fracturedFran1.user_id = admin.id
fracturedFran1.save
fracturedFran2 = fracturedFran.exercises.create(:repetitions => 9)
fracturedFran2.exercise_category_id = pullup.id
fracturedFran2.user_id = admin.id
fracturedFran2.save

gwen = Workout.create(:name => "Gwen", :description => "15-12-9 reps. Touch and go at floor only. Even a re-grip off the floor is a foul. No dumping. Use same load for each set. Rest as needed between sets.")
gwen.workout_category_id = wod.id
gwen.user_id = admin.id
gwen.save
gwen1 = gwen.exercises.create
gwen1.exercise_category_id = clean_and_jerk.id
gwen1.user_id = admin.id
gwen1.save

jonesworthy = Workout.create(:name => "Jonesworthy", :description => "The workout consists of Squats: 80, 64, 48, 32, 24, 16; KB Swing: 40, 32, 24, 16, 12, 8; Pull ups: 20, 16, 12, 8, 6, 3. First round looks like: 80 squats, 40 KB swings, 20 p/us. Second: 64 squats, 32 KB swings, 16 p/us.")
jonesworthy.workout_category_id = wod.id
jonesworthy.user_id = admin.id
jonesworthy.save
jonesworthy1 = jonesworthy.exercises.create
jonesworthy1.exercise_category_id = squat.id
jonesworthy1.user_id = admin.id
jonesworthy1.save
jonesworthy2 = jonesworthy.exercises.create
jonesworthy2.exercise_category_id = kbswing.id
jonesworthy2.user_id = admin.id
jonesworthy2.save
jonesworthy3 = jonesworthy.exercises.create
jonesworthy3.exercise_category_id = pullup.id
jonesworthy3.user_id = admin.id
jonesworthy3.save

maggie = Workout.create(:name => "Maggie", :description => "5 rounds for time.")
maggie.workout_category_id = wod.id
maggie.user_id = admin.id
maggie.save
maggie1 = maggie.exercises.create(:repetitions => 20)
maggie1.exercise_category_id = handstand_pushup.id
maggie1.user_id = admin.id
maggie1.save
maggie2 = maggie.exercises.create(:repetitions => 40)
maggie2.exercise_category_id = pullup.id
maggie2.user_id = admin.id
maggie2.save
maggie3 = maggie.exercises.create(:repetitions => 60, :description => "alternating legs")
maggie3.exercise_category_id = one_legged_squat.id
maggie3.user_id = admin.id
maggie3.save

nastyGirls = Workout.create(:name => "Nasty Girls", :description => "3 rounds for time.")
nastyGirls.workout_category_id = wod.id
nastyGirls.user_id = admin.id
nastyGirls.save
nastyGirls1 = nastyGirls.exercises.create(:repetitions => 50)
nastyGirls1.exercise_category_id = air_squat.id
nastyGirls1.user_id = admin.id
nastyGirls1.save
nastyGirls2 = nastyGirls.exercises.create(:repetitions => 7)
nastyGirls2.exercise_category_id = musculeup.id
nastyGirls2.user_id = admin.id
nastyGirls2.save
nastyGirls3 = nastyGirls.exercises.create(:repetitions => 10, :weight => 135, :units => "pounds")
nastyGirls3.exercise_category_id = hang_power_clean.id
nastyGirls3.user_id = admin.id
nastyGirls3.save

sOBUDFran = Workout.create(:name => "Strung Out, Backwards, Upside-Down Fran", :description => "For time.")
sOBUDFran.workout_category_id = wod.id
sOBUDFran.user_id = admin.id
sOBUDFran.save
sOBUDFran1 = sOBUDFran.exercises.create(:distance => 1600, :units => "meters")
sOBUDFran1.exercise_category_id = running.id
sOBUDFran1.user_id = admin.id
sOBUDFran1.save
sOBUDFran2 = sOBUDFran.exercises.create(:repetitions => 9)
sOBUDFran2.exercise_category_id = pullup.id
sOBUDFran2.user_id = admin.id
sOBUDFran2.save
sOBUDFran3 = sOBUDFran.exercises.create(:repetitions => 9, :weight => 95, :units => "pounds")
sOBUDFran3.exercise_category_id = thruster.id
sOBUDFran3.user_id = admin.id
sOBUDFran3.save
sOBUDFran4 = sOBUDFran.exercises.create(:distance => 800, :units => "meters")
sOBUDFran4.exercise_category_id = running.id
sOBUDFran4.user_id = admin.id
sOBUDFran4.save
sOBUDFran5 = sOBUDFran.exercises.create(:repetitions => 15)
sOBUDFran5.exercise_category_id = pullup.id
sOBUDFran5.user_id = admin.id
sOBUDFran5.save
sOBUDFran6 = sOBUDFran.exercises.create(:repetitions => 15, :weight => 95, :units => "pounds")
sOBUDFran6.exercise_category_id = thruster.id
sOBUDFran6.user_id = admin.id
sOBUDFran6.save
sOBUDFran7 = sOBUDFran.exercises.create(:distance => 400, :units => "meters")
sOBUDFran7.exercise_category_id = running.id
sOBUDFran7.user_id = admin.id
sOBUDFran7.save
sOBUDFran8 = sOBUDFran.exercises.create(:repetitions => 21)
sOBUDFran8.exercise_category_id = pullup.id
sOBUDFran8.user_id = admin.id
sOBUDFran8.save
sOBUDFran9 = sOBUDFran.exercises.create(:repetitions => 21, :weight => 95, :units => "pounds")
sOBUDFran9.exercise_category_id = thruster.id
sOBUDFran9.user_id = admin.id
sOBUDFran9.save

upsideDownAngie = Workout.create(:name => "Upside-Down Angie", :description => "For time. 10 Pull Ups , Push Ups, Sit ups, Squats. 20 Pull Ups , Push Ups, Sit ups, Squats. 30Pull Ups , Push Ups, Sit ups, Squats. 40 Pull Ups , Push Ups, Sit ups, Squats.")
upsideDownAngie.workout_category_id = wod.id
upsideDownAngie.user_id = admin.id
upsideDownAngie.save
upsideDownAngie1 = upsideDownAngie.exercises.create
upsideDownAngie1.exercise_category_id = pullup.id
upsideDownAngie1.user_id = admin.id
upsideDownAngie1.save
upsideDownAngie2 = upsideDownAngie.exercises.create
upsideDownAngie2.exercise_category_id = pushup.id
upsideDownAngie2.user_id = admin.id
upsideDownAngie2.save
upsideDownAngie3 = upsideDownAngie.exercises.create
upsideDownAngie3.exercise_category_id = situp.id
upsideDownAngie3.user_id = admin.id
upsideDownAngie3.save
upsideDownAngie4 = upsideDownAngie.exercises.create
upsideDownAngie4.exercise_category_id = squat.id
upsideDownAngie4.user_id = admin.id
upsideDownAngie4.save

badKarma = Workout.create(:name => "Bad Karma", :description => "For time. 50 Barbell Curls / 10 Kettlebell Swings. 40 Barbell Curls / 20 Kettlebell Swings. 30 Barbell Curls / 30 Kettlebell Swings. 20 Barbell Curls / 40 Kettlebell Swings. 10 Barbell Curls / 50 Kettlebell Swings.")
badKarma.workout_category_id = wod.id
badKarma.user_id = admin.id
badKarma.save
badKarma1 = badKarma.exercises.create
badKarma1.exercise_category_id = kbswing.id
badKarma1.user_id = admin.id
badKarma1.save
badKarma2 = badKarma.exercises.create
badKarma2.exercise_category_id = barbell_curl.id
badKarma2.user_id = admin.id
badKarma2.save

#BENCHMARK--------------------------------------------------------------------
crossfitTotal = Workout.create(:name => "Crossfit Total", :description => "The CrossFit Total is the sum of the best of three attempts at the squat, the press, and the deadlift. All three lifts are done while standing on the floor.")
crossfitTotal.workout_category_id = benchmark.id
crossfitTotal.user_id = admin.id
crossfitTotal.save
crossfitTotal1 = crossfitTotal.exercises.create
crossfitTotal1.exercise_category_id = squat.id
crossfitTotal1.user_id = admin.id
crossfitTotal1.save
crossfitTotal2 = crossfitTotal.exercises.create
crossfitTotal2.exercise_category_id = press.id
crossfitTotal2.user_id = admin.id
crossfitTotal2.save
crossfitTotal3 = crossfitTotal.exercises.create
crossfitTotal3.exercise_category_id = deadlift.id
crossfitTotal3.user_id = admin.id
crossfitTotal3.save

fightGoneBad = Workout.create(:name => "Fight Gone Bad", :description => "In this workout you move from each of five stations after a minute. This is a five-minute round from which a one-minute break is allowed before repeating. We've used this in 3 and 5 round versions. The clock does not reset or stop between exercises. On call of 'rotate,' the athlete/s must move to next station immediately for good score. One point is given for each rep, except on the rower where each calorie is one point.")
fightGoneBad.workout_category_id = benchmark.id
fightGoneBad.user_id = admin.id
fightGoneBad.save
fightGoneBad1 = fightGoneBad.exercises.create(:weight => 20, :units => "pounds", :description => "10 ft target")
fightGoneBad1.exercise_category_id = wallball.id
fightGoneBad1.user_id = admin.id
fightGoneBad1.save
fightGoneBad2 = fightGoneBad.exercises.create(:weight => 75, :units => "pounds")
fightGoneBad2.exercise_category_id = sumo_deadlift_highpull.id
fightGoneBad2.user_id = admin.id
fightGoneBad2.save
fightGoneBad3 = fightGoneBad.exercises.create(:description => "20 inch box")
fightGoneBad3.exercise_category_id = box_jump.id
fightGoneBad3.user_id = admin.id
fightGoneBad3.save
fightGoneBad4 = fightGoneBad.exercises.create(:weight => 75, :units => "pounds")
fightGoneBad4.exercise_category_id = push_press.id
fightGoneBad4.user_id = admin.id
fightGoneBad4.save
fightGoneBad5 = fightGoneBad.exercises.create(:description => "calories")
fightGoneBad5.exercise_category_id = row.id
fightGoneBad5.user_id = admin.id
fightGoneBad5.save

tabataFightGoneBad = Workout.create(:name => "Tabata Fight Gone Bad", :description => "5 Consecutive 8-round tabatas (20 sec on 10 sec off) of: Wall ball, Sumo deadlift high pull, Box jumps, Push press, Row (Calories). Score the lowest round of each exercise.")
tabataFightGoneBad.workout_category_id = benchmark.id
tabataFightGoneBad.user_id = admin.id
tabataFightGoneBad.save
tabataFightGoneBad1 = tabataFightGoneBad.exercises.create(:weight => 20, :units => "pounds", :description => "10 ft target")
tabataFightGoneBad1.exercise_category_id = wallball.id
tabataFightGoneBad1.user_id = admin.id
tabataFightGoneBad1.save
tabataFightGoneBad2 = tabataFightGoneBad.exercises.create(:weight => 75, :units => "pounds")
tabataFightGoneBad2.exercise_category_id = sumo_deadlift_highpull.id
tabataFightGoneBad2.user_id = admin.id
tabataFightGoneBad2.save
tabataFightGoneBad3 = tabataFightGoneBad.exercises.create(:description => "20 inch box")
tabataFightGoneBad3.exercise_category_id = box_jump.id
tabataFightGoneBad3.user_id = admin.id
tabataFightGoneBad3.save
tabataFightGoneBad4 = tabataFightGoneBad.exercises.create(:weight => 75, :units => "pounds")
tabataFightGoneBad4.exercise_category_id = push_press.id
tabataFightGoneBad4.user_id = admin.id
tabataFightGoneBad4.save
tabataFightGoneBad5 = tabataFightGoneBad.exercises.create(:description => "calories")
tabataFightGoneBad5.exercise_category_id = row.id
tabataFightGoneBad5.user_id = admin.id
tabataFightGoneBad5.save

tabataSomethingElse = Workout.create(:name => "Tabata Something Else", :description => "32 intervals of 20 seconds of work followed by ten seconds of rest where the first 8 intervals are pull-ups, the second 8 are push-ups, the third 8 intervals are sit-ups, and finally, the last 8 intervals are squats. There is no rest between exercises.")
tabataSomethingElse.workout_category_id = benchmark.id
tabataSomethingElse.user_id = admin.id
tabataSomethingElse.save
tabataSomethingElse1 = tabataSomethingElse.exercises.create
tabataSomethingElse1.exercise_category_id = pullup.id
tabataSomethingElse1.user_id = admin.id
tabataSomethingElse1.save
tabataSomethingElse2 = tabataSomethingElse.exercises.create
tabataSomethingElse2.exercise_category_id = pushup.id
tabataSomethingElse2.user_id = admin.id
tabataSomethingElse2.save
tabataSomethingElse3 = tabataSomethingElse.exercises.create
tabataSomethingElse3.exercise_category_id = situp.id
tabataSomethingElse3.user_id = admin.id
tabataSomethingElse3.save
tabataSomethingElse4 = tabataSomethingElse.exercises.create
tabataSomethingElse4.exercise_category_id = squat.id
tabataSomethingElse4.user_id = admin.id
tabataSomethingElse4.save

tabataThis = Workout.create(:name => "Tabata This", :description => "32 intervals of 20 seconds of work followed by ten seconds of rest where the first 8 intervals are pull-ups, the second 8 are push-ups, the third 8 intervals are sit-ups, and finally, the last 8 intervals are squats. There is no rest between exercises.")
tabataThis.workout_category_id = benchmark.id
tabataThis.user_id = admin.id
tabataThis.save
tabataThis1 = tabataThis.exercises.create
tabataThis1.exercise_category_id = squat.id
tabataThis1.user_id = admin.id
tabataThis1.save
tabataThis2 = tabataThis.exercises.create
tabataThis2.exercise_category_id = row.id
tabataThis2.user_id = admin.id
tabataThis2.save
tabataThis3 = tabataThis.exercises.create
tabataThis3.exercise_category_id = pullup.id
tabataThis3.user_id = admin.id
tabataThis3.save
tabataThis4 = tabataThis.exercises.create
tabataThis4.exercise_category_id = situp.id
tabataThis4.user_id = admin.id
tabataThis4.save
tabataThis5 = tabataThis.exercises.create
tabataThis5.exercise_category_id = pushup.id
tabataThis5.user_id = admin.id
tabataThis5.save

filthyFifty = Workout.create(:name => "Filthy Fifty", :description => "For time.")
filthyFifty.workout_category_id = benchmark.id
filthyFifty.user_id = admin.id
filthyFifty.save
filthyFifty1 = filthyFifty.exercises.create(:repetitions => 50, :description => "24 inch box")
filthyFifty1.exercise_category_id = box_jump.id
filthyFifty1.user_id = admin.id
filthyFifty1.save
filthyFifty2 = filthyFifty.exercises.create(:repetitions => 50)
filthyFifty2.exercise_category_id = jumping_pullup.id
filthyFifty2.user_id = admin.id
filthyFifty2.save
filthyFifty3 = tabataThis.exercises.create(:repetitions => 50)
filthyFifty3.exercise_category_id = kbswing.id
filthyFifty3.user_id = admin.id
filthyFifty3.save
filthyFifty4 = filthyFifty.exercises.create(:repetitions => 50, :units => "steps")
filthyFifty4.exercise_category_id = walking_lunge.id
filthyFifty4.user_id = admin.id
filthyFifty4.save
filthyFifty5 = filthyFifty.exercises.create(:repetitions => 50)
filthyFifty5.exercise_category_id = knees_to_elbows.id
filthyFifty5.user_id = admin.id
filthyFifty5.save
filthyFifty6 = filthyFifty.exercises.create(:repetitions => 50, :weight => 45, :units => "pounds")
filthyFifty6.exercise_category_id = push_press.id
filthyFifty6.user_id = admin.id
filthyFifty6.save
filthyFifty7 = filthyFifty.exercises.create(:repetitions => 50)
filthyFifty7.exercise_category_id = back_extension.id
filthyFifty7.user_id = admin.id
filthyFifty7.save
filthyFifty8 = tabataThis.exercises.create(:repetitions => 50, :weight => 20, :units => "pounds")
filthyFifty8.exercise_category_id = wallball.id
filthyFifty8.user_id = admin.id
filthyFifty8.save
filthyFifty9 = filthyFifty.exercises.create(:repetitions => 50)
filthyFifty9.exercise_category_id = burpee.id
filthyFifty9.user_id = admin.id
filthyFifty9.save
filthyFifty10 = filthyFifty.exercises.create(:repetitions => 50)
filthyFifty10.exercise_category_id = double_under.id
filthyFifty10.user_id = admin.id
filthyFifty10.save
