# CPSC-449-Project-1
  Participants: Juan Zaragoza, Justin Poblete, Asmita Koirala
# Master Folder
  - users.py: Contains main functionality for creating users and authenticating users as well.
  - timelines.py: This file includes functionality for posting tweets and getting different timelines of tweets.
  - schema.sql: Includes the tables and input data used for testing the program.
  - Procfile: Holds commands to run the program with "foreman".
  - .env: defines the flask app and enviroment (Note: foreman would exit if flask init was included in procfile)
  
# What To Install Before Running
  - Python3
  - Flask
  - HTTPIE
  - Foreman
  
# How To test With HTTPIE
  - ~$ http "method(GET, POST, PUT, etc.)" "url+port/db_table_name" "attribute_name=input" (Make sure to run on seperate terminal)
  -  Example:
  - ~$ http POST 127.0.0.1:5000/users username=jack password=hello_world email=jack@gmail.com
  
# How To Run 
  - ~$ flask init
  - ~$ foreman start
