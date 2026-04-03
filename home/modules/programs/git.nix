{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      url = {
        "https://github.com/" = {
          insteadOf = "git@github.com:";
        };
      };
    };
  };
}
