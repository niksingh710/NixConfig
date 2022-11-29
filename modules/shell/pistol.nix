{ config, pkgs, ... }:

{
  programs.pistol = {
    enable = true;
    config = {
      "image/*" = "chafa %pistol-filename%";
      "application/json" ="sh: jq -C '.' %pistol-filename%";
      "inode/directory" = "exa -ahFT -L=1 --color=auto --icons --sort=size --group-directories-first %pistol-filename%";
      "text/html" = "w3m -T text/html -dump %pistol-filename%";
      "text/plain" = "bat -p --color=always %pistol-filename%";
      "application/pdf" = "sh: pdftotext %pistol-filename% -";
      "application/* xxd" = "%pistol-filename%";
      "application/x" = "-x509-ca-cert openssl x509 -text -noout -in %pistol-filename%";
    };
  };
}
