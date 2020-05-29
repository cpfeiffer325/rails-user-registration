# RAILS USER REGISTRATION PROJECT

## DESCRIPTION
Assignment to build a user registration app that also sends notifications on registration

## CRITERIA
- Have a User Registration form requiring email and password
- When a User registers themselves, perform two side effects:
  - Send them an email confirmation message
  - Store their Gravatar URL
- If a User is created outside of the self-registration workflow
  - Auto-confirm them
  - Only store their Gravatar URL
- Once a user is confirmed (manually or automatically), allow them to access their user page, where they can see their gravatar image.
- Remind the user to confirm their email if they haven’t done so after 24 hours

## GETTING STARTED
1. clone repo
2. ```bundle install```
3. run migration
4. rails s
5. go to http://localhost:3000/

## RUNNING UNIT TESTS


## VERSIONS AND DEPENDENCIES
* Ruby 2.7.1 [Ruby Guide](https://ruby-doc.org/core-2.7.1/)
* Rails 6.0.3.1 [Rails Guide](http://guides.rubyonrails.org/v6.0.3.1/)
* SQLITE3 1.4.2 [SQLITE3 Guide](https://www.rubydoc.info/gems/sqlite3/1.4.2)

## SCREENSHOTS
### Registration PAGE

### USERS PAGE

