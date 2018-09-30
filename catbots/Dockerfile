FROM nullworks/cathook-docker-opengl

WORKDIR /home/user
USER 1000

#Cathook!
RUN mkdir CH && cd CH && git clone --recursive https://github.com/nullworks/cathook && cd cathook && mkdir build && cd build && cmake .. && sudo make data

ENV count 4

ADD image /

RUN cd CH && sudo chown -R user scripts && cd scripts && bash 00-generate-random-username.sh && bash 01-usergroup.sh && bash 05-locate-cathook.sh /home/user/CH/cathook && bash 06-build-cathook.sh && bash 08-get-account-generator.sh && bash 09-get-ipc-server.sh && bash 10-get-webpanel.sh


USER 0
WORKDIR /root
