# CPSC-449-Project-1
  Participants: Juan Zaragoza, Justin Poblete, Asmita Koirala
# Master Folder
  - users.py: Contains main functionality for creating users and authenticating users as well.
  - timelines.py: This file includes functionality for posting tweets and getting different timelines of tweets.
  - schema.sql: Includes the tables and input data used for testing the program.
  - Procfile: Holds comands to run the program with "foreman".
  - api.cfg: Contains the database name.
  
# What To Install Before Running
  - ~$ pip install Flask
  
# How To Run With HTTPIE
  - ~$ Flask init
  - ~$ Flak run
  - ~$ http "method(GET, POST, PUT etc.)" "url/db_table_name" "attribute_name=attribute" (Make sure to run on seperate terminal)
  -  Example:
  - ~$ http POST 127.0.0.1/users user=jack password=hello_world email=jack@gmail.com
  
# How To Run With Foreman
  - ~$ foreman start
