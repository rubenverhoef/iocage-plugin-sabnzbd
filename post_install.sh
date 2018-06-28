#!/bin/sh

python2.7 -m pip install cheetah
python2.7 -m pip install cryptography
python2.7 -m pip install sabyenc

cd / && curl -s https://api.github.com/repos/sabnzbd/sabnzbd/releases/latest | grep "browser_download_url.*-src.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi -
tar -xvzf SABnzbd*.tar.gz -C /root
rm SABnzbd*.tar.gz
mv /root/SABnzbd* /root/SABnzbd

chmod +x /etc/rc.d/sabnzbd

ln -s /usr/local/bin/python2.7 /usr/bin/python

sysrc 'sabnzbd_enable=YES'

service sabnzbd start
