{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        # autosuggestion.enable = true;
        # syntaxHighlighting.enable = true;
        shellAliases = {
            update = "sudo nixos-rebuild switch --verbose";
            getpath="find ~ -type d | fzf | tr -d '\n' | wl-copy";
            source_idf="source $HOME/code/esp/idf/esp-idf/export.sh"; 
            source_matter="source $HOME/code/esp/idf/esp-matter/export.sh" ;
            nixc= "cd /etc/nixos/ && nvim .";
            fnvim = ''nvim "$(fd --type file| fzf)" '';
        };
        history = {
            size = 10000;
            path = "$HOME/.cache/zsh/history";
        };
        initExtra = builtins.readFile ./zsh;
    };
}
