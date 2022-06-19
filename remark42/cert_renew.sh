#!/usr/bin/env bash
## TODO: different way to generate cert, without having to stop proxy and freeing 443
docker stop proxy
docker run -it --rm --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -p 80:80 -p 443:443 \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    certbot/certbot certonly --agree-tos --email w.zolnierowicz@gmail.com --standalone --non-interactive -d remark42.jatuzprzypadku.pl

sudo chmod -R 755 /etc/letsencrypt/live/
sudo cp -L /etc/letsencrypt/live/remark42.jatuzprzypadku.pl/*.pem ./jatuzprzypadku.pl/ssl/

docker start proxy
