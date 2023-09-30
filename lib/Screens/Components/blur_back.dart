import 'dart:ui';

import 'package:flutter/material.dart';

class blur_back extends StatelessWidget {
  const blur_back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        color: Colors.white.withOpacity(0),
      ),
    );
  }
}
