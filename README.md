# Anatoly Korobov's dotfiles
=================

## Installation

```shell
git clone https://github.com/anatoly-kor/dotfiles .dotfiles
cd .dotfiles
./install

vim -c "PluginInstall"
```

FIXME: 
install with brew:
- cmake
go to /Users/ak/.local/share/nvim/lazy/telescope-fzf-native.nvim
cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build

