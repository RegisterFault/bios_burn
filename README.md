# Note
I never actually finished this project, all I have committed is a test program that prints hello world to bios. I still needed to look up the bios interrupts needed to access the primary drive and send zeros to it. However, this project may serve as an interesting and useful framework for doing a quick-turn project for testing bootloader assembly code.

# bios_burn
A simple 8086 bios bootloader program intended to very quickly and non-interactively wipe a partition table on a hard drive. Mostly intended to speed things up on an IT job where a non-secure "wipe" of a hard drive that takes seconds is desired, such as with the  manual imaging of large batches of computers.

This project uses the gnu assembler in intel x86 syntax and qemu as a quick-turn testing platform. 

To build a flat binary:  
```
    make
```
To run:
```
    make run  
```
To build a disk image:  
```
    make image  
```

This disk image can be written raw to any boot medium and will need to be booted in legacy mode. This does not function with UEFI. Win32DiskImager will suffice in windows, and simply running DD of the image to a boot medium will work in *nix/Mac.
