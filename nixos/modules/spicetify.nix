{ pkgs, pkgs-unstable, spicetify-nix, ... }:
{
  imports = [ spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
  let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    # spotifyPackage = pkgs-unstable.spotify;
    # spicetifyPackage = pkgs-unstable.spicetify-cli;

    # theme = {
    #   name = "dribbblish";
    #   src = ../../assets/theme/spotify/dribbblish;
    #   injectCss = true;
    #   injectThemeJs = true;
    #   replaceColors = true;
    #   homeConfig = true;
    #   overwriteAssets = true;
    #   appendName = false;
    #   sidebarConfig = true;
    #   additonalCss = "";
    # };
    # colorScheme = "nord-light";

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

  # services.spotifyd = {
  #   enable = true;
  #   settings = {
  #     global = {
  #       username = "12156574856";
  #       password = "AA%NR%pDVpUO0<m";
  #     };
  #   };
  # };
}
