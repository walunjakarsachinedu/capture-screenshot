# take_screenshot

A simple Dart package for capturing screenshots of single widgets or specific descendant widgets all at once.

## Features

**Widgets**

- `ScreenShotWidget`: Wraps a list of `Widget`s for which we want to take a screenshot.
- `TakeScreenShot`: Wraps all descendant `ScreenShotWidget`s and provides a way to capture screenshots for all of them.

**Controllers**

- `ScreenShotController`: Used to take a screenshot for children of `ScreenShotWidget`.
- `TakeScreenShotController`: Used to get screenshots from all descendant `ScreenShotWidget` widgets. It provides a list of images, one for each descendant `ScreenShotWidget`, in the same order as they occur.

## Getting Started

**Using `ScreenShotWidget` widget**

```dart
// Define a controller for `ScreenShotWidget` which will be used to take screenshots
ScreenShotController screenShotController = ScreenShotController();

// Other code...

// Wrap the widget list 
const ScreenShotWidget( 
  children: [ 
    Text("Widget to be captured as an image"),
  ]
);

// Other code...

// Use the controller's `captureScreenShot` method to get a screenshot of the widget
Uint8List capturedImage = await screenShotController.captureScreenShot();

```

**Using `TakeScreenShot` widget**

```dart
// Define a controller for `TakeScreenShot` which will be used to take screenshots of all descendant `ScreenShotWidget`s all at once
TakeScreenShotController takeScreenShotController = TakeScreenShotController();

// Other code...

// Wrap all descendant `ScreenShotWidget` widgets 
TakeScreenShot(
  controller: takeScreenShotController, 
  // Take a screenshot of the entire column widget
  child: ScreenShotWidget(
    children: [
      Column(
        children: [
          // Only captured by wrapping `ScreenShotWidget` widget
          const Text("Another Widget"),
          // Capturing specific sub-part
          const ScreenShotWidget( 
            children: [
              Text("Hello World")
            ],
          ),
          // Capturing specific sub-part
          ScreenShotWidget(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    ],
  ),
);
