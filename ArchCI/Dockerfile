FROM archlinux
RUN echo "[multilib]" >> /etc/pacman.conf && echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Sy --needed --noconfirm git boost cmake make gcc lib32-sdl2 lib32-glew lib32-freetype2 lib32-libglvnd openssh
