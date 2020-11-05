FROM docker:20.10.0-beta1-dind
ENV DOCKER_COMPOSE_GIT  https://github.com/docker/compose.git

WORKDIR /APP

RUN apk update &&\
    apk add git py3-pip python3 python3-dev gcc make musl \
    libffi-dev g++ openssl-dev 

RUN ln -s /usr/bin/python3 /usr/bin/python &&\
    git clone https://github.com/docker/compose.git /opt/compose

COPY requirement.txt .
COPY submachine .

RUN export PATH=${PATH}:/opt/compose/bin &&\
    pip3 install -r requirement.txt


