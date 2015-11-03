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
	