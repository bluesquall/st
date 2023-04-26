This is a personal fork of [`st`] with a few patches applied.

I'm working on making it install via `nix` & `home-manager` as a flake.

In the meantime, to use it on a non-NixOS machine, it is easy to build, and
you can simply copy the output to `~/.local/bin`.

On Ubuntu 22.04, I needed to:

```
sudo apt install libfreetype-dev libxft-dev
```
I had the FiraCode Nerd font installed by home-manager, but `st` didn't find
it initially. I downloaded the zipfile and decompressed it into
`~/.local/share/fonts` and then ran:
```
fc-cache -fv
```
It actually looked like that picked up some of the nix-installed paths, too,
so I am not sure whether `~/.local/share/fonts` is being used. I will check
that when I have some free time.
