# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


---
run gem install braintree in your ruby braintree directory or add the gem "braintree" to your ruby gem file

set up cores - uncomment in rails initalize file

add axios in html file or install it with npm

turn on protect from null session

This app uses rails credentials

In your terminal, navigate to your rails app and run the command to open/edit the unencrypted credentials file:
	EDITOR="code --wait" rails credentials:edit

You should see the following unencrypted credentials file display in your text editor. 
Add any new credentials to the file. (The example below is for an api_key namespaced in news_api)
Note: Do not change your secret_key_base. This must be generated if you lose it.
# aws:
#   access_key_id: 123
#   secret_access_key: 345

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: 123456789abcdefghijk_do_not_change_this

news_api:
   api_key: 1234567

Once you are done with your changes, save and close the unencrypted credentials file.

Start or restart your server (environment variables are set when you start the server)
rails server
