# Splash Code Test

## Assignment

Your goal is to create a simple event management app. The requirements are as follows:

* There shall be an event dashboard showing all of my events
* There shall be a way to add new events
* There shall be a way for a guest to rsvp to an event
* The event dashboard shall show a count of current attendees.
* The fields should properly handle unicode characters (in case my name is Señor Tacos)
* The event dashboard should list the event `title`, `start_time`, and `end_time`
* If an event does not have a `start_time` it should be listed as `TBD` (To Be Determined)
* One should be able to easily see the event in groups of `Upcoming`, `Past`, and `TBD`.
* The table should be sortable by `Title`, and `start_time`, with `TBD` events taking precedence.

Feel free to use any tools or frameworks you like!

### Bonus points
For extra awesome-points, the dashboard should be updated in real-time when anyone makes an update (adds an event, a guest RSVPs to the event, etc...)

## Database
We have provided a simple SQL schema file to get you started. You should import the schema file into the database created as part of the setup.

If you make any changes to the database, feel free to just supply the updated SQL dump; if you're feeling fancy, you may write a migration.

## Submitting
When you're ready to submit, zip up your code and email it back to us.

# Set up
1. Install Docker for your operating system: [OSX](https://docs.docker.com/docker-for-mac/install/), [Windows](https://docs.docker.com/docker-for-windows/install/), or Linux.
2. Clone this repository.
3. In Terminal, go into the cloned repository and run `docker-compose up -d`
    * This will download the Docker images and run the install
4. Run `docker ps` and you should see two containers running: one for web, one for db.
5. Go to `http://127.0.0.1:8080` in your browser and you should see `index.html` in the `www` folder.

## To access the database
In your favorite MySQL browsing application (we recommend Sequel Pro for OSX and HeidiSQL for Windows), use the following credentials:

| Property     | Value          |
|--------------|----------------|
| Host         | 127.0.0.1      |
| Username     | splash         |
| Password     | splash         |
| Port         | 3306           |
| DatabaseName | SplashCodeTest |

## To develop
Add all your code into the `www` folder.

When configuring your code, use a database host of `db` (rather than 127.0.0.1).

If you need to get into the container (for example, to run `composer install`), run the following in your Terminal: `docker exec -it codetest_web_1 /bin/sh`. You will be in the `/www` folder which is mounted to the `www` folder you have been developing in.

Composer is already installed inside the Docker container, so once you connect to the container, you can run `composer` to do whatever is necessary.

## Changes for frameworks
If you need to make a change for a framework - for example, changing the root public folder:

1. Edit `docker/nginx.conf` and change the `root` paths on lines 44 and 51
2. From your local Terminal, run `docker-compose build` and `docker-compose up -d` to update the container
