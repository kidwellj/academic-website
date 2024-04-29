gitea hacking

Need to mirror to remote repository, with push to github on changes and trigger rebuild on netlify

https://github.com/go-gitea/gitea/issues/3480#issuecomment-437298285

``` 
#!/bin/bash
git push --mirror --quiet https://user:token@github.com/osuripple/hanayo.git &> /dev/null &
echo 'osuripple/hanayo update initiated.'
```

https://github.com/go-gitea/gitea/issues/3480#issuecomment-536990459

Running nested git repos as submodules:

https://git-scm.com/book/en/v2/Git-Tools-Submodules

`git submodule add https://github.com/chaconinc/DbConnector`
