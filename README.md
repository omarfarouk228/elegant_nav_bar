# Elegant Navigation Bar

A sleek, customizable bottom navigation bar for Flutter with animated selection indicators, SVG support, and distinctive dot indicators. Elevate your app's navigation with smooth transitions and visual feedback.

## Features

- Animated selection indicators (bar or dot shape)
- Customizable indicator position (top, bottom, or none)
- Floating navigation bar option
- Custom icons support (SVG or widgets)
- Customizable colors, sizes, and styles
- Responsive design
- Material design elevation

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  elegant_nav_bar: ^0.0.1
```

Or, for the latest development version:

```yaml
dependencies:
  elegant_nav_bar:
    git:
      url: https://github.com/yourusername/elegant_nav_bar.git
```

## Usage

```dart
import 'package:elegant_nav_bar/elegant_nav_bar.dart';

// In your Scaffold:
bottomNavigationBar: ElegantBottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: [
    NavigationItem(
      label: 'Home',
      iconWidget: Icon(Icons.home),
    ),
    NavigationItem(
      label: 'Search',
      iconWidget: Icon(Icons.search),
    ),
    NavigationItem(
      label: 'Profile',
      iconWidget: Icon(Icons.person),
    ),
    NavigationItem(
      label: 'Settings',
      iconWidget: Icon(Icons.settings),
    ),
  ],
  // Optional: Customize indicator
  indicatorPosition: IndicatorPosition.bottom,
  indicatorShape: IndicatorShape.dot,

  // Optional: Enable floating mode
  isFloating: true,
  floatingMargin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  floatingBorderRadius: 24.0,
),
```

## Customization

The navigation bar can be customized with various parameters:

```dart
ElegantBottomNavigationBar(
  // Required parameters
  items: items,
  onTap: onTap,
  currentIndex: currentIndex,

  // Optional parameters with default values
  backgroundColor: Colors.white,
  selectedItemColor: AppColors.primaryColor,
  unselectedItemColor: Colors.grey,

  // Indicator options
  indicatorColor: AppColors.primaryColor,
  indicatorPosition: IndicatorPosition.bottom, // top, bottom, or none
  indicatorShape: IndicatorShape.bar, // bar or dot
  indicatorHeight: 3.0, // for bar shape
  indicatorWidth: 30.0, // for bar shape
  indicatorDiameter: 6.0, // for dot shape

  // Navigation bar style
  elevation: 8.0,
  height: 60.0,
  borderRadius: 15.0, // for selected item highlighting

  // Icon and text options
  iconSize: 22.0,
  selectedLabelStyle: TextStyle(...),
  unselectedLabelStyle: TextStyle(...),

  // Floating mode options
  isFloating: false,
  floatingMargin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  floatingBorderRadius: 24.0,
)
```

## Example

Check out the example app in the `/example` folder for a complete demonstration of how to use this package.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
