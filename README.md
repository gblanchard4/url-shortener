URL Shortener
==========================================
# Learning Rails and Shortening URLs
* Reference: [@andrewcallahan](http://andrewcallahan.github.io/blog/2014/02/26/make-your-own-url-shortener-with-rails-4-and-heroku/)

## What Did I Do!?
* I want to use Material Design instead of Bootstrap
	* Added `material.min.js` to `vendor/assets/javascripts/` and edited `app/assets/javascripts/application.js` with `//= require  material.min.js`
	* Added `material.min.css` to `vendor/assets/stylesheets/` and 
	edited `app/assets/stylesheets/application.css` with `*= require bootstrap.min`
* Create a new Model for a Link
	* `rails g scaffold link given_url:string slug:string clicks:integer snapshot:string title:string`
		* Generate a new scaffold of a model called link
		* link has the fields:
			* `given_url` -> string
			* `slug` -> string
			* `clicks` -> integer
			* `snapshot` -> string
			* `title` -> string
	* Change default value for `clicks` in the migration file to `0` since you cant increment a non-integer value (nil)
		* Edit `db/migrate/20151103022420_create_links.rb` by modifying `t.integer :clicks` with a  `:default => 0`
	* Migrate the database with `rake db:migrate`
* At this point I *probably* should have realized I already needed to create my database
	* Edit the `config/databse.yml` and `rake db:create`
* Add the `generate_slug` function to `app/models/link.rb` 
* Figaro
	* Add the gem `figaro` to the Gemfile and `bundle install`
	* Add `BASE_URL: 'http://gebiv.com/'` to `config/application.yml`
	* Add `display_slug` method to `app/models/link.rb`
* Screenshot the websites
	* Add the following gems:
		* `gem 'imgkit'`
		* `gem 'carrierwave'`
		* `gem "fog", "~> 1.3.1"`
		* `gem 'mechanize'`
		* `gem 'sidekiq'`
	* Created my S3 bucket and keys
	* Add `screenshot_scrape` to `app/models/link.rb`
	* Add `after_create` callback to take screenshot and generate the link to `app/models/link.rb`
	* `mkdir app/workers` for worker classes
	* Create `screenshot.rb` and `scrape.rb` in `app/workers`
* Create CarrierWave initilization file	in `config/initializers`
* Create `app/uploaders/snapshot_uploader.rb` for Heroku permissions
	* 	Add `mount_uploader :snapshot, SnapshotUploader` to `app/models/link.rb`
* Update `controllers/links_controller.rb` to remove the delete,edit,index, and destroy actions
* Generate home controller
* Modify `config/routes.rb` to add slug and home routes
* Add `gem 'will_paginate', '~> 3.0'`
* Create `app/views/layouts/_new_link.html.erb`
* Modify `app/views/layouts/application.html.erb` and add MDL container
* Modify `app/views/links/_form.html.erb` and add some MDL flare
* Create `app/views/links/create.js.erb` to append new short link back to page
* Modify `app/views/links/show.html.erb` (will add MDL flare later)
* JQuery URL Validation
	* Add `gem 'jquery-validation-rails'`
	* Add validator javascript to `app/assets/javascripts/application.js`
* Create `app/views/home/index.html.erb` and `app/views/home/all.html.erg` pages
* Add custom CSS to `app/assets/stylesheets/application.css`

## Trying it out
* Fire up `rails server`
	* Getting a JQuery 500 I believe due to Redis not being installed after looking into the logfiles
	* (Install Redis)[https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis]
* Add `config/initializers/imgkit.rb`
