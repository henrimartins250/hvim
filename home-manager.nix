{
  config,
  pkgs,
  lib,
  ...
}: {
  options.programs.my-nvim.enable =
    lib.mkEnableOption "my Neovim environment";

  config = lib.mkIf config.programs.hvim.enable {
    home.packages = with pkgs; [
      neovim

      nil

      # plugins
      tree-sitter
      codeium
     
      # Linters / Formatters
      stylua
      shfmt
      shellcheck
      alejandra # Nix
      black # Python
      prettier # JS / TS / etc
      rustfmt # Rust
      clang-tools # C / C++
      gofumpt # Go
      taplo # TOML

      # Language Servers
      wgsl-analyzer
      rust-analyzer
      gopls
      lua-language-server
      kdePackages.qtdeclarative

      nerd-fonts.caskaydia-mono
    ];

    home.file.".config/nvim".source = ./;
  };
}
