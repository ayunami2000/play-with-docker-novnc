#!/bin/bash
sudo apt update
wget http://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad
wget http://launchpadlibrarian.net/304824168/chocolate-doom_2.3.0-3_amd64.deb
sudo apt install -y ./chocolate-doom_2.3.0-3_amd64.deb
export SDL_VIDEODRIVER=caca
doom -iwad doom1.wad
