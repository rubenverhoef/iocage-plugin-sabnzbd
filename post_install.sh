#!/bin/sh

cd / && curl -s https://api.github.com/repos/sabnzbd/sabnzbd/releases/latest | grep "browser_download_url.*-src.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi -
tar -xvzf SABnzbd*.tar.gz -C /root
rm SABnzbd*.tar.gz
mv /root/SABnzbd* /root/SABnzbd

python3.7 -m pip install wheel
python3.7 -m pip install -r /root/SABnzbd/requirements.txt -U

chmod +x /usr/local/etc/rc.d/sabnzbd
