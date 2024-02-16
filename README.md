# Flutter Adaptive App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Best Practices

- The `Platform` object imported from dart:io is meant to be used for making decisions that are independent of rendering choices

- Extracting the Theme from the `BuildContext` is intended for implementation decisions that are Theme centric

### Build a mobile app

Add the following packages to gain access to the `Youtube Data Api`

- `googleapis`: A generated Dart library that provides access to Google APIs
- `http`: A library for creating HTTP requests that hides the differences between native and web browsers
- `provider`: Provides state management
- `url_launcher`: Provides the means to jump into a video from a playlist. As shown from the resolved dependencies, url_launcher has implementations for Windows, macOS, Linux, and the web, in addition to the default Android and iOS. Using this package means you won't need to create platform specific for this functionality
- `flex_color_scheme`: Gives the app a nice default color scheme. To learn more, check out the [flex_color_scheme API documentation](https://pub.dev/documentation/flex_color_scheme/latest/ 'read docs')
- `go_router`: Implements navigation between the different screens. This package provides a convenient, url-based API for navigating using Flutter's Router
