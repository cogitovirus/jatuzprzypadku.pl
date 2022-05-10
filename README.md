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
Base template forked from: https://github.com/kimcc/hugo-theme-noteworthy
Released under the [MIT License](https://github.com/kimcc/hugo-theme-noteworthy/blob/master/LICENSE.md).
