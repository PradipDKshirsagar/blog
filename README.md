# README

This README would normally document whatever steps are necessary to get the application up and running.

* Ruby version

```
  Ruby version should between 2.2.2 and 2.5 not including 2.5.
  Install ruby with commond 'rvm install ruby-X.X.X'.
```

* System dependencies

```
  Install system dependencies with commond 'bundle install'.
```

* Configuration

```
  Add the configuration file to the system directory.
  i.   .env
  ii.  config/secrete.yml
  iii. config/database.yml

  Refer corresponding .sample files for above.
```

* Database creation and initialization

```
  Execute following commands 
  - rails db:create

  - rails db:migrate

    When we run the migration command we get an error for some migration because of some add_translation_fields migrations files.
    To solve these errors, we need to add that particular fields to the corresponding model and then execute the migration command. 
    Repeat this process, until the migration completed.
    Reset all changes in model files.
```
* To start system server

```
Execute the commond 'rails s'
```

* To start system console

```
Execute the commond 'rails c'
```