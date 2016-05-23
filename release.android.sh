#!/bin/sh
set -e
ANDROID_ZIPALIGN="/usr/bin/zipalign"
ANDROID_KEY_PATH="/home/nicholas/.android/main.keystore"
ANDROID_KEY_ALIAS="alias_name"
npm run increaseVersion -- -s "major"
# npm run dumpprod
cordova build android --device --release
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ${ANDROID_KEY_PATH} platforms/android/build/outputs/apk/android-x86-release-unsigned.apk ${ANDROID_KEY_ALIAS}
jarsigner -verify -certs platforms/android/build/outputs/apk/android-x86-release-unsigned.apk
${ANDROID_ZIPALIGN} -vf 4 platforms/android/build/outputs/apk/android-x86-release-unsigned.apk ./build/wphc-android-x86.apk
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ${ANDROID_KEY_PATH} platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk ${ANDROID_KEY_ALIAS}
jarsigner -verify -certs platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk
${ANDROID_ZIPALIGN} -vf 4 platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk ./build/wphc-android-armv7.apk
