##!/bin/sh

xcrun xcodebuild docbuild \
	-sdk macosx14.0\
    -scheme AccessibleSpatialComputing \
    -destination 'generic/platform=macOS' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive \
    transform-for-static-hosting "$PWD/.derivedData/Build/Products/Debug/A11Y-SC-NYC.doccarchive" \
    --hosting-base-path "accessible-spatial-computing" \
    --output-path ".docs"
