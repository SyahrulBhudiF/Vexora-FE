import 'package:flutter/material.dart';

// Design dimensions (consider moving these to a separate class)
const double FIGMA_DESIGN_WIDTH = 414;
const double FIGMA_DESIGN_HEIGHT = 896;
const double FIGMA_DESIGN_STATUS_BAR = 0;

// Responsive extensions
extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get h => (this * _width) / FIGMA_DESIGN_WIDTH;
  double get fSize => (this * _width) / FIGMA_DESIGN_WIDTH;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) =>
      double.parse(toStringAsFixed(fractionDigits));
}

// Utility function
double isNonZero({num defaultValue = 0.0}) => this > 0 ? this : defaultValue.toDouble();

// Device type enum
enum DeviceType { mobile, tablet, desktop }

// Responsive widget builder type
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

// Sizer widget for responsive builds
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeUtils.setScreenSize(constraints, orientation);
          return builder(context, orientation, SizeUtils.deviceType);
        },
      ),
    );
  }
}

// Class for managing device size information
class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double width;
  static late double height;

  static void setScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    width = orientation == Orientation.portrait
        ? constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH)
        : constraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
    height = orientation == Orientation.portrait
        ? constraints.maxHeight.isNonZero()
        : constraints.maxWidth.isNonZero();

    deviceType = DeviceType.mobile; // Update logic for device type if needed
  }
}