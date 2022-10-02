# jatuzprzypadku.pl
Source code for https://jatuzprzypadku.pl . Blog written with [Hugo](https://gohugo.io/), hosted on GCP. Base template forked from [noteworthy](https://github.com/kimcc/hugo-theme-noteworthy)

Frontend is a static site served from a GCP Bucket with a load balancer in front of it.

Backend is a micro Compute Engine VM that serves [Remark42](https://remark42.com/) comments. Two docker containers. Remark42 and one reverse-proxy.

## Development
local server
```
hugo server
```
with remark42:
```
docker-compose pull && docker-compose --env-file .envlocal up -d
```
## Deploy
There's a deploy script that will generate the static site files and deploy the site with firebase
```
./deply.sh
```

## Helpful tips & tricks
ssh to the backend server
```
gcloud compute ssh --zone "us-east1-b" "cvjp-backend"  --project "jatuzprzypadku"
```
scp files for setup
```
gcloud compute scp --zone "us-east1-b" --project "jatuzprzypadku" --recurse ./docker-compose.yml cvjp-backend:~/jatuzprzypadku.pl/docker-compose.yml
```
hugo debug
```
hugo server --minify --disableFastRender --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log --verbose
```

## Backend setup

1. copy docker-compose, envfile, nginx config

>> Note: chosing container optimized VM turned out to be a shot in the foot. Ironically they don't come with docker-compose, so compose commands are run from docker as well.
2. Run docker compose
```
docker run --rm -v "$PWD:$PWD" -v /var/run/docker.sock:/var/run/docker.sock -w="$PWD" docker/compose --env-file .envprod up -d
```
----------
Note: getting ssl cert, with docker certbot
```
docker run -it --rm --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -p 80:80 -p 443:443 \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    certbot/certbot certonly --agree-tos --email w.zolnierowicz@gmail.com --standalone --non-interactive -d remark42.jatuzprzypadku.pl
```
TODO: fix auto renew script
It is available on the VM as cert_renew.sh
This certificate expires on 2022-12-31.



