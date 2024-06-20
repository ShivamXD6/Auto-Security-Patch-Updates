#!/system/bin/sh
MODPATH=${0%/*}

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

# Update Security Patch to Latest
sed -i "/ro.build.version.security_patch/s/.*/ro.build.version.security_patch=$SP/" /$MODPATH/system.prop
sed -i "/ro.vendor.build.security_patch/s/.*/ro.vendor.build.security_patch=$SP/" /$MODPATH/system.prop
sed -i "/ro.build.version.real_security_patch/s/.*/ro.build.version.real_security_patch=$SP/" /$MODPATH/system.prop