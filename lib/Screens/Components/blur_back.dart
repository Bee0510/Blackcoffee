import 'dart:ui';

import 'package:flutter/material.dart';

class blur_back extends StatelessWidget {
  const blur_back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
