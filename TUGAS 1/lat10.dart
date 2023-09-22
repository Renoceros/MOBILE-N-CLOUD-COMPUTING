import 'dart:io';

class Employee {
  String id;
  String name;
  double salary;
  String status;

  Employee(this.id, this.name, this.salary, this.status);

  double calculateBonus() {
    return 0.10 * salary; // 10% of salary
  }

  double calculateAllowance() {
    if (status == 'M') {
      return 0.08 * salary; // 8% of salary for married
    } else {
      return 0.05 * salary; // 5% of salary for others
    }
  }

  double calculateTotalSalary() {
    double bonus = calculateBonus();
    double allowance = calculateAllowance();
    return salary + bonus + allowance;
  }
}

void main() {
  print('Enter employee details:');
  stdout.write('Id Pegawai: ');
  String id = stdin.readLineSync() ?? '';

  stdout.write('Nama: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Gaji: ');
  String salaryInput = stdin.readLineSync() ?? '';
  double salary = double.tryParse(salaryInput) ?? 0.0;

  stdout.write('Status (M for Menikah, other for others): ');
  String status = stdin.readLineSync() ?? '';

  Employee employee = Employee(id, name, salary, status);

  double totalSalary = employee.calculateTotalSalary();

  print('Total Gaji Pegawai:');
  print('Id: ${employee.id}');
  print('Nama: ${employee.name}');
  print('Gaji: ${employee.salary}');
  print('Bonus: ${employee.calculateBonus()}');
  print('Tunjangan: ${employee.calculateAllowance()}');
  print('Total Gaji: $totalSalary');
}