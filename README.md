# git-color-path.zsh

Color the path of a git directory in your command line prompt.

## Installation

```
git clone --depth=1 ### [whereever you keep your zsh plugins]
```

```zsh
# in your .zshrc

source /path/to/zsh-plugins/git-color-path/git-color-path.zsh

# optional
# always display full path
# ZSH_THEME_COLOR_PATH_FULL=true

# optional
# format from the git root directory onward,
# unless formateding is applied to subdirectories
ZSH_THEME_COLOR_PATH_FORMAT_1="%F{3}" # yellow

# optional
# format all git subdirectories
ZSH_THEME_COLOR_PATH_FORMAT_2="%F{11}" # bright yellow

PROMPT="%n@%m $(git_color_path) %#"
```

## Intentions

I just want to share a little script from my `.zshrc`. Hope you find it usefull.
I'm open for suggestions and improvements!

The formating is something you should be able to setup however you feel like.
You can pass either one or two formating strings. One style will be applied to
the whole git directory of the path; two styples will be applied to the root
directory and the subdirectories respectivly.There is no formating at the
begining of the path, so that you have to apply any forating intentionally
before calling the function. There is a format reset at the end of the path, so
that you have to apply intentional formating after calling the function.
