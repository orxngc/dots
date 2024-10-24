{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    modules.styles.fonts.enable =
      lib.mkEnableOption "enables fonts";
  };
  config = lib.mkIf config.modules.styles.fonts.enable {
    fonts = {
      packages = with pkgs; [
        noto-fonts-emoji
        noto-fonts-cjk-sans
        font-awesome
        ubuntu-sans
        merriweather-sans
        merriweather
        lexend
        material-icons
        (nerdfonts.override {fonts = ["JetBrainsMono"];})
      ];
    };
  };
}
