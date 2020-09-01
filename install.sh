#!/bin/bash
#set -x
clear

function Zagolovok {
echo -en "\n"
echo "╔═════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                             ║"
echo "║                     Установка ffmpeg и его зависимостей                     ║"
echo "║                                                                             ║"
echo "╚═════════════════════════════════════════════════════════════════════════════╝"
echo -en "\n"
}

Zagolovok

echo -en "\n" ; echo "  # # Установка необходимых зависимостей"
sudo apt -y install autoconf automake build-essential cmake doxygen git graphviz imagemagick libasound2-dev libass-dev libfreetype6-dev libgmp-dev libmp3lame-dev libopus-dev librtmp-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev libsdl2-ttf-dev libsnappy-dev libsoxr-dev libssh-gcrypt-dev libssl-dev libtool libv4l-dev libva-dev libvorbis-dev libwebp-dev libx264-dev libxcb-shape0-dev libxcb-shm0-dev libxcb-xfixes0-dev libxcb1-dev libxml2-dev lzma-dev meson nasm pkg-config python3-dev python3-pip texinfo wget yasm zlib1g-dev

sudo apt install -y build-essential cmake libgtk2.0-dev pkg-config python-numpy python-dev libtiff5-dev libjasper-dev libopencv-dev checkinstall pkg-config yasm libjasper-dev libswscale-dev libdc1394-22-dev libxine2 libgstreamer0.10-dev libv4l-dev libgstreamer-plugins-base0.10-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libsdl2-dev libtool libvdpau-dev libvorbis-dev libxcb1-dev libvpx-dev libpulse-dev libsoxr-dev libopus-dev libwebp-dev libxvidcore-dev libzvbi-dev libxcb-shm0-dev libv4l-dev libxcb-xfixes0-dev libvpx-dev libmp3lame-dev pkg-config texinfo libpulse-dev libomxil-bellagio-dev libssh-gcrypt-dev libssl-dev wget zlib1g-dev nasm yasm libx264-dev libnuma-dev libnuma-dev libgles2-mesa-dev git devscripts equivs meson


mkdir ~/ffmpeg_sources && \
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --disable-shared && \
make && \
sudo make install



sudo ldconfig



sudo apt install glslang* spirv-tool libplacebo*


sudo apt build-dep ffmpeg


mkdir ~/bin


cd ~/ffmpeg_sources && wget https://ffmpeg.org/releases/ffmpeg-4.3.1.tar.bz2 && tar xjvf ffmpeg-4.3.1.tar.bz2 && cd ffmpeg-4.3.1




PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --pkg-config-flags="--static" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --extra-libs="-lpthread -lm" --bindir="$HOME/bin" --enable-gpl --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libv4l2 --enable-libxvid --enable-sdl2 --enable-libx264 --enable-pthreads --enable-openssl --enable-nonfree --disable-debug --enable-libsoxr --enable-version3 --enable-libvpx --disable-doc --disable-htmlpages --enable-libpulse --enable-libssh --disable-manpages --disable-podpages --enable-opengl --enable-libzvbi --enable-avfilter --enable-filters --enable-mmal --enable-omx --enable-omx-rpi --enable-decoder=h264_mmal --enable-decoder=mpeg2_mmal --enable-encoder=h264_omx --enable-runtime-cpudetect --enable-libwebp --disable-avresample --enable-swresample --enable-x86asm --enable-libjack --enable-shared --disable-static --enable-librubberband --disable-vdpau --disable-vaapi --enable-gmp --enable-hardcoded-tables --disable-stripping



PATH="$HOME/bin:$PATH" make -j 4



make install && cd ~/bin && sudo cp ff* /usr/local/bin/


sudo apt build-dep mpv



sudo apt purge libavcodec-dev libavdevice-dev libswresample-dev libpostproc-dev libswscale-dev libavformat-dev


sudo apt-mark manual opencv* && sudo apt-mark manual lib* && sudo apt-mark manual *-dev


echo export CPATH=~/ffmpeg_build/include >> .bashrc


echo export LD_LIBRARY_PATH=~/ffmpeg_build/lib >> .bashrc


echo export PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig:/opt/vc/lib/pkgconfig >> .bashrc


close konsole or terminal and open a new one





cd ~/ffmpeg_sources




git clone https://github.com/mpv-player/mpv.git




cd mpv



./bootstrap.py




./waf configure --prefix=/usr/local --enable-rpi --enable-rpi-mmal --disable-vaapi --enable-egl-drm --enable-egl-x11 --disable-wayland --disable-wayland-protocols --disable-wayland-scanner --disable-gl-wayland --disable-android --disable-vdpau --disable-vulkan




./waf -j4




sudo ./waf install




mkdir ~/.config/mpv && nano ~/.config/mpv/mpv.conf
text einfügen fullscreen is disabled # entfernen für fullscreen





#fullscreen=yes

gpu-context=rpi

gpu-api=opengl

vo=rpi

hwdec=h264_mmal-mmal-copy

hwdec-codecs=all





sudo nano /boot/config.txt
text einfügen



###########

gpu_mem=128

#dtoverlay=vc4-kms-v3d

#dtoverlay=vc4-fkms-v3d

###############

wenn v3d nicht diabled wird

sagt mpv already in use



speichern



sudo reboot
mpv example.mp4



konsolen output



mpv /media/moon/filme/12.mp4

(+) Video --vid=1 (*) (h264 1288x720 23.976fps)

(+) Audio --aid=1 (*) (aac 2ch 44100Hz)

Using hardware decoding (mmal-copy).

AO: [pulse] 48000Hz stereo 2ch float

VO: [rpi] 1288x720 => 1288x720 yuv420p

AV: 00:01:05 / 02:09:24 (1%) A-V: 0.000 Dropped: 1 Cache: 706s/150MB
