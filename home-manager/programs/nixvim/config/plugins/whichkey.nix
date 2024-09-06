{ 
    programs.nixvim.plugins.which-key = { 
        enable = true; 
        settings = {
            delay = 200;
            win = {
                border = "single";
            };
            preset="modern";
        };
    }; 
}
