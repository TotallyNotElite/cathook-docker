FROM ubuntu:18.04
RUN dpkg --add-architecture i386
RUN apt-get update - && apt-get install -y -qq software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update -qq
RUN apt-get install -y -qq build-essential git gcc-multilib g++-multilib software-properties-common gcc-snapshot g++-7-multilib gcc-7 g++-7 libssl-dev:i386 libboost-all-dev libc6-dev:i386 gdb libsdl2-dev libglew-dev:i386 libglew-dev libfreetype6-dev libfreetype6-dev:i386 cmake libpng-dev libssl-dev cmake gcc-multilib g++-multilib rsync
