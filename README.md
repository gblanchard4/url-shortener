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


