{
    hardware.pulseaudio.enable = false;

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa = { 
        enable = true;
        support32Bit = true;
    };
    wireplumber = {
        enable = true;
    };
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
