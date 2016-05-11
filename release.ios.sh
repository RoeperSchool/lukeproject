npm run increaseVersion -- -s "major"
npm run dumpprod
npm run buildProdIOS
rm -rf ./build/ios.app
mv ./platforms/ios/build/device/*.app ./build/ios.app
xcrun -sdk iphoneos PackageApplication -v $PWD/build/ios.app
sigh resign ./build/ios.ipa