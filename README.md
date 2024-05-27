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
18. Create form_component.ex in account_live
19. Modify account_live/index.html.heex with buttons to edit profile for each user
  - be super careful when to use "account" and when to use "user" (wasted 2 hours on this)
20. Create another form_component_pwd.ex in account_live
21. Modify account_live/index.html.heex  with buttons to edit password for each user
  - basically the same steps for profile, but a new form_component_pwd to handle the new modal
22. End of Project

Optional:
21. added def require_admin in user_auth.ex
22. added new scope in router.ex to ensure user is admin to enter admin page
23. added if first user, make first registration an admin
24. added a link to accounts in root.html.heex
