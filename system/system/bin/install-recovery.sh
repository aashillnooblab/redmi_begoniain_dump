#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:75bf8dc01395c8cc0978db3422fe43dc3eb41d22; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:959a4061b914c38bb0195ef08e1f3064259d3768 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:75bf8dc01395c8cc0978db3422fe43dc3eb41d22 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
