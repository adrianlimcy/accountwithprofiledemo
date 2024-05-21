# Accountwithprofiledemo

The goal of this simple app is to use phx.gen.auth and set name, and profiles to the database. Also to add a user admin page to reset password and disable user.

Steps:
1. mix phx.new accountwithprofiledemo
  - i.e. mix phx.new [name]
2. mix ecto.create
  - make sure the dev.exs has the correct postgresql config, name, password
3. iex -S phx.server
  - to check if everything is good for now
4. mix phx.gen.auth Accounts User users
  - auto user authentication creation
  - Yes to LiveView authentication
5. mix deps.get
6. mix ecto.migrate
7. mix test
  - make sure there is a postgres superuser account in the postgres installation
  - homebrew might now have it as default
8. mix ecto.gen.migration add_name_and_profile
9. 
