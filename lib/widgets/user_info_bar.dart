import 'package:flutter/material.dart';

class UserInfoBar extends StatefulWidget {
  const UserInfoBar({super.key});

  @override
  State<UserInfoBar> createState() => _UserInfoBarState();
}

class _UserInfoBarState extends State<UserInfoBar> {
  String _gender = 'Nam'; // Giá trị mặc định
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(222, 190, 10, 10), // Màu nền của status bar
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 56, // Chiều cao của container chứa ảnh
            width: 56, // Chiều rộng của container chứa ảnh
            child: Image.asset(
              'assets/images/logo2-01.png',
              fit: BoxFit.contain, // Đảm bảo ảnh không bị méo
            ),
          ),

          const SizedBox(width: 8), // Khoảng cách giữa logo và radio
          Expanded(
            child: _buildGenderSelection(), // Phân bổ không gian linh hoạt
          ),
          const SizedBox(width: 8), // Khoảng cách giữa radio và ô nhập năm
          SizedBox(
            width: 120, // Đặt chiều rộng cố định cho TextField
            child: _buildYearOfBirthField(),
          ),
        ],
      ),
    );
  }

  // Widget chọn giới tính
  Widget _buildGenderSelection() {
    return Row(
      children: [
        _genderRadio('Nam'),
        const SizedBox(width: 8), // Khoảng cách giữa các radio
        _genderRadio('Nữ'),
      ],
    );
  }

  // Radio button cho giới tính
  Widget _genderRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _gender,
          onChanged: (newValue) {
            setState(() {
              _gender = newValue!;
            });
          },
          activeColor: const Color(0xFFC7C400),
        ),
        Text(value, style: const TextStyle(color: Color(0xFFFDFC99))),
      ],
    );
  }

  // Widget nhập năm sinh
  Widget _buildYearOfBirthField() {
    return SizedBox(
      width: 120,
      child: TextField(
        textAlign: TextAlign.center,
        controller: _yearController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Năm sinh',
          hintStyle: const TextStyle(
            color: Colors.white70,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Bo tròn các góc của ô
            borderSide: const BorderSide(
              color: Color(0xFFFDFC99), // Màu viền
              width: 2, // Độ dày viền
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // Viền khi ô không được nhấn
            borderRadius:
                BorderRadius.circular(8.0), // Bo tròn khi không nhấn vào
            borderSide: const BorderSide(
              color: Color(0xFFFDFC99), // Màu viền khi không nhấn vào
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // Viền khi ô được nhấn vào
            borderRadius: BorderRadius.circular(8.0), // Bo tròn khi nhấn vào
            borderSide: const BorderSide(
              color: Color(0xFFC7C400),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        ),
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          // print('Năm sinh: $value'); // Xử lý năm sinh
        },
      ),
    );
  }

  @override
  void dispose() {
    _yearController.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }
}
