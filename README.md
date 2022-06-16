# jatuzprzypadku.pl
## localhost
```
hugo server
```
## build
```
rm -rf public/
hugo
```
## setup
- front-end static site is served from a gcp bucket with a load balancer in front of it
- backend is only running remark comments right now. Those are served from a micro VM on GCP as well.
### Tips & tricks
ssh on the server
```
gcloud compute ssh --zone "europe-west1-b" "cvjp-backend"  --project "jatuzprzypadku"
```
scp files
```
gcloud compute scp --zone "europe-west1-b" --project "jatuzprzypadku" --recurse ./docker-compose.yml cvjp-backend:~/jatuzprzypadku.pl/docker-compose.yml
```
hugo debug
```
hugo server --minify --disableFastRender --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log --verbose
```
### remark42
something like https://www.devbitsandbytes.com/setting-up-remark42-from-scratch/

locally create containers with:

```
docker-compose pull && docker-compose --env-file .envlocal up -d
```

### prod server

copy docker-compose, envfile, nginx config 

chosing container optimized VM turned out to be a shot in the foot. Ironically they don't come with docker-compose, so compose commands are run from docker as well.
```
docker run --rm -v "$PWD:$PWD" -v /var/run/docker.sock:/var/run/docker.sock -w="$PWD" docker/compose --env-file .envprod up -d
```

getting ssl cert, from the docker certbot
```
docker run -it --rm --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -p 80:80 -p 443:443 \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    certbot/certbot certonly --agree-tos --email w.zolnierowicz@gmail.com --standalone --non-interactive -d remark42.jatuzprzypadku.pl 
```
TODO: 
set up auto renewal script: https://stackoverflow.com/q/66638368/4275995

## mailing list
for now it is based on https://www.getrevue.co/app/integrations/forms


Base template was forked from [noteworthy](https://github.com/kimcc/hugo-theme-noteworthy)
