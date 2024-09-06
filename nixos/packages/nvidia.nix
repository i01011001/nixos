{
config, lib, ...
}: {
    # Enable OpenGL
    hardware.graphics = {
        enable = true;
    };

    hardware.nvidia.prime = {
        # sync.enable = true;
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
        # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
    };

    boot.kernelParams = ["nvidia-drm.fbdev=1"];
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

        nvidiaPersistenced = true;
        # Modesetting is required.
        modesetting.enable = true;

        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        open = false;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
}
