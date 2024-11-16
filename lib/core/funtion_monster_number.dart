import 'dart:io';

Map<String, dynamic> determineMansion(int yearOfBirth, String gender) {
  // Tính tổng hai số cuối của năm sinh
  int lastTwoDigitsSum = (yearOfBirth % 10) + ((yearOfBirth ~/ 10) % 10);

  // Giảm về một chữ số nếu tổng lớn hơn 9
  if (lastTwoDigitsSum >= 10) {
    lastTwoDigitsSum = (lastTwoDigitsSum % 10) + (lastTwoDigitsSum ~/ 10);
  }

  // Tính quái số dựa trên giới tính và năm sinh
  int guaNumber;
  if (gender.toLowerCase() == 'male') {
    guaNumber =
        yearOfBirth < 2000 ? (10 - lastTwoDigitsSum) : (9 - lastTwoDigitsSum);
  } else if (gender.toLowerCase() == 'female') {
    guaNumber =
        yearOfBirth < 2000 ? (5 + lastTwoDigitsSum) : (6 + lastTwoDigitsSum);
  } else {
    return {'error': 'Giới tính không hợp lệ. Hãy nhập "male" hoặc "female".'};
  }

  // Điều chỉnh quái số 5 thành 2 (nam) hoặc 8 (nữ)
  if (guaNumber == 5) {
    guaNumber = gender.toLowerCase() == 'male' ? 2 : 8;
  }

  // Giảm về một chữ số nếu guaNumber lớn hơn 9
  if (guaNumber >= 10) {
    guaNumber = (guaNumber % 10) + (guaNumber ~/ 10);
  }

  // Xác định Đông Tứ Mệnh hoặc Tây Tứ Mệnh
  String mansion =
      ([1, 3, 4, 9].contains(guaNumber)) ? 'Đông Tứ Mệnh' : 'Tây Tứ Mệnh';

  // Trả về quái số và mệnh
  return {'guaNumber': guaNumber, 'mansion': mansion};
}

void main() {
  // Nhập năm sinh từ người dùng
  stdout.write('Nhập năm sinh của bạn: ');
  int? yearOfBirth = int.tryParse(stdin.readLineSync()!);

  if (yearOfBirth == null) {
    print('Vui lòng nhập một năm sinh hợp lệ.');
    return;
  }

  // Nhập giới tính từ người dùng
  stdout.write('Nhập giới tính của bạn (male/female): ');
  String? gender = stdin.readLineSync();

  if (gender == null ||
      (gender.toLowerCase() != 'male' && gender.toLowerCase() != 'female')) {
    print('Vui lòng nhập giới tính hợp lệ (male hoặc female).');
    return;
  }

  // Gọi hàm xác định mệnh
  var result = determineMansion(yearOfBirth, gender);

  if (result.containsKey('error')) {
    print(result['error']);
  } else {
    print('Quái số: ${result['guaNumber']}');
    print('Mệnh: ${result['mansion']}');
  }
}
