FROM node:20.4.0-alpine

ENV TZ=America/Chicago

RUN apk update

RUN set -ex && \
    apk add --no-cache \
    bash \
    bluez \
    # bluez-tools bluez-hcidump bluetooth 
    unzip \
    wget \
    usbutils \
    #git \
    python3 \
    tzdata \
    openrc

RUN npm config set cache /data/.npm --global


RUN wget https://github.com/baronbrew/aioblescan/archive/master.zip
#RUN wget https://github.com/baronbrew/aioblescan/archive/refs/tags/0.2.4.zip

RUN unzip master.zip

WORKDIR /aioblescan-master/

RUN python3 setup.py install

WORKDIR /

RUN npm install node-red node-red-dashboard -g

ENV NODE_RED_VERSION=$NODE_RED_VERSION \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules \
    PATH=/usr/src/node-red/node_modules/.bin:${PATH}

COPY flows.json /flows.json

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]