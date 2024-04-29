This is a personal fork of [`st`] with a few patches applied.

I'm working on making it install via `nix` & `home-manager` as a flake.

In the meantime, to use it on a non-NixOS machine, it is easy to build, and
you can simply `sudo make install`, or copy the output to `~/.local/bin`.


_____________

To use your installed version of `st` as the default terminal in Pop!OS[^1]:
```
make clean all && sudo make install
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $( which st ) 10
sudo update-alternatives --config x-terminal-emulator
# select the option for `st`
# now `Mod4+T` will give you a new instance of `st`,
# and you can also set `Mod4+Enter` to do the same
```

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

_____________
[^1]: see [this comment on `r/pop_os`](https://www.reddit.com/r/pop_os/comments/kcnhxq/comment/gfs999e/)
_____________

[`st`]: https://st.suckless.org/
