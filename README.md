## Environment

```sh
$ sudo apt-get -y --force-yes install autoconf automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texi2html zlib1g-dev yasm libx264-dev cmake mercurial libmp3lame-dev libopus-dev
$ mkdir ~/ffmpeg_sources
$ cd ~/ffmpeg_sources
$ wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master
$ tar xzvf fdk-aac.tar.gz
$ cd mstorsjo-fdk-aac*
$ autoreconf -fiv
$ ./configure --prefix="$HOME/ffmpeg_build" --disable-shared
$ make
$ make install
$ make distclean
$ cd ~/ffmpeg_sources
$ wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
$ tar xjvf libvpx-v1.3.0.tar.bz2
$ cd libvpx-v1.3.0
$ PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests
$ PATH="$HOME/bin:$PATH" make
$ make install
$ make clean
$ cd ~/ffmpeg_sources
$ hg clone https://bitbucket.org/multicoreware/x265
$ cd x265/build/linux
$ PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
$ make
$ make install
$ cd ~/ffmpeg_sources
$ wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
$ tar xjvf ffmpeg-snapshot.tar.bz2
$ cd ffmpeg
$ PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure   --prefix="$HOME/ffmpeg_build"   --extra-cflags="-I$HOME/ffmpeg_build/include"   --extra-ldflags="-L$HOME/ffmpeg_build/lib"   --bindir="$HOME/bin"   --pkg-config-flags="--static"   --enable-gpl   --enable-libass   --enable-libfdk-aac   --enable-libfreetype   --enable-libmp3lame   --enable-libopus   --enable-libtheora   --enable-libvorbis   --enable-libvpx   --enable-libx264   --enable-libx265   --enable-nonfree
$ PATH="$HOME/bin:$PATH" make
$ make install
```

run `~/bin/ffmpeg`

