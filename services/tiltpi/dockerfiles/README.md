The majority of this docker image is derived from https://github.com/davismariotti/tilt-docker. A huge thank you for doing all the hardwork!

I am using a RaspberryPi3 for this container, and had issues with arm/v7 availability from the above image. Thus, I made my own and simply altered to use node:20.4.0-alpine

I've also pinned aioblescan to 0.2.4. Over time, TiltPi software hasn't kept up with the Operating Systems, and various sub-systems, it is meant to run on. So, my ultimate goal is to have a Docker container which is completely independent from its host. Pinning Versions where possible helps achieve this goal.