{pkgs, ...}: {
  users.users."alastai.flynn" = {
    name = "alastai.flynn";
    home = "/Users/alastai.flynn";
    shell = pkgs.fish;
  };

  home-manager.users."alastai.flynn" = {
    # This will append onto the fish config created in the common home manager nix files.
    programs.fish.interactiveShellInit = ''
      if status is-interactive
          # Commands to run in interactive sessions can go here
          set -Ux AWS_PROFILE "AdministratorAccessV2-927675079783"
      end
    '';
  };
}
