naroga/php56
============

Installing this image
=====================

1) Pulling from the hub (recommended)
-------------------------------------

To pull the latest version from image from the hub, just execute `docker pull naroga/php56`.

2) Building from the Dockerfile
-------------------------------

To build from the Dockerfile, you can download the raw Dockerfile from this repository, or you can clone
this repository entirely and build from it.

2.1) Downloading the Dockerfile

Get the [Dockerfile][https://rawgithubusercontent.com/naroga/docker-php56/master/Dockerfile] here, and put it in a folder:

    mkdir naroga-php-56
    cd naroga-php-56
    wget https://rawgithubusercontent.com/naroga/docker-php56/master/Dockerfile
    docker build -t naroga/php56 .

2.2) Cloning the repository:

Clone this repository:

    git clone https://github.com/naroga/docker-php56 naroga-php-56

Now, build the image from the cloned folder:
  
    cd naroga-php-56
    docker build -t naroga/php56 .

3) Running a job
----------------

To test if everything's working, run
    
    JOB=$(docker run -d naroga/php56 /bin/sh -c "php -v")
    docker logs $JOB

The previous snippet should display:

   PHP 5.6.4-ubuntu6.2 (cli) ...

If a newer version is displayed, don't worry. This image always installs the latest stable distribution.
