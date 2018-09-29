docker-opengl (ubuntu)
=============
A docker image that supports rendering graphical applications, including OpenGL apps.

Overview
--------

This Docker image supports portable, CPU-based graphical application
rendering, including rendering OpenGL-based applications. An X session is
running on display `:0` and can be viewed through HTML5 viewer on any device
with a modern web browser (Mac OSX, Windows, Linux, Android, iOS, ChromeOS,
...). It can be used to expose a graphical interface from a Docker container
or to run continuous integration tests that require a graphical environment.

Quick-start
-----------

Execute the `run.sh` script. It will start the container on bash.

Details
--------

The `run.sh` script can be used to drive start-up. It is customizable with
flags::

  Usage: run.sh [-h] [-q] [-m] [-c CONTAINER] [-i IMAGE] [-p PORT] [-r DOCKER_RUN_FLAGS]

  This script is a convenience script to run Docker images based on
  thewtex/opengl. It:

  - Makes sure docker is available
  - On Windows and Mac OSX, creates a docker machine when requested
  - Informs the user of the URL to access the container with a web browser
  - Stops and removes containers from previous runs to avoid conflicts
  - Mounts the present working directory to /home/user/work on Linux and Mac OSX
  - Prints out the graphical app output log following execution
  - Exits with the same return code as the graphical app

  Options:

    -h             Display this help and exit.
    -c             Container name to use (default opengl).
    -m             Creates a docker virtual machine (default false)
    -i             Image name (default thewtex/opengl).
    -p             Port to expose HTTP server (default 6080). If an empty
                   string, the port is not exposed.
    -r             Extra arguments to pass to 'docker run'. E.g.
                   --env="APP=glxgears"
    -q             Do not output informational messages.


Credits
-------
Forked from `https://github.com/thewtex/docker-opengl`
Original configuration was largely inspired by the `dit4c project <https://dit4c.github.io>`.

