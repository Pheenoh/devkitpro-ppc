FROM ubuntu:latest
RUN apt update && apt install wget -y && apt install gpg -y && apt install libxml2 -y && apt install xz-utils -y && apt install make -y && apt install git -y
RUN wget https://github.com/devkitPro/pacman/releases/download/devkitpro-pacman-1.0.1/devkitpro-pacman.deb
RUN dpkg -i devkitpro-pacman.deb
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=${DEVKITPRO}/devkitARM
ENV DEVKITPPC=${DEVKITPRO}/devkitPPC
ENV PATH=${DEVKITPRO}/tools/bin:$PATH
RUN dkp-pacman -S --noconfirm gamecube-dev
ENTRYPOINT ["tail", "-f", "/dev/null"]