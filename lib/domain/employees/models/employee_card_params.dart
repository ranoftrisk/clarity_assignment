import 'employee.dart';

class EmployeeCardParams extends Employee {
  bool isInFrontMode = true;

  EmployeeCardParams(
      {required super.firstName, required super.lastName, required super.city, required super.street, required super.imageUrl, required super.gender});

  factory EmployeeCardParams.fromEmployee(Employee employee) =>
      EmployeeCardParams(firstName: employee.firstName,
          lastName: employee.lastName,
          imageUrl: employee.imageUrl,
          gender: employee.gender, city: employee.city, street: employee.street);
}
