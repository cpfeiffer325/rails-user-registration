# RAILS USER REGISTRATION PROJECT

## DESCRIPTION
Assignment to build a user registration app that also sends notifications on registration

## CRITERIA
- Have a User Registration form requiring email and password DONE
- When a User registers themselves, perform two side effects:
  - Send them an email confirmation message BROKEN, STILL NOT RECEIVING EMAIL
  - Store their Gravatar URL DONE
- If a User is created outside of the self-registration workflow
  - Auto-confirm them DONE
  - Only store their Gravatar URL DONE
- Once a user is confirmed (manually or automatically), allow them to access their user page, where they can see their gravatar image. HALF DONE (NOT DEPENDENT ON EMAIL VERIFICATION YET)
- Remind the user to confirm their email if they haven’t done so after 24 hours
  - NOTES TO SELF: Create a delayed job on user creation that runs if email_verified is still false
- Complete without using any authentication gems and without using Rails model callbacks
- Create some Unit Tests

## GETTING STARTED
1. ```git clone git@github.com:cpfeiffer325/rails-user-registration.git```
2. ```bundle install```
3. Run database migration ```rake db:migrate```
4. ```rails s```
5. Go to http://localhost:3000/

## RUNNING UNIT TESTS


## VERSIONS AND DEPENDENCIES
* Ruby 2.7.1 - [Ruby Guide](https://ruby-doc.org/core-2.7.1/)
* Rails 6.0.3.1 - [Rails Guide](http://guides.rubyonrails.org/v6.0.3.1/)
* SQLITE3 1.4.2 - [SQLITE3 Guide](https://www.rubydoc.info/gems/sqlite3/1.4.2)

## SCREENSHOTS
### Registration PAGE

### USERS PAGE

