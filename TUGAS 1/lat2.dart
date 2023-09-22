import 'dart:io';

void main(){
  print('Input base of the triangle: ');
  String baseinput = stdin.readLineSync() ?? '';
  double base = double.tryParse(baseinput) ?? 0.0;

  print('Input triangle height: ');
  String heightinput = stdin.readLineSync() ?? '';
  double height = double.tryParse(heightinput) ?? 0.0;

  double area = 0.5 * height * base;
  print('Area: ${area}');
}