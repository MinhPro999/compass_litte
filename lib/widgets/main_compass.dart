import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassWidget extends StatelessWidget {
  final String compassImagePath;

  const CompassWidget({
    super.key,
    required this.compassImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Lỗi khi đọc dữ liệu cảm biến'),
          );
        }

        // Lấy góc xoay từ dữ liệu CompassEvent
        final CompassEvent? event = snapshot.data;
        final double? direction = event?.heading;

        if (direction == null) {
          return const Center(
            child: Text('Không có dữ liệu cảm biến'),
          );
        }

        return Transform.rotate(
          angle: (direction *
              (math.pi / 180) *
              -1), // Chuyển góc sang radian và xoay
          child: Image.asset(
            compassImagePath,
            height: 400, // Đặt kích thước phù hợp
            width: 400,
          ),
        );
      },
    );
  }
}
