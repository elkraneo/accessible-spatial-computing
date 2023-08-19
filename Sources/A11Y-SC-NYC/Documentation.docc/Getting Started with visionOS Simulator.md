# Getting Started with visionOS simulator

## Overview

### [WIP] Shortcuts

Shit-command-H -> go home

Shit-command-K -> capture keyboard

### Basic gestures 

| **Gesture**                      | **To simulate**                    |
| -------------------------------- | ---------------------------------- |
| Tap                              | Click.                             |
| Double-tap                       | Double-click.                      |
| Touch and hold                   | Click and hold.                    |
| Drag (left, right, up, and down) | Drag left, right, up, and down.    |
| Drag (forward and back)          | Shift-drag up and down.            |
| Two-handed gestures              | Press and hold the Option key to display touch points. Move the pointer while pressing the Option key to change the distance between the touch points. Move the pointer and hold the Shift and Option keys to reposition the touch points.           |

### Accessibility

> [Xcode 15 beta 6 Release Notes](https://developer.apple.com/documentation/Xcode-Release-Notes/xcode-15-release-notes#visionOS-Simulator) mentions a workaround for emulating the Digital Crown that utilizes the XCTest's `XCUIDevice.rotateDigitalCrown(delta:)` method, but since XCTest can't be imported on non-test targets and [UI testing is not available to visionOS](https://developer.apple.com/documentation/xctest/user_interface_tests), it appears that there is no convenient way to trigger Accessibility Shortcut on the simulator at this time.

@Links(visualStyle: detailedGrid) {
    - <doc:VoiceOver-on-visionOS>
}


### References
- [Interacting with your app in the visionOS simulator](https://developer.apple.com/documentation/visionos/interacting-with-your-app-in-the-visionos-simulator)
