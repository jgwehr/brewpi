The majority of this docker image is derived from https://github.com/davismariotti/tilt-docker and [TiltPi](https://github.com/baronbrew/TILTpi/). A huge thank you for doing all the hardwork!

I am using a RaspberryPi3 for this container, and had issues with arm/v7 availability from the above image. Thus, I made my own and simply altered to use node:20.4.0-alpine

Over time, TiltPi software hasn't kept up with Operating Systems and various sub-systems it is meant to run on. So, my ultimate goal is to have a Docker container which is completely independent from its host. Pinning Versions where possible helps achieve this goal. I wasn't able to pin aioblescan, unfortunately. Also, the first version of this image has an altered version of the tiltpi flow.


Pushing the built image:

1. `docker image tag brewpi-tiltpi:latest snoopeppers/tiltpi-docker:latest`
1. `docker image tag brewpi-tiltpi:latest snoopeppers/tiltpi-docker:0.1.0`
1. `docker image push snoopeppers/tiltpi-docker:latest`
1. `docker image push snoopeppers/tiltpi-docker:0.1.0`