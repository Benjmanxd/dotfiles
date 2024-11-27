{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  # spicePkgs = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
      enable = true;
      spicetifyPackage = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".spicetify-cli;

      theme = {
        name = "dribbblish";
        src = ../../assets/theme/spotify/dribbblish;
        injectCss = true;
        injectThemeJs = true;
        replaceColors = true;
        homeConfig = true;
        overwriteAssets = true;
        appendName = false;
        sidebarConfig = true;
        additonalCss = "";
      };
      colorScheme = "nord-light";

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];

      enabledExtensions = with spicePkgs.extensions; [
        lastfm
        history
        fullAppDisplay
        shuffle
        featureShuffle
        copyToClipboard
        wikify
        phraseToPlaylist
        groupSession
        trashbin
        fullAlbumDate
        popupLyrics
      ];
    };
}
