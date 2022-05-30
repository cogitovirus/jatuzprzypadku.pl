# jatuzprzypadku.pl
## build
```
rm -rf public/
hugo
```

## remark24 comments
https://www.devbitsandbytes.com/setting-up-remark42-from-scratch/
```
docker-compose pull && docker-compose up -d
```

# mail server
https://github.com/docker-mailserver/docker-mailserver
alternative:
https://www.iredmail.org/

## debug
```
hugo server --minify --disableFastRender --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log --verbose
```
Base template forked from: https://github.com/kimcc/hugo-theme-noteworthy
Released under the [MIT License](https://github.com/kimcc/hugo-theme-noteworthy/blob/master/LICENSE.md).