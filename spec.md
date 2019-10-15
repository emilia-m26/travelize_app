# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        (used Sinatra to build)
- [x] Use ActiveRecord for storing information in a database
        (using AR for storing info to database)
- [x] Include more than one model class (e.g. User, Post, Category)
        (using Traveler and Goal models)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        (traveler has many goals)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        (goal belongs to traveler)
- [x] Include user accounts with unique login attribute (username or email)
        (using email as login attribute and using validations to ensure uniqueness)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        (Goal can CRUD)
- [x] Ensure that users can't modify content created by other users
        (goals are associated to traveler through traveler_id, if not traveler cannot modify)
- [x] Include user input validations
        (validations included through ActiveModel::Validations)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
        (error messages included)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        (README.md updated)
Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
