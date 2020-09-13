# Docker
Simple dockerfile to build a apache image.
Once the image has been built and the container launche, the port 80 will be exposed to allow us to visit the apache webpage based on the container IP and the container PORT.


### Command used:
    - `docker build -t apacheubuntu2:1.0 .
    -  docker run -t -d -P --name apache2container apacheubuntu2:1.0
    -  docker container ls`

once i run

    - `docker container ls`

I can check the port exposed for the container and retrieving docker IP.. I can browse docker IP on the port exposed to visualise apache landing page.
