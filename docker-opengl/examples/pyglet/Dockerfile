FROM gilureta/opengl:ubuntu16.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  mesa-utils
RUN apt-get install -y freeglut3-dev
RUN apt-get install -y python python-pip
RUN pip install pyglet

ADD . /src

ENV APP "/src/pyglet_test.py"
