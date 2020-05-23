FROM ubuntu:18.04
ADD https://raw.githubusercontent.com/nullworks/cathook/master/scripts/dependencycheck /dependencycheck
RUN apt-get update && apt-get install ca-certificates -y
RUN CH_SUDO=" " CH_DEPENDENCYCHECK_FORCEYES=true bash /dependencycheck
