# Splash Code Test
Your goal is to create a simple event management app. The requirements are as follows:

* There shall be an event dashboard showing all of my events
* There shall be a way to add new events
* There shall be a way for a guest to rsvp to an event
* The event dashboard should list the event `title`, `start_time`, and `end_time`
* If an event does not have a `start_time` it should be listed as `TBD` (To Be Determined)
* One should be able to easily see the event in groups of `Upcoming`, `Past`, and `TBD`.
* The table should be sortable by `Title`, and `start_time`, with `TBD` events taking precedence.

### Bonus points
For extra awesome-points, the dashboard should be updated in real-time when anyone makes an update (adds an event, a guest rsvp's to the event, etc...)

*Feel free to use any tools or frameworks you like!*

## Database
Your database will come with a super simple schema just to get  you started. To connect to the database, use the following credentials:
```
database_name: SplashCodeTest
database_user: splash
database_password: splash
root_password: splash
port: 3306
```

## Set up
  ### Requirements
    * docker-machine (if on a mac)
    * docker
    * docker-compose

  For more info on setting up docker, click [here](https://docs.docker.com/)

  ### Steps
  To bring up the LAMP stack (nginx, php, mysql), run the following command from the root of the `SplashCodeTest` directory
  ```
  docker-compose up -d
  ```
  The `html` directory will be mounted to the docker container and all your code should be placed in it.

  To view your page
  ```
  http://<docker-machine-ip>:8080
  ```
  If you're on a mac, your docker-machine IP is probably something like `192.168.99.100`. You could also run the following to find your `docker-machine` ip.
  ```
  docker-machine ip default
  ```
