import 'package:elegant_nav_bar/elegant_nav_bar.dart';
import 'package:example/app_assets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool _isFloating = true;
  IndicatorPosition _indicatorPosition = IndicatorPosition.bottom;
  IndicatorShape _indicatorShape = IndicatorShape.dot;
  int animationDuration = 200;

  // Define pages to display
  final List<Widget> _pages = [
    const Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegant Nav Bar Example'),
        actions: [
          // Settings button to show customization options
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showCustomizationOptions,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ElegantBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        isFloating: _isFloating,
        indicatorPosition: _indicatorPosition,
        indicatorShape: _indicatorShape,
        items: [
          NavigationItem(label: 'Home', icon: AppAssets.homeIcon),
          NavigationItem(label: 'Search', iconWidget: const Icon(Icons.search)),
          NavigationItem(
            label: 'Profile',
            iconWidget: Image.asset(AppAssets.circleAvatar),
          ),
          NavigationItem(label: 'Settings', icon: AppAssets.settingsIcon),
        ],
        animationDuration: Duration(milliseconds: animationDuration),
        animationCurve: Curves.easeInOutCubic,
      ),
    );
  }

  void _showCustomizationOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Customize Navigation Bar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Floating toggle
                    SwitchListTile(
                      title: const Text('Floating Navigation Bar'),
                      value: _isFloating,
                      onChanged: (value) {
                        setModalState(() {
                          _isFloating = value;
                        });
                        setState(() {
                          _isFloating = value;
                        });
                      },
                    ),

                    // Indicator position options
                    const Text(
                      'Indicator Position:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RadioListTile<IndicatorPosition>(
                      title: const Text('Top'),
                      value: IndicatorPosition.top,
                      groupValue: _indicatorPosition,
                      onChanged: (value) {
                        setModalState(() {
                          _indicatorPosition = value!;
                        });
                        setState(() {
                          _indicatorPosition = value!;
                        });
                      },
                    ),
                    RadioListTile<IndicatorPosition>(
                      title: const Text('Bottom'),
                      value: IndicatorPosition.bottom,
                      groupValue: _indicatorPosition,
                      onChanged: (value) {
                        setModalState(() {
                          _indicatorPosition = value!;
                        });
                        setState(() {
                          _indicatorPosition = value!;
                        });
                      },
                    ),
                    RadioListTile<IndicatorPosition>(
                      title: const Text('None'),
                      value: IndicatorPosition.none,
                      groupValue: _indicatorPosition,
                      onChanged: (value) {
                        setModalState(() {
                          _indicatorPosition = value!;
                        });
                        setState(() {
                          _indicatorPosition = value!;
                        });
                      },
                    ),

                    // Indicator shape options
                    const Text(
                      'Indicator Shape:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RadioListTile<IndicatorShape>(
                      title: const Text('Bar'),
                      value: IndicatorShape.bar,
                      groupValue: _indicatorShape,
                      onChanged: (value) {
                        setModalState(() {
                          _indicatorShape = value!;
                        });
                        setState(() {
                          _indicatorShape = value!;
                        });
                      },
                    ),
                    RadioListTile<IndicatorShape>(
                      title: const Text('Dot'),
                      value: IndicatorShape.dot,
                      groupValue: _indicatorShape,
                      onChanged: (value) {
                        setModalState(() {
                          _indicatorShape = value!;
                        });
                        setState(() {
                          _indicatorShape = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
