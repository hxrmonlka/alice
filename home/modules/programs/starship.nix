{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true; # For fish shell
    settings = {
      format = ''
        [](#9A348E)\
        $os\
        $username\
        [](bg:#DA627D fg:#9A348E)\
        $directory\
        [](fg:#DA627D bg:#FCA17D)\
        $git_branch\
        $git_status\
        [](fg:#FCA17D bg:#86BBD8)\
        $c\
        $elixir\
        $elm\
        $golang\
        $gradle\
        $haskell\
        $java\
        $julia\
        $nodejs\
        $nim\
        $rust\
        $scala\
        [](fg:#86BBD8 bg:#06969A)\
        $docker_context\
        [](fg:#06969A bg:#33658A)\
        $time\
        [ ](fg:#33658A)\
      '';
      
      username = {
        show_always = true;
        style_user = "bg:#9A348E";
        style_root = "bg:#9A348E";
        format = "[$user ]($style)";
        disabled = false;
      };
      
      directory = {
        style = "bg:#DA627D";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
      
      c.symbol = " ";
      c.style = "bg:#86BBD8";
      c.format = "[ $symbol ($version) ]($style)";
      
      git_branch.symbol = "";
      git_branch.style = "bg:#FCA17D";
      git_branch.format = "[ $symbol $branch ]($style)";
      
      git_status.style = "bg:#FCA17D";
      git_status.format = "[$all_status$ahead_behind ]($style)";
      
      nodejs.symbol = "";
      nodejs.style = "bg:#86BBD8";
      nodejs.format = "[ $symbol ($version) ]($style)";
      
      rust.symbol = "";
      rust.style = "bg:#86BBD8";
      rust.format = "[ $symbol ($version) ]($style)";
      
      docker_context.symbol = " ";
      docker_context.style = "bg:#06969A";
      docker_context.format = "[ $symbol $context ]($style)";
      
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#33658A";
        format = "[ ♥ $time ]($style)";
      };
    };
  };
}
