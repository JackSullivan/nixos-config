# Local configuration for 'stallo' (Home desktop PC)
{ config, ...}:

{
  boot.initrd.luks.devices.stallo-luks.device = "/dev/disk/by-uuid/b484cf1e-a27b-4785-8bd6-fa85a004b073";

  # Use proprietary nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable 32-bit compatibility for Steam:
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  networking = {
    hostName = "stallo";
    wireless.enable = true;
    wireless.networks = {
      "How do I computer fast?" = {
        # Welcome to roast club!
        psk = "washyourface";
      };
    };
    # IPv6 at home, of course:
    nameservers = [
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };
}
