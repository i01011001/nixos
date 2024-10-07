{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        # autosuggestion.enable = true;
        # syntaxHighlighting.enable = true;
        shellAliases = {
            update = "sudo nixos-rebuild switch --verbose";
            updatehm = ''home-manager switch --flake /etc/nixos --extra-experimental-features nix-command --extra-experimental-features flakes'';
            getpath="find ~ -type d | fzf | tr -d '\n' | wl-copy";
            source_idf="source $HOME/code/esp/idf/esp-idf/export.sh"; 
            source_matter="source $HOME/code/esp/idf/esp-matter/export.sh" ;
        };
        history = {
            size = 10000;
            path = "$HOME/.cache/zsh/history";
        };
        initExtra = builtins.readFile ./zsh;
    };
}
