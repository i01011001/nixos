{
    programs.alacritty = {
        enable = true;
       settings = {
            window = {
                padding = { x=4; y=4; };
                decorations = "None";
            };
            font = {
                    normal = { family="Iosevka NF Medium"; style="Regular";};
                    size = 11;
                    offset = {y=-2;};
            };
            keyboard = {
                bindings = [
                    {
                     key = "N";
                     mods = "Control|Shift";
                     action = "SpawnNewInstance";
                   }
                ];
                };
            colors = {
                primary = {
                    background = "#000000";
                };
                normal = {
                    black = "#303030";
                    red = "#bf656e";
                    green = "#83ad84";
                    yellow = "#dbc68c";
                    blue = "#6286ad";
                    magenta = "#8782af";
                    cyan = "#7dafac";
                    white = "#b0b0b0";
                };
                bright = {
                    black = "#707070";
                    red = "#bf656e";
                    green = "#83ad84";
                    yellow = "#dbc68c";
                    blue = "#6286ad";
                    magenta = "#8782af";
                    cyan = "#7dafac";
                    white = "#e0e0e0";
                };
            };
        };
    };
}
