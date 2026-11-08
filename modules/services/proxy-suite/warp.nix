{
  zen,
  ...
}:

{
  zen.services.proxy-suite.warp = {
    includes = [
      zen.services.proxy-suite
    ];

    wiki = {
      "AmneziaWG" = {
        links = [
          {
            name = "warp-generator";
            link = "https://warp_generator_bot.t.me";
            logo = "https://cdn4.telesco.pe/file/Ipobmmlb3skF6PriGAZMIZBEPuYuBgEmsd6a9bHPd_mITBnViXtnk8_QG11dMzZl1BAFbQzDM1MdrEF3HLd-hWRbznzwE3Y3ZGdtpwdPI_xz8WEfomcOiWMtohd7R671iMJ8RaKI0U1Lg5NjVPE3QH1LcEU5cS18km9cFQ0HX8NJzrJ8eUfa7qcnXqaBMJWCSFFSSEzpou8Vg-T3RLulhYBV-va1EvjQSCw44bMtaE5jpDgvU-aYsDZkNm8qeo8GmkX5SRhdy5Yc-qUxJBvlGr2vesUBVyUcWmmU7PCW91wmaUqg1V1C5HKevZQLTab9b6T2i7CZ7T_JfSoTYqG2Dw.jpg";
          }
          {
            name = "warp-status";
            link = "https://cfwarpstatus.t.me";
            logo = "https://cdn4.telesco.pe/file/O4ev9Y3fy3XEU8CI5mBVd31esISWdfSed2BRq7UYFB_ZDI81EaYp8Xn_BaDJhLiEp6OG7jKl7qtrSnUVq0xfBhJ3JFmJ0yk-6PQueucQtUYdm4FXnH7wucu-O_IznKlopdfId4KjDj-NKRHOYfhlpXBXiqJ1avqCns2eEhj_2ZasFdwPi2KkTT2MJW72z8YlzsL76skYGv96bCrFQvylYkZC-MqLcJrO9tYsiifGiIQY_pTvdmtQngEZkK0pTWt5fBi8CqutE-LW9O3kdKTIWDQJN7TH7QrDsMk7O9rd7AEVWztlKsaMez-jp3KH-YEN-ecaW2c0GzYwK2sMaxERFg.jpg";
          }
        ];
      };
    };

    nixos =
      {
        self,
        lib,
        config,
        host,
        ...
      }:
      {
        services.proxy-suite = {
          amneziaWg = {
            enable = true;

            profiles = {
              llimonix.configFile = config.sops.secrets."llimonix".path;
            };
          };
        };

        sops.secrets =
          [
            "llimonix"
          ]
          |> (
            list:
            lib.genAttrs list (name: {
              sopsFile = "${self}/secrets/${host.hostName}/${name}.conf";
              format = "binary";
            })
          );
      };
  };
}
