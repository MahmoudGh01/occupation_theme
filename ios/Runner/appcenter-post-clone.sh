#!/usr/bin/env bash
# Place this script in the root of your Flutter project

# fail if any command fails
set -e
# debug log
set -x

# Ensure Flutter is in the PATH (modify this path according to your Flutter SDK location)
export PATH="$PATH:`pwd`/flutter/bin"

# Check Flutter installation and environment
flutter doctor

echo "Starting iOS build process"

# Navigate to the iOS directory
cd ios

# Install CocoaPods dependencies
pod install

# Go back to the root directory
cd ..

# Build the iOS app
# For simulator (debug mode)
# flutter build ios --simulator

# For a physical device (release mode)
flutter build ios --release --no-codesign

# The --no-codesign flag is used to skip automatic code signing, remove it if you have your code signing configured

# After building, the artifacts will be located in /build/ios/iphoneos (for physical devices)
# and /build/ios/iphonesimulator (for simulators)

# Note: To distribute the app (e.g., for testing or app store submission), you will need to use Xcode
# to archive the app and handle code signing

echo "iOS build process completed"
