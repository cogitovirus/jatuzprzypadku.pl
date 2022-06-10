# jatuzprzypadku.pl
## Dev server
```
hugo server
```
## Build
```
rm -rf public/
hugo
```

## remark24 comments - notes
https://www.devbitsandbytes.com/setting-up-remark42-from-scratch/
```
docker-compose pull && docker-compose up -d
```

## mail server - notes
https://github.com/docker-mailserver/docker-mailserver
alternative:
https://www.iredmail.org/

https://www.getrevue.co/app/integrations/forms



## debug
```
hugo server --minify --disableFastRender --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log --verbose
```
Base template forked from: https://github.com/kimcc/hugo-theme-noteworthy
Released under the [MIT License](https://github.com/kimcc/hugo-theme-noteworthy/blob/master/LICENSE.md).