##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme AccessibleSpatialComputing \
    -destination 'generic/platform=macOS' \
    -derivedDataPath "~/Desktop/Docs"

xcrun docc process-archive transform-for-static-hosting \
    "~/Desktop/Docs/Build/Products/Debug/A11Y-SC-NYC.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "accessible-spatial-computing"