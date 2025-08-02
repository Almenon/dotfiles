# dotfiles

My personal dotfiles, inspired by https://webpro.nl/articles/getting-started-with-dotfiles

I used to just a simple github gist for my bash aliases, but as the years progressed, I have had more and more customizations.
Now I need a git repo to package everything!

## Setup
In .zshrc:
```
# {.example,.alias} for more loading
for DOTFILE in ~/dotfiles/.alias; do
  . "$DOTFILE"
done
```

Then go to repo root and run `./setup.sh`

Proceed with manually adjusting any other noted settings / files

## Manual adjustments
* manual adjustments in .macos if on mac
* chrome settings -> appearance -> page view 110%
* default oh-my-zsh terminal colors may be ugly, see https://www.reddit.com/r/zsh/comments/11whqrj/how_to_change_color_of_directories_in_ohmyzsh/jcy04cu/ for a fix