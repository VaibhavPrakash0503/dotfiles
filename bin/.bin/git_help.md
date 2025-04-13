# BASIC GIT COMMANDS
## Initialize a repository
git init

## Clone a repository
git clone <url>

## Check status
git status

## Add files for staging area
git add <file>
git add .

## Commit changes 
git commit -m "Commit message"

## Revert back to last commit
git checkout HEAD -- <file_name>

## Revert Back to specifc commit
git checkout <commit_hash> -- <file_name>

## Modify the recent commit
git commit -amend

# BRANCHING AND MERGING

## Create Branch
git branch <branch-name>

## Switch branch
git switch <brach-name>

## Create and switch
git switch -c <branch-name>      -c creates the branch

## List branches
git branch

## Merge Branch
git merge <branch-name>     merges the specified branch to the current branch

## Delete branch
git branch -d <branch-name>  prompts if the work of the branch has not been merged

git branch -D <branch-name> force delete branch

# REMOTE REPOSITORY

## add a remote repo
git remote add origin <repositiry-url>

## List remote repository
git remote -v

## Fetch updates from remote like changes without merging
git merge

## Fetches and merges changes
git pull

## Push changes to remote
git push

