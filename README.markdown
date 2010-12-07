# Komodo

Komodo is a simple wrapper for Delayed::Job that helps you autoscale workers when deployed on [Heroku](http://www.heroku.com). It came about for an upcoming project of [ours](http://www.involved.com.au), which only required the occasional background worker.

__Please note:__ This is still very early days for Komodo, there's very little (read: zero) test coverage - and we've yet to even put it into production.

# Configuration

Setup delayed_job as per [the instructions](http://docs.heroku.com/delayed-job) on Heroku.

Add Komodo to your Gemfile:

	gem "komodo"

Add a `/config/komodo.yml` file to your Rails 3 project directory and add the following:

	defaults: &defaults
	  max_workers: 1
	  application_name: my_heroku_application
	  username: email@myherokuapplication.com
	  password: sekrit
  
	development:
	  <<: *defaults

	test:
	  <<: *defaults

	production:
	  <<: *defaults
	
# Usage

Komodo is set up to (try and) be as abstract as possible. Queuing a function works similar to delayed_job, just call:

	Komodo.queue object, :function, [arg1, arg2]

Komodo will automatically add and remove workers as the queue fills up and empties, respectively.

# Notes

As stated above, this is really a pre-alpha of Komodo, as such the scaling is very basic; Komodo just ramps straight up to the user-configured maximum.