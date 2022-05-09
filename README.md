# jatuzprzypadku.pl
## build
```
rm -rf public/
hugo
```

## debug
```
hugo server --minify --disableFastRender --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log --verbose
```