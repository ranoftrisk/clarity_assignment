import 'dart:async';

import 'package:clarity_assignment/domain/employees/models/employee.dart';
import 'package:clarity_assignment/domain/employees/models/employee_card_params.dart';
import 'package:clarity_assignment/domain/employees/repo/employees_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'employee_hr_event.dart';

part 'employee_hr_state.dart';

class EmployeeHrBloc extends Bloc<EmployeeHrEvent, EmployeeHrState> {
  List<EmployeeCardParams> employees = [];
  final EmployeeRepo repo;

  EmployeeHrBloc(this.repo) : super(EmployeeHrInitial()) {
    on<EmployeeHrFetchData>(_employeeHrFetchData);
    on<EmployeeHrToggleEdit>(_employeeHrToggleEdit);
    on<EmployeeHrEditName>(_employeeHrEditName);
  }

  FutureOr<void> _employeeHrFetchData(
      EmployeeHrFetchData event, Emitter<EmployeeHrState> emit) async {
    emit(EmployeeHrLoading());
    final employeeList = await repo.getEmployees();
    if (employeeList.isNotEmpty) {
      employees = employeeList
          .map((employee) => EmployeeCardParams.fromEmployee(employee))
          .toList();
      emit(EmployeeHrOnFinishedLoading(employees: employees));
    } else {
      //TODO: error...
    }
  }

  FutureOr<void> _employeeHrToggleEdit(
      EmployeeHrToggleEdit event, Emitter<EmployeeHrState> emit) {
    event.employee.isInFrontMode = !event.employee.isInFrontMode;
    emit(EmployeeHrOnFinishedLoading(employees: employees));
  }

  FutureOr<void> _employeeHrEditName(EmployeeHrEditName event, Emitter<EmployeeHrState> emit) {
    final employee = event.employee;
    employee.isInFrontMode = !employee.isInFrontMode;
    if (event.firstName.isNotEmpty)  employee.firstName = event.firstName;
    if (event.lastName.isNotEmpty)  employee.lastName = event.lastName;
    emit(EmployeeHrOnFinishedLoading(employees: employees));
  }
}
