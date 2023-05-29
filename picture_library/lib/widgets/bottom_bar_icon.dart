// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:picture_library/utils/color_utilities.dart';
import 'package:picture_library/utils/font_style_utilities.dart';

class BottomBarIconWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final String? label;
  final double? height;
  final double? width;
  const BottomBarIconWidget(
      {Key? key,
      this.onTap,
      this.color,
      this.icon,
      this.height,
      this.width,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return BounceClickWidget(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: ColorUtilities.transparentColor,
        child: Column(
          children: [
            Icon(
              icon!,
              color: color,
              size: 33,
            ),
            Text(
              label ?? "",
              style: FontStyleUtilities.h14(fontColor: color),
            )
          ],
        ),
      
      ),
    );
  }
}

class BounceClickWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Duration? duration;

  const BounceClickWidget({
    Key? key,
    this.child,
    this.duration,
    required this.onTap,
  }) : super(key: key);

  @override
  BounceClickWidgetState createState() => BounceClickWidgetState();
}

class BounceClickWidgetState extends State<BounceClickWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;

  late AnimationController _animate;

  VoidCallback get onTap => widget.onTap!;

  Duration get userDuration =>
      widget.duration ?? const Duration(milliseconds: 100);

  @override
  void initState() {
    _animate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return GestureDetector(
        onTap: _onTap,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }

  void _onTap() {
    _animate.forward();

    Future.delayed(userDuration, () async {
      await _animate.reverse();

      onTap();
    });
  }
}
