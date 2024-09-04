
{
  pkgs, ...
}: {

  # Ensure the Nouveau module is loaded
  boot.kernelModules = [ "nouveau" ];

  # Blacklist the proprietary NVIDIA driver, if needed
  boot.blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];

# Enable OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Add packages needed for Nouveau acceleration here
      # For example, Mesa for OpenGL:
      mesa
      mesa.drivers
    ];
  };

}
