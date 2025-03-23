[![pub](https://img.shields.io/pub/v/elegant_nav_bar?label=pub&logo=dart)](https://pub.dev/packages/elegant_nav_bar/install) [![stars](https://img.shields.io/github/stars/omarfarouk228/elegant_nav_bar?logo=github)](https://github.com/omarfarouk228/elegant_nav_bar)  [![issues](https://img.shields.io/github/issues/omarfarouk228/elegant_nav_bar?logo=github)](https://github.com/omarfarouk228/elegant_nav_bar/issues) [![commit](https://img.shields.io/github/last-commit/omarfarouk228/elegant_nav_bar?logo=github)](https://github.com/omarfarouk228/elegant_nav_bar/commits)

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
      url: https://github.com/omarfarouk228/elegant_nav_bar.git
```

## Demo

https://github.com/user-attachments/assets/b2149fe9-bb29-4009-8117-236720c32d1c

## Examples style:

- `Simple`
<img width="351" alt="image" src="https://github.com/user-attachments/assets/62d6c14e-e16b-4d7a-9d62-f7bc397c454c" />


- `Floating`
<img width="350" alt="image" src="https://github.com/user-attachments/assets/38515ad2-499e-4f86-b17e-19b68e77ed7f" />


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

## Advanced Usage

### SVG Icons

```dart
NavigationItem(
  label: 'Analytics',
  iconWidget: SvgPicture.asset(
    'assets/icons/analytics.svg',
    width: 24,
    height: 24,
    color: Colors.grey, // Will be overridden by the selected/unselected colors
  ),
)
```

### Custom Animations

```dart
ElegantBottomNavigationBar(
  // Other parameters...
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeInOut,
)
```

### Handling System Navigation Bar

```dart
// In your main.dart
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white, // Set to match your nav bar
  systemNavigationBarIconBrightness: Brightness.dark, // For dark icons
));
```

## Example

Check out the example app in the `/example` folder for a complete demonstration of how to use this package. The example includes:

- Basic implementation
- Different indicator styles
- Floating navigation bar
- SVG icon integration
- Responsive layouts

To run the example:

```
cd example
flutter pub get
flutter run
```


## Troubleshooting

### Common Issues

- **Indicator not visible**: Check if the indicator color contrasts with the background color
- **Animation lag**: Reduce the animation duration or simplify your screen widgets
- **Overflow errors**: Ensure your navigation bar has enough height for your content

### Solutions

```dart
// Fix for overflow issues
ElegantBottomNavigationBar(
  // Other parameters...
  height: 70.0, // Increase height
  iconSize: 20.0, // Decrease icon size
  selectedLabelStyle: TextStyle(fontSize: 12), // Smaller text
)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.


## About the Author

Created by [Omar Farouk](https://github.com/omarfarouk228)
