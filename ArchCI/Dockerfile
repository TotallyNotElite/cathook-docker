FROM base/archlinux
RUN echo "[multilib]" >> /etc/pacman.conf && echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Sy --needed --noconfirm boost cmake make lib32-libpng gcc gdb lib32-sdl2 lib32-glew freetype2 rsync lib32-openssl git
