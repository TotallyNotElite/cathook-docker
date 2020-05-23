FROM ubuntu:18.04
ADD https://raw.githubusercontent.com/nullworks/cathook/master/scripts/dependencycheck /dependencycheck
RUN CH_SUDO="" CH_DEPENDENCYCHECK_FORCEYES="" bash /dependencycheck
