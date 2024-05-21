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
  - add in the migration changes
9. go to user.ex in accounts/user.ex and add in the name and profile fields
  - remember to also modify the changeset
10. go to user_registration_live.ex to update fields when registering
  - maybe hide the profile field for now
11. mix ecto.migrate
12. test by creating a user with name, email, password (profile should default to Member)
13. create a folder called account_live under accountwithprofiledemo_web/live
14. create an index.ex and index.html.heex under account_live folder
15. add def list_accounts() in accounts.ex
16. add AccountLive.Index to router
17. Optional: Rework home.html.heex under accountwithprofiledemo_web/controllers/page_html to make the home page more to your style and add link to accounts index page 
18. 