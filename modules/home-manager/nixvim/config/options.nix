{
    programs.nixvim = {
        opts = {
            laststatus = 0;
            number = true;
            relativenumber =true;
            cursorline = true;
            cursorlineopt = "number";

            splitbelow = true;
            splitright = true;

            splitkeep = "screen";

            termguicolors = true;
            showmode = false;

            incsearch =  true;
            hlsearch = false;
            ignorecase = true;
            smartcase = true;

            shiftwidth = 4;
            tabstop = 4;
            softtabstop = 4;
            expandtab  = true;

            showtabline = 4;
            signcolumn="yes";
            ttyfast = true;

            clipboard = "unnamedplus";

            smartindent = true;
            breakindent = true;
            scrolloff = 8;

            foldcolumn = "0";
            foldenable = true;
            foldtext = "";
            foldnestmax = 4;
            # foldlevel = 99;
            # foldlevelstart = 99;

            foldmethod = "expr";
            foldexpr = "v:lua.vim.treesitter.foldexpr()";

            linebreak = true;

            wrap = false;
            spell = false;
            swapfile = false;
            timeoutlen = 300;
            mouse = "";

            # Enable persistent undo history
            backup = false;
            undofile = true;

            updatetime = 50; # faster completion (4000ms default)

            # Set completeopt to have a better completion experience
            completeopt = [
                "menuone"
                "noselect"
                "noinsert"
            ]; # mostly just for cmp

            # Set encoding type
            encoding = "utf-8";
            fileencoding = "utf-8";
        };
    };
}
