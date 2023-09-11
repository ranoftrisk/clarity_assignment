part of 'employee_hr_bloc.dart';

@immutable
abstract class EmployeeHrState {}

class EmployeeHrInitial extends EmployeeHrState {}

class EmployeeHrLoading extends EmployeeHrState {}

class EmployeeHrOnFinishedLoading extends EmployeeHrState {
  final List<EmployeeCardParams> employees;

  EmployeeHrOnFinishedLoading({required this.employees});
}
