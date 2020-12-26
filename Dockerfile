FROM debian:stable-slim
RUN apt update && apt install wget gpg libxml2 xz-utils make curl pkg-config libarchive13 unzip -y
# -y && apt install gpg -y && apt install libxml2 -y && apt install xz-utils -y && apt install make -y
RUN wget https://github.com/devkitPro/pacman/releases/download/v1.0.2/devkitpro-pacman.amd64.deb
RUN wget https://github.com/zsrtp/romhack-compiler/releases/download/0.0.2/romhack-0.0.2-linux-x64.zip
RUN unzip romhack-0.0.2-linux-x64.zip -d .
RUN chmod +x romhack
RUN mv romhack /usr/bin/romhack
RUN dpkg -i devkitpro-pacman.amd64.deb
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=${DEVKITPRO}/devkitARM
ENV DEVKITPPC=${DEVKITPRO}/devkitPPC
ENV PATH=${DEVKITPRO}/tools/bin:$PATH
RUN dkp-pacman -S --noconfirm gamecube-dev
COPY gz2e01.iso /
ENTRYPOINT ["tail", "-f", "/dev/null"]