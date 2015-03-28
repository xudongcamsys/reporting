# Reporting 
(WIP)

## Introduction
For [1-Click](https://github.com/camsys/oneclick), we need to implement reporting functionality that will allow authorized users to run ad-hoc reports against virtually any dataset, or logical combination of datasets, in the database. 

* Be configurable on a per-deployment basis by the System Administrator
* Allow query/filtering of virtual any dataset, or logical combination of datasets, in the database
* Dynamically render the report query user interface based on the available fields, including defined valid data ranges and domain values
* Display the filtered data as a table within the application.

## Assumptions
The following assumptions are made:
* The data source for the reports will be a single table or single view defined in the database.

## Installation and Setup
1. Add this line to your application's Gemfile
  
  ```gem 'reporting', :github => 'xudongcamsys/reporting', :branch => 'master'```
2. Then execute

  ```$ bundle install```
3. Add this line to your application's route file

  ```mount Reporting::Engine, at: "/reporting"```
4. Database migrations

  ```$ rake reporting:install:migrations```

  ```$ rake db:migrate```

## License
MIT