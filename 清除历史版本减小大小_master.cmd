git checkout --orphan latest_branch
git add -A
git commit -am "清除历史版本，以减小大小"
git branch -D master
git branch -m master
git push -f origin master
Pause