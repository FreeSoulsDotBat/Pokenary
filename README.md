# Pokenary
This is a project of a dictionary of Pokémons that consumes the API https://pokeapi.co/

See at https://pokenary.herokuapp.com/

# Setup the development environment

### It's required:

* The project on your desk; (clone it!)
* Docker installed.

### If you want to see Pokenary on your localhost you need to follow this steps:

* Run `docker-compose up --build` on the root of the project;
* Make the dump with the file _pokenary_dump.sql_ in the root of the project; (Or update the database directly from the API, I will explain later)
* Have fun!

### You can update the database directly from the API by the admin of django:

* After you have docker running, enter in the django admin painel (_localhost:8000/admin_ by default);
* Login as admin user (if you make the dump, you already has a user to login -> user: djangoadmin, password: 123456, if not, you need to create a user by running `createuser` command, see django docs for more information...)
* Click on Pokemon;
* Click in Update Database.

# Reach me on

* Linkedin: https://www.linkedin.com/in/jonatan-bossan/
* E-mail: jonatan.fbossan@gmail.com

# Some considerations

* This project has no monetization, so it has the basic configurations on the Heroku;
* Because of the basic configurations, sometimes the server bring a error, just refresh it and you will be fine;
* Responsivity not implemented!

