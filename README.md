# To Do Rails App

This is a To Do app, implemented as a test for a job.

# Problem

In this to-do list you can:

* Register a user / login (just need a name, email and password)
* Add a task (which is simply a text field)
* Edit a task
* Remove a task
* Mark a task as complete

When a user marks a task as complete:

* The system sends an email to the user with a nice random phrase of "Congratulations" painted a random hexadecimal color

* In addition, you also have to send an event to the tracking system. For simplicity, the tracking system is just an event table that has an event type and a json field in which you send relevant data. In case, saving in this field json the color and the random phrase of the "Congratulations" email.

Some requirements of users very excited about the system:

* At least the operation to mark the task as complete must be asynchronous.
* Use the bootstrap for CSS
* Deploy in Heroku
* Create a rake task that extracts a CSV report from all events with: user, hexadecimal color, phrase and the time that was marked as complete (not just print attributes or json.

# Ruby version
2.4.0

# System dependencies
* Ruby 2.4.0
* Gems listed on Gemfile
* Selenium
* Chromedriver (if you are using Mac OS ```brew install chromedriver```)

# Database creation and initialization
First of all, clone the repo
``` git clone REPO_URL ```

Then, config your database at `config/database.yml` and run:

``` rails db:create db:migrate ```

And finally:

``` rails s ```

# Running specs
``` rspec ```

# Exporting tracking system
``` rails export:tracks:task_closed ```

If you wanna specify the path use:
``` rails export:tracks:task_closed FILENAME=/path/to/file.csv  ```
