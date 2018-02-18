# Local configuration for 'stallo' (Home desktop PC)
{ config, ...}:

{
  boot.initrd.luks.devices.stallo-luks.device = "/dev/disk/by-uuid/b484cf1e-a27b-4785-8bd6-fa85a004b073";

  # Use proprietary nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  networking = {
    hostName = "stallo";
    wireless.enable = true;
    wireless.networks = {
      "How do I computer fast?" = {
        # Welcome to roast club!
        psk = "washyourface";
      };
    };
  };
}
