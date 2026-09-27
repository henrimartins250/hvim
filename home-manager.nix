{
  config,
  pkgs,
  lib,
  ...
}: {
  options.programs.hvim.enable =
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
      pgformatter #
      sql-formatter # SQL
      sqlfluff #

      # Language Servers
      wgsl-analyzer
      rust-analyzer
      gopls
      lua-language-server
      marksman
      typescript-language-server
      clang-tools
      kdePackages.qtdeclarative
      sqls

      nerd-fonts.caskaydia-mono
    ];

    home.file.".config/nvim".source = ./.;
  };
}
