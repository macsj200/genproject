#Genproject
==========

Some zsh that'll help you manage your projects better.

Simply clone the repo, edit your .bash_profile or .bashrc as so
```
export PROJECTS_DIR="<your-project-directory-here>"
source <dir-to-repo>/projects.sh
```

and you're good to go!

## Commands
Create a new project with boilerplate git repo
``` new-project <name> ```
Set the project you are currently working oin
``` set-project [<directory>] ```
and use ```project``` to cd into this directory at anytime
