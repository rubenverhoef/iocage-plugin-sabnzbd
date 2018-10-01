#!/bin/sh

python2.7 -m pip install --upgrade pip
python2.7 -m pip install cheetah
python2.7 -m pip install cryptography
python2.7 -m pip install sabyenc

cd / && curl -s https://api.github.com/repos/sabnzbd/sabnzbd/releases/latest | grep "browser_download_url.*-src.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi -
tar -xvzf SABnzbd*.tar.gz -C /usr/local/bin
rm SABnzbd*.tar.gz
mv /usr/local/bin/SABnzbd* /usr/local/bin/SABnzbd

chmod +x /usr/local/etc/rc.d/sabnzbd
