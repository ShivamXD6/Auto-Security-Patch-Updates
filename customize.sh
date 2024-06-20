#!/system/bin/sh

# Abort in Recovery 
if ! $BOOTMODE; then
  ui_print " ! Only uninstall is supported in recovery"
  ui_print " - Uninstalling Auto Security Patch Updates"
  touch $MODPATH/remove
  sh $MODPATH/uninstall.sh
  recovery_cleanup
  rm -rf $NVBASE/modules_update/$MODID $TMPDIR 2>/dev/null
  exit 0
fi

# Installation Begins
ui_print ""
ui_print " 🔐 Auto Security Patch Updates"
ui_print ""
ui_print " 🆔 By @ShastikXD"
ui_print ""

# Get Security Patch Variables
YEAR=$(date +%Y)
MONTH=$(date +%m)
MONTH=$((10#$MONTH))
NEXT_MONTH=$((MONTH))
if [ $NEXT_MONTH -gt 12 ]; then
    NEXT_MONTH=1
    YEAR=$((YEAR + 1))
fi
MONTH=$(printf "%02d" $NEXT_MONTH)
YEAR=$(printf "%04d" $YEAR)
SP="${YEAR}-${MONTH}-05"

ui_print " 🔐 Updating your Security Patch Level to $SP"
ui_print ""

# Update Security Patch
sed -i "/ro.build.version.security_patch/s/.*/ro.build.version.security_patch=$SP/" /$MODPATH/system.prop
sed -i "/ro.vendor.build.security_patch/s/.*/ro.vendor.build.security_patch=$SP/" /$MODPATH/system.prop
sed -i "/ro.build.version.real_security_patch/s/.*/ro.build.version.real_security_patch=$SP/" /$MODPATH/system.prop
ui_print " ⭐ Installation Done ✅"
ui_print ""