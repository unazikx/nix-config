{
  ...
}:

{
  zen.programs.gui.qutebrowser.rules = {
    homeManager =
      {
        lib,
        ...
      }:
      {
        programs.qutebrowser.perDomainSettings = lib.mkMerge [
          { }
          # darkmode disable
          (lib.genAttrs
            [
              "file://*"
              "http://192.168.1.1"
              "http://192.168.1.1/*"
              "http://localhost:*"
              "http://localhost:*/*"
              "https://account.proton.me/*"
              "https://archlinux.org/*"
              "https://github.com/*"
              "https://git.sr.ht/*"
              "https://*.google.com/*"
              "https://mail.google.com/*"
              "https://mail.proton.me/*"
              "https://mastodon.ml/*"
              "https://*.nadeko.net/*"
              "https://nadeko.net/*"
              "https://*.nixos.org/*"
              "https://priv.au/*"
              "https://*.proton.me/*"
              "https://rutracker.org/*"
              "https://*.sr.ht/*"
              "https://vk.mail.ru/*"
              "https://wiki.nixos.org/*"
              "https://www.reddit.com/*"
              "https://*.youtube.com/*"
              "qute://start/*"
            ]
            (_: {
              colors.webpage.darkmode.enabled = false;
            })
          )
        ];
      };
  };
}
