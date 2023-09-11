part of 'employee_hr_bloc.dart';

@immutable
abstract class EmployeeHrEvent {}

class EmployeeHrFetchData extends EmployeeHrEvent{}

class EmployeeHrToggleEdit extends EmployeeHrEvent{
  final EmployeeCardParams employee;

  EmployeeHrToggleEdit({required this.employee});
}

class EmployeeHrEditName extends EmployeeHrEvent{
  final EmployeeCardParams employee;
  final String firstName;
  final String lastName;

  EmployeeHrEditName(this.firstName, this.lastName, {required this.employee});
}
