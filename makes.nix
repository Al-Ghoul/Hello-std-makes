_: {
  cache = {
    readNixos = true;
    extra = {
      makes = {
        enable = true;
        pubKey = "makes.cachix.org-1:zO7UjWLTRR8Vfzkgsu1PESjmb6ymy1e4OE9YfMmCQR4=";
        type = "cachix";
        url = "https://makes.cachix.org";
        write = true;
      };
    };
  };
  lintNix = {
    enable = true;
    targets = ["/"];
  };
}
