# dotfiles

## My personal dotfiles repo

This dotfiles repo is growing as I learn. The setup process is documented in the [dotfiles blog post series](https://knuth.info/posts/the-solo-stack/dotfiles/) on my [Blog](https://knuth.info)

## Progress so far

- set up chezmoi for dotfile management
- set up git configuration for chezmoi repo with SSH key and age
- set up ansible for software installation

## Test in Containers

Testing in a container is as easy as

```zsh
podman run -it --rm debian:bookworm-slim bash
apt update -y && apt upgrade -y && apt install curl git nano -y
mkdir -p ~/.config/age
chmod 700 ~/.config/age
touch ~/.config/age/dotfiles-repo-key.txt
chmod 600 ~/.config/age/dotfiles-repo-key.txt
nano ~/.config/age/dotfiles-repo-key.txt  # paste in key
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply knuth-info
zsh
```
