FROM ubuntu:bionic
RUN apt-get update && apt-get install -y -qq qt5-default build-essential libfuse2 file rsync
ADD https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage /root/
ADD https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage /root/
ADD https://github.com/linuxdeploy/linuxdeploy-plugin-appimage/releases/download/continuous/linuxdeploy-plugin-appimage-x86_64.AppImage /root/
ADD https://github.com/AppImage/AppImageUpdate/releases/download/continuous/appimageupdatetool-x86_64.AppImage /root/
WORKDIR /root
RUN chmod +x linuxdeploy-x86_64.AppImage linuxdeploy-plugin-qt-x86_64.AppImage appimageupdatetool-x86_64.AppImage linuxdeploy-plugin-appimage-x86_64.AppImage
