# Words-Rhymes-N-More


System dependencies can be found in the Gemfile in the same directory as this readme.

SETUP
---------------------

The following instructions are necessary to get the application up and running.
Please note that these instructions assume that you already have Ruby version 2.3.3 as well as Ruby's package manager "bundler" installed correctly before hand.
You MUST follow these steps in order, and DO NOT skip any steps:

* Fork this repository and clone it to your computer

* Be in the correct directory:
  * In terminal make sure you use the cd command to navigate to the same directory this readme resides in.

* Install all dependencies:
  * Assuming you set up ruby and bundler correctly, you can run the following command in terminal:

        bundle install

  You should see the following output in your terminal:

      Using rake 12.3.1
      Using concurrent-ruby 1.0.5
      Using i18n 1.1.0
      Using minitest 5.11.3
      Using thread_safe 0.3.6
      Using tzinfo 1.2.5
      Using activesupport 5.1.6
      Using builder 3.2.3
      Using erubi 1.7.1
      Using mini_portile2 2.3.0
      Using nokogiri 1.8.4
      Using rails-dom-testing 2.0.3
      Using crass 1.0.4
      Using loofah 2.2.2
      Using rails-html-sanitizer 1.0.4
      Using actionview 5.1.6
      Using rack 2.0.5
      Using rack-test 1.1.0
      Using actionpack 5.1.6
      Using nio4r 2.3.1
      Using websocket-extensions 0.1.3
      Using websocket-driver 0.6.5
      Using actioncable 5.1.6
      Using globalid 0.4.1
      Using activejob 5.1.6
      Using mini_mime 1.0.1
      Using mail 2.7.0
      Using actionmailer 5.1.6
      Using activemodel 5.1.6
      Using arel 8.0.0
      Using activerecord 5.1.6
      Using public_suffix 3.0.3
      Using addressable 2.5.2
      Using bindex 0.5.0
      Using bundler 1.16.1
      Using byebug 10.0.2
      Using xpath 3.1.0
      Using capybara 2.18.0
      Using ffi 1.9.25
      Using childprocess 0.9.0
      Using coffee-script-source 1.12.2
      Using execjs 2.7.0
      Using coffee-script 2.4.1
      Using method_source 0.9.0
      Using thor 0.20.0
      Using railties 5.1.6
      Using coffee-rails 4.2.2
      Using database_cleaner 1.6.2
      Using diff-lcs 1.3
      Using multi_json 1.13.1
      Using jbuilder 2.7.0
      Using rb-fsevent 0.10.3
      Using rb-inotify 0.9.10
      Using ruby_dep 1.5.0
      Using listen 3.1.5
      Using puma 3.12.0
      Using sprockets 3.7.2
      Using sprockets-rails 3.2.1
      Using rails 5.1.6
      Using rspec-support 3.8.0
      Using rspec-core 3.8.0
      Using rspec-expectations 3.8.1
      Using rspec-mocks 3.8.0
      Using rspec-rails 3.8.0
      Using ruby_rhymes 0.1.2
      Using rubyzip 1.2.2
      Using sass-listen 4.0.0
      Using sass 3.5.7
      Using tilt 2.0.8
      Using sass-rails 5.0.7
      Using selenium-webdriver 3.14.0
      Using spring 2.0.2
      Using spring-watcher-listen 2.0.1
      Using sqlite3 1.3.13
      Using turbolinks-source 5.2.0
      Using turbolinks 5.2.0
      Using uglifier 4.1.19
      Using web-console 3.7.0
      Bundle complete! 19 Gemfile dependencies, 78 gems now installed.
      Use \`bundle info [gemname]\` to see where a bundled gem is installed.
      
  All system dependencies can be found in the Gemfile in the same directory as this readme.

* Database migrations:
  * You must start and initialization the database by running the following command in terminal:

          rails db:migrate

  You should see the following output in your terminal:

      == 20180913143429 CreateQueries: migrating ====================================
      -- create_table(:queries)
       -> 0.0018s
      == 20180913143429 CreateQueries: migrated (0.0020s) ===========================
      
 Starting from the directory that this readme resides in, you can find the migration file (which determines the structure of the database) at "db/migrate/20180913143429_create_queries.rb".

* Run the test suite:
  * Now, you can run the test suite with the following command in terminal:

        rspec

  This test suite checks that all of the end points are working correctly. If all tests pass, you will see the following output in your terminal:

      .....

      Finished in 1.13 seconds (files took 7.98 seconds to load)
      5 examples, 0 failures
      
  Starting from the directory that this readme resides in, you can find the test file (which determines the tests that are run) at spec/features/queries_controller_spec.rb

* Start the api locally:
  * You can start the sever locally by entering the following command in terminal:
  rails s

  The following output will appear in your terminal:

        => Booting Puma
        => Rails 5.1.6 application starting in development
        => Run \`rails server -h\` for more startup options
        Puma starting in single mode...
        * Version 3.12.0 (ruby 2.3.3-p222), codename: Llamas in Pajamas
        * Min threads: 5, max threads: 5
        * Environment: development
        * Listening on tcp://0.0.0.0:3000
        Use Ctrl-C to stop


Usage
---------------------

Now you can make the following api requests:

* Making a get request to "http://localhost:3000/api/v1/queries" will give you a hash of all queries made to the api in JSON format (note that get requests do not count as queries). If there has been no queries made to the database your output JSON should look like this:

          []


* Making a get request to "http://localhost:3000/api/v1/queries/:id" will give you a query made to the api in JSON based on the id you replace ":id" with. The id must be of a valid previously made query that was made to the api (note that get requests do not count as queries). If everything is working correctly your output JSON should look something like this:

        {
          id: 1,
          word_list: "[apple, cake, popcorn]",
          action: "rhyme_word",
          result: "[popcorn]",
          repetitions: null,
          created_at: "2018-09-15T19:35:11.434Z",
          updated_at: "2018-09-15T19:35:11.434Z"
        }


* You can make a post request to "http://localhost:3000/api/v1/queries" with the body containing the key value pair as follows:

          word_list: your_stringified_array

This end point has different result depending on what's in the stringified array:
 * You can use a single word like "cake" in the following format:

           word_list: "[cake]"

 A list of words that rhyme with "cake" will be returned in a stringified array and would look like this:

         "[ache, ake, awake, bake, blake, brake, break, dake, drake, fake, flake, forsake, haik, hake, jacque, jake, lake, make, mistake, naik, opaque, paik, pake, partake, plake, quake, rake, remake, retake, sake, schake, schlake, schnake, schwake, shaik, shaikh, shake, shrake, snake, spake, stake, steak, take, wake, yake]"

 * If you use a list of words like "apple", "cake", and "popcorn" in the following format:

         word_list: "[apple, cake, popcorn]"

 A single word will be randomly selected and returned in a stringified array and (assuming "popcorn" was the randomly selected word) it would look like this:

           "[popcorn]"


 * Making a post request to "http://localhost:3000/api/v1/queries/sentence" with the body containing the key value pair like so:

           sentence: your_sentence_string

 A sentence will be returned as a string that rhymes with the sentence that was supplied. For example, if the body contains the following:

           sentence: "I love Code"

 A sentence that rhymes with "I love code" will be returned. That sentence might look like this:

           "sky glove rowed"
           
           
Starting from the directory that this readme resides in, you can find the queries_controller.rb (which handles all of these api requests) at "app/controllers/concerns/api/v1/queries_controller.rb".

Also starting from the directory that this readme resides in, you can find routes.rb (which determins what api requests can be made) at "config/routes.rb".

