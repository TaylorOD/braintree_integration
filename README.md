## Braintree Ruby Integration README:

### Braintree Ruby Integration

- This is an example integration with Braintrees Hosted Fields payment platform. I build this as part of the application process for an API Specialist role at Braintree / PayPal.
- The application is fairly easy to use. I will detail any dependencies you need to install below but if you are familiar with Ruby on Rails you shouldn't have any problems. 
- Braintree provides sample card information to test their platform. The details is the placeholder text in my Hosted Field forms but for your reference they are: 
CARD NUMBER: 4111 1111 1111 1111
CVV: 123
EXPIRATION DATE: 10/2022
- You will need to enter your own API credentials (detailed below) to use this application.
- Hosted Fields is different and somewhat more complex to integrate than Braintrees "Drop In" forms but they allow for more customization. If you have specialized needs for your payment forms it is a great options with very useful support documents: https://developers.braintreepayments.com/start/overview

- If possible, include screenshots and demo videos.

CHECK THIS - TODO

### Technology stack: 
- This integration is built on Ruby on Rails. It uses an HTML, CSS, and JavaScript front end. 
- It uses the Braintree API Ruby gem to build Hosted Fields for payment processing.
- Axios is used for GET/POST requests in our index.html file. It is already linked and called but alternatively you could install it run, "npm install axios" in your terminal. 

### Getting Started/Requirements/Prerequisites/Dependencies
Include any essential instructions for:
- Getting it: Unzip the zip file in your root target folder.
- Installing It: Run "gem install braintree" in the project directory or add the gem "braintree" to your Ruby gem file.
- Configuring It: This app stores environment variables config/credentials.yml.enc which is supported by Rails 5.x or higher. This is an encrypted file so you will not be able to read it or edit it directly. The file config/master.key holds a small key (or "password") to decrypt the credentials file.

To add your environment credentials: 
1. In your terminal project directory run: "EDITOR="code --wait" rails credentials:edit" Your unencrypted credentials file will open in your code editor.
2. Add your Merchant ID, Public Key, and Private Key as shown in the screenshot below. Do not change your secret_key_base.

- ![Credentials](/braintree_ruby_integration/public/screenshots/braintree_credentials_example.png "Credentials")

3. Once you are done adding your own credentials save and close the file. If you already had your rails server running you need to restart it for the changes to go into effect. Your credentials will now be added into your Gateway call in the checkout_controller (see screenshot below)

- ![Controller](/braintree_ruby_integration/public/screenshots/braintree_credentials_example_in_controller.png "Controller")

- Running it: Run "rails server" in your project directory and open your browser to localhost:3000. From there you will be able to input the test card numbers (currently listed as placeholder text) and click pay. You will receive confirmation that the transaction was created in your rails server, your browser, and on screen.

CHECK THIS - TODO

### Known issues
- This was tested on Chrome. I do not know how the page will display on other or older browsers. 
- The page load time slow on initial load. If you are on a slow connection you may have to wait several seconds before the Hosted Fields appear and you are able to see the form boxes.

### TODO/If I HAD MORE TIME
- Built the Front End in Vue.js
- Build a redirect for successful and unsuccessful post transaction page
- Add a product to purchase
- Use another way to input the Transaction Amount rather than hard coding it. 

### Contact
- Blind Application Process 

----

## Credits and references

1. I used the Braintree Github example integration (https://github.com/braintree/braintree_rails_example) and the official developer support documents (https://developers.braintreepayments.com/start/overview) as a guide while building this integration
2. While searching online I saw an example of this Braintree integration in Vue (done by a former Braintree API support engineer) here (https://github.com/ksherman/vuejs-braintree-example/). If I had additional time I would have built the front end in Vue as I enjoy working in it and could have added a more interesting front end.  