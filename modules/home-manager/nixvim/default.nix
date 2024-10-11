{config, pkgs, inputs, ... }: let 
in

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
### plugins
        ./config/plugins/lsp.nix
        ./config/plugins/treesitter.nix
        ./config/plugins/telescope.nix
        ./config/plugins/whichkey.nix
        ./config/plugins/colorschemes.nix
        ./config/plugins/noice.nix        
        ./config/plugins/notify.nix
        ./config/plugins/oil.nix
        ./config/plugins/bufferline.nix
        ./config/plugins/git.nix
        ./config/plugins/mini.nix
        ./config/plugins/cmp.nix
        ./config/plugins/markdown-preview.nix
        ./config/plugins/web-devicons.nix
        # ./config/plugins/lualine.nix
        # ./config/plugins/ufo.nix
        # ./config/plugins/neorg.nix
        #
### basics
        ./config/keymaps.nix
        ./config/options.nix
    ];

    programs.nixvim={
        enable=true;
        defaultEditor = true;

        performance = {
            byteCompileLua = {
                enable = true;
                nvimRuntime = true;
                configs = true;
                plugins = true;
            };
        };

    };
}
