import 'package:elegant_nav_bar/src/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A model class representing an item in the navigation bar
class NavigationItem {
  /// The SVG asset path for the icon
  final String? icon;

  /// The label text to be displayed
  final String label;

  /// Optional widget to use instead of an SVG icon
  final Widget? iconWidget;

  /// Creates a navigation item
  NavigationItem({this.icon, required this.label, this.iconWidget});
}

/// Defines the position of the indicator
enum IndicatorPosition {
  /// Position the indicator at the top of the navigation bar
  top,

  /// Position the indicator at the bottom of the navigation bar
  bottom,

  /// Don't show any indicator
  none,
}

/// Defines the shape of the indicator
enum IndicatorShape {
  /// A rectangular bar indicator
  bar,

  /// A circular dot indicator
  dot,
}

/// A customizable bottom navigation bar with animation effects
class ElegantBottomNavigationBar extends StatefulWidget {
  /// List of items to be displayed in the navigation bar
  final List<NavigationItem> items;

  /// Callback for when an item is tapped
  final ValueChanged<int> onTap;

  /// Currently selected index
  final int currentIndex;

  /// Background color of the navigation bar
  final Color backgroundColor;

  /// Color of the selected item
  final Color selectedItemColor;

  /// Color of unselected items
  final Color unselectedItemColor;

  /// Color of the indicator
  final Color indicatorColor;

  /// Position of the indicator (top, bottom, or none)
  final IndicatorPosition indicatorPosition;

  /// Shape of the indicator (bar or dot)
  final IndicatorShape indicatorShape;

  /// Height of the indicator
  final double indicatorHeight;

  /// Width of the indicator (applies to bar shape)
  final double indicatorWidth;

  /// Diameter of the indicator (applies to dot shape)
  final double indicatorDiameter;

  /// Elevation of the navigation bar
  final double elevation;

  /// Height of the navigation bar
  final double height;

  /// Size of the icons
  final double iconSize;

  /// Text style for selected items
  final TextStyle selectedLabelStyle;

  /// Text style for unselected items
  final TextStyle unselectedLabelStyle;

  /// Border radius of selected item
  final double borderRadius;

  /// Whether the navigation bar should float
  final bool isFloating;

  /// Margin around the floating navigation bar
  final EdgeInsets floatingMargin;

  /// Border radius of the floating navigation bar
  final double floatingBorderRadius;

  /// Duration of the animation
  final Duration animationDuration;

  /// Curve of the animation
  final Curve animationCurve;

  /// Creates a ElegantBottomNavigationBar widget
  const ElegantBottomNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
    this.backgroundColor = Colors.white,
    this.selectedItemColor = AppColors.primaryColor,
    this.unselectedItemColor = Colors.grey,
    this.indicatorColor = AppColors.primaryColor,
    this.indicatorPosition = IndicatorPosition.bottom,
    this.indicatorShape = IndicatorShape.bar,
    this.indicatorHeight = 3.0,
    this.indicatorWidth = 30.0,
    this.indicatorDiameter = 6.0,
    this.elevation = 8.0,
    this.height = 60.0,
    this.iconSize = 22.0,
    this.selectedLabelStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),
    this.unselectedLabelStyle = const TextStyle(fontSize: 12.0),
    this.borderRadius = 15.0,
    this.isFloating = false,
    this.floatingMargin = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
    this.floatingBorderRadius = 20.0,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.linear,
  });

  @override
  ElegantBottomNavigationBarState createState() =>
      ElegantBottomNavigationBarState();
}

class ElegantBottomNavigationBarState extends State<ElegantBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationBar = Material(
      elevation: widget.elevation,
      color: widget.backgroundColor,
      borderRadius:
          widget.isFloating
              ? BorderRadius.circular(widget.floatingBorderRadius)
              : null,
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (index) {
            final bool isSelected = widget.currentIndex == index;
            return InkWell(
              onTap: () => widget.onTap(index),
              child: _buildNavItem(
                item: widget.items[index],
                isSelected: isSelected,
                index: index,
              ),
            );
          }),
        ),
      ),
    );

    // Apply floating style if enabled
    if (widget.isFloating) {
      return Padding(padding: widget.floatingMargin, child: navigationBar);
    } else {
      return navigationBar;
    }
  }

  Widget _buildNavItem({
    required NavigationItem item,
    required bool isSelected,
    required int index,
  }) {
    // Build the indicator based on position and shape
    Widget buildIndicator() {
      // Don't build indicator if it's set to none
      if (widget.indicatorPosition == IndicatorPosition.none) {
        return const SizedBox.shrink();
      }

      // Build dot indicator
      if (widget.indicatorShape == IndicatorShape.dot) {
        return AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          height: isSelected ? widget.indicatorDiameter : 0,
          width: isSelected ? widget.indicatorDiameter : 0,
          decoration: BoxDecoration(
            color: widget.indicatorColor,
            shape: BoxShape.circle,
          ),
        );
      }
      // Build bar indicator
      else {
        return AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          height: widget.indicatorHeight,
          width: isSelected ? widget.indicatorWidth : 0,
          decoration: BoxDecoration(
            color: widget.indicatorColor,
            borderRadius: BorderRadius.circular(widget.indicatorHeight / 2),
          ),
        );
      }
    }

    return AnimatedContainer(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top indicator if selected
          if (widget.indicatorPosition == IndicatorPosition.top)
            buildIndicator(),

          const SizedBox(height: 5.0),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 10 : 0,
                vertical: 5,
              ),
              alignment: Alignment.center,
              decoration:
                  isSelected
                      ? BoxDecoration(
                        color: AppColors.primaryColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius,
                        ),
                      )
                      : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.icon != null
                      ? SvgPicture.asset(
                        item.icon!,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? widget.selectedItemColor
                              : widget.unselectedItemColor,
                          BlendMode.srcIn,
                        ),
                        width: widget.iconSize,
                        height: widget.iconSize,
                      )
                      : SizedBox(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        child: item.iconWidget ?? const Center(),
                      ),
                  const SizedBox(width: 4.0),
                  isSelected
                      ? Text(
                        item.label,
                        style:
                            isSelected
                                ? widget.selectedLabelStyle
                                : widget.unselectedLabelStyle,
                      )
                      : const Center(),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5.0),

          // Bottom indicator if selected
          if (widget.indicatorPosition == IndicatorPosition.bottom)
            buildIndicator(),
        ],
      ),
    );
  }
}
