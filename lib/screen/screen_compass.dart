import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homescreen_compassapp/widgets/main_compass.dart';

class CompassDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImagePath = 'assets/images/screen_dang.jpg';
  final String compassImagePath = 'assets/images/compass.png';

  const CompassDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // Khóa màn hình ở chế độ dọc
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xF6FFFFFF),
          ),
          onPressed: () {
            // Khôi phục chế độ xoay tự do trước khi thoát
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
            Navigator.pop(context); // Quay lại màn hình trước
          },
        ),
        title: const Text(
          'La Bàn Cơ Bản',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xAEBE0A0A),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Để AppBar nằm trên ảnh nền
      body: Stack(
        children: [
          // Ảnh nền
          Image.asset(
            backgroundImagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 220), // Thêm khoảng trống dưới AppBar
                  // Hình ảnh la bàn
                  Center(
                    child: CompassWidget(
                      compassImagePath: compassImagePath,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Mô tả
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
