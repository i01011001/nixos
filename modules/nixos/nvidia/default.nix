{
config, lib, ...
}: {
    # Enable OpenGL
    hardware.graphics = {
        enable = true;
    };


    hardware.nvidia.prime = {
        sync.enable = true;
        # offload = { 
        #   enable = true;
        #   enableOffloadCmd = true;
        # };
        # Make sure to use the correct Bus ID values for your system!
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
    };

    boot.kernelParams = [
        "nvidia-drm.fbdev=1"
        # "module_blacklist=i915" 
    ];
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

        nvidiaPersistenced = true;
        # Modesetting is required.
        modesetting.enable = true;
        # forceFullCompositionPipeline = true;
        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = false;

        open = false;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    environment = {
        sessionVariables = {
            GBM_BACKEND="nvidia-drm";
            __GL_GSYNC_ALLOWED=0;
            __GL_VRR_ALLOWED=0;
            __GLX_VENDOR_LIBRARY_NAME="nvidia";
            # Xwayland compatibility
            XWAYLAND_NO_GLAMOR=1;
            WLR_DRM_DEVICES="/dev/dri/card1";
            WLR_RENDERER="vulkan";
        };

    };

}
