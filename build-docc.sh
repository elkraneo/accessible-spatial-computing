##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme AccessibleSpatialComputing \
    -destination 'generic/platform=macOS' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug/A11Y-SC-NYC.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "accessible-spatial-computing"