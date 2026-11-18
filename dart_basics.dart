
// Student: Nafisa Ahmed Hassan Musa
// Reg no: 25904
const String regNo = '25904';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by NAHM
  text = text.toLowerCase();

  int count = 0;
  int i = 0;

  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }

  return count;
}
// by NAHM
String initials(String fullName) {
  // First version: caused a RangeError
  /*
  List<String> parts = fullName.split(' ');

  String result = '';
  int i = 0;

  while (i < parts.length) {
    result += '${parts[i][0].toUpperCase()}.';
    i++;
  }

  return result;
  */

  // Fixed version
  fullName = fullName.trim();

  if (fullName.isEmpty) {
    return '';
  }

  List<String> parts = fullName.split(RegExp(r'\s+'));

  String result = '';
  int i = 0;

  while (i < parts.length) {
    result += '${parts[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

void drawTriangle(int height) {
  // by NAHM
  int row = 1;

  while (row <= height) {
    int spaces = height - row;
    String symbol = row.isOdd ? '*' : '#';

    String indentation = ''.padLeft(spaces);
    String symbols = List.filled(row, symbol).join();

    print('$indentation$symbols');

    row++;
  }
}

void main() {
  // by NAHM
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Nafisa Ahmed Hassan Musa';

  print('$fullName has ${countVowels(fullName)} vowels');

  print(initials('Nafisa Ahmed Hassan Musa'));
  print(initials(' ana uwase '));
  print(initials('  ana   uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);
}
