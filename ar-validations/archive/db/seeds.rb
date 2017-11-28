# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Recipe.create(name: 'Steak In Brussels', ingredients: 'steak, brussels sprouts, olive oil, salt, pepper')
Recipe.create(name: 'Cucumber & Brussels Sprouts Salad', ingredients: 'cucumber, brussels sprouts, olive oil, salt, pepper, balsamic')
Recipe.create(name: 'Ribeye In Brussels', ingredients: 'steak, brussels sprouts, olive oil, salt, pepper')
Recipe.create(name: 'Fish Out Of Brussels', ingredients: 'Swai fish, brussels sprouts, olive oil, salt, pepper')
Recipe.create(name: 'Chicken Little In Brussels', ingredients: 'chicken breast tenders, brussels sprouts, olive oil, salt, pepper')

Comment.create(recipe_id: 1, body: "mm delicious!")
Comment.create(recipe_id: 1, body: "needs more salt!")
Comment.create(recipe_id: 2, body: "fresh and tasty")
Comment.create(recipe_id: 3, body: "tender but suculant")
Comment.create(recipe_id: 4, body: "little bland")
Comment.create(recipe_id: 4, body: "needs more flavor!")
Comment.create(recipe_id: 5, body: "chicken was too small to really be satisfied!")
