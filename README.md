## Braintree Ruby Integration README:

### Braintree Ruby Integration

- This is an example integration with Braintrees Hosted Fields payment platform. This was built with Ruby on Rails as part of the application process for an API Specialist role at Braintree / PayPal.

- Braintree provides sample card information to test their platform. The details is the placeholder text in my Hosted Field forms but for your reference they are: 
- CARD NUMBER: 4111 1111 1111 1111
- CVV: 123
- EXPIRATION DATE: 10/2022

- You will need to enter your own API credentials (detailed below) to use this application.

### Walkthrough

The files to look at are:
- app/controllers/checkout_controller - This is where the integration code live

- /config/routes.rb - This is where the routes for generating a client token and making a transaction request live

- /public/index.html - This is where the hosted fields and main page code live

I created the rails app, installed the braintree gem, integrated one route to get a client token, a second route to send a transaction / nonce, set up the public/index.html file, added a little html/css to make the payment form nicer, and added axios to make get/post requests. 

### Screenshot

![Checkout](/public/screenshots/braintree_checkout_page_screenshot.png "Checkout")

### Technology stack
- This integration is built on Ruby on Rails. It uses an HTML, CSS, and JavaScript front end. 
- It uses the Braintree API Ruby gem to build Hosted Fields for payment processing.
- Axios is used for GET/POST requests in our index.html file.

### Getting Started/Requirements/Prerequisites/Dependencies

- Unzip the zip file in your root target folder.

- bundle install (installs braintree gem)

- rails db:setup

- rails credentials:edit
* (add credentials, see screenshot below, then close the text editor - The file will open in your default editor)

- rails server

- Open your browser to localhost:3000. From there you will be able to input the test card numbers (currently listed as placeholder text) and click pay. You will receive confirmation that the transaction was created in your rails server and your browser console.

---

### Configuring Environment Variables: 
This app stores environment variables config/credentials.yml.enc which is supported by Rails 5.x or higher. This is an encrypted file so you will not be able to read it or edit it directly. The file config/master.key holds a small key (or "password") to decrypt the credentials file.

To add your environment credentials: 
1. In your terminal project directory run: 'EDITOR="code --wait" rails credentials:edit' Your unencrypted credentials file will open in your code editor.
2. Add your Merchant ID, Public Key, and Private Key as shown in the screenshot below. Do not change your secret_key_base.

![Credentials](/public/screenshots/braintree_credentials_example.png "Credentials")

3. Once you are done adding your own credentials save and close the file. If you already had your rails server running you need to restart it for the changes to go into effect. Your credentials will now be added into your Gateway call in the checkout_controller (see screenshot below)

![Controller](/public/screenshots/braintree_credentials_example_in_controller.png "Controller")

### TODO - If I had more time
- Create tests like the ones in this braintree ruby example page (https://github.com/braintree/braintree_rails_example/blob/master/spec/controllers/checkouts_controller_spec.rb#L24)
- Built the Front End in Vue.js
- Build a redirect for successful and unsuccessful post transaction page
- Add a product to purchase
- Use another way to input the Transaction Amount rather than hard coding it. I could have easily added an amount form but that is not something you would likely actually want in production. 

----

## Credits and references

1. I used the Braintree Github example integration (https://github.com/braintree/braintree_rails_example) and the official developer support documents (https://developers.braintreepayments.com/start/overview) as a guide while building this integration
2. While searching online I saw an example of this Braintree integration in Vue (done by a former Braintree API support engineer) here (https://github.com/ksherman/vuejs-braintree-example/). If I had additional time I would have built the front end in Vue as I enjoy working in it and could have added a more interesting front end.  