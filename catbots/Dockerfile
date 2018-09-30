FROM nullworks/cathook-docker-opengl

WORKDIR /home/user
USER 1000

#Cathook!
RUN mkdir CH && cd CH && git clone --recursive https://github.com/nullworks/cathook

ENV botcount 1
ENV APP "/home/user/CH/runtime"
EXPOSE 8080
EXPOSE 8081

ADD image /

RUN cd CH && ./setup


USER 0
WORKDIR /root
