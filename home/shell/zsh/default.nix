{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.config/zsh/zsh_history";
    };

    initExtra = ''
      # TODO
    '';

    shellAliases = {
      # Core tools
      ll = "ls -l --color=auto";
      la = "ls -la --color=auto";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };
  };
}
