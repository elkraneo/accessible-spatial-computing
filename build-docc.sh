##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme AccessibleSpatialComputing \
    -destination 'generic/platform=iOS' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive \
    transform-for-static-hosting "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/A11Y-SC-NYC.doccarchive" \
    --hosting-base-path "accessible-spatial-computing" \
    --output-path ".docs"