# Java IDE for Neovim 0.7

The config may work but is not guaranteed to work with future versions of Neovim or nvim-jdtls, the plugins are pinned to stable tested versions.

## Setup 

1. Make sure you have Java 11 or greater installed, you will also need `npm` installed for the testing bundle

2. Install jdtls

Open update Neovim and install `jdtls`

```sh
:LspInstall jdtls
```

3. Install [java-debug](https://github.com/microsoft/java-debug)

```sh
git clone https://github.com/microsoft/java-debug ~/.config/nvim/java-debug

cd ~/.config/nvim/java-debug

./mvnw clean install
```

4. Install [vscode-java-test](https://github.com/microsoft/vscode-java-test)

```sh
git clone https://github.com/microsoft/vscode-java-test.git ~/.config/nvim/vscode-java-test

cd ~/.config/nvim/vscode-java-test

npm install

npm run build-plugin
```

5. Choose your formatter

You can choose to continue to use `google-java-format`, which is preconfigured for this but you will need to install it.

You can read more about it here: [google-java-format](https://github.com/google/google-java-format)

- Mac:

  ```sh
  brew install google-java-format
  ```

- Arch:

  ```sh
  paru -S google-java-format
  ```

Alternatively you can use the formatter builtin with `jdtls` by:

- Removing this line: [null-ls formatter](https://github.com/LunarVim/nvim-basic-ide/blob/ef5553049148cfd69b3a6119395f05c79a8f8895/lua/user/lsp/null-ls.lua#L15)

- Setting `jdtls` formatter to true [here](https://github.com/LunarVim/nvim-basic-ide/blob/ef5553049148cfd69b3a6119395f05c79a8f8895/ftplugin/java.lua#L123)

- Removing or setting this line to `true` [here](https://github.com/LunarVim/nvim-basic-ide/blob/0eb2229349fecedb875fb063ae8f4e20944ebba5/lua/user/lsp/handlers.lua#L85)

## Deeper Dive

For a better understanding of how this works and to keep updated with the project make sure to checkout the [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) repository.

## Keybindings

- General: [keybindings](https://github.com/LunarVim/nvim-basic-ide/blob/java-ide-0.7/lua/user/keymaps.lua)

- LSP: [keybindings](https://github.com/LunarVim/nvim-basic-ide/blob/ef5553049148cfd69b3a6119395f05c79a8f8895/lua/user/lsp/handlers.lua#L45)

- Java Specific: [keybindings](https://github.com/LunarVim/nvim-basic-ide/blob/ef5553049148cfd69b3a6119395f05c79a8f8895/ftplugin/java.lua#L192)
