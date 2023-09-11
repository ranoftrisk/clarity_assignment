import 'dart:developer';

import 'package:clarity_assignment/core/services/mock_assets_loader_service.dart';
import 'package:clarity_assignment/domain/employees/models/employee.dart';

class EmployeeRepo{
  static const _mockJsonUri = 'assets/mock/mock_employees.json';

  Future<List<Employee>> getEmployees()async{
    try{
      final employeeJson = await MockAssetsLoaderService.getMockJson(_mockJsonUri) as Map<String, dynamic>;
      final employeeJsonList = employeeJson['results'] as List;
      final employees = employeeJsonList.map((json) => Employee.fromMap(json as Map<String, dynamic>));
      return employees.toList();
    }catch(error, stackTrace){
      const funcName= "getEmployees";
      log("====$funcName ERROR:====");
      log(error.toString(), name:"ERROR");
      log(stackTrace.toString(), name:"stackTrace");
      log("=======$funcName ERROR=======");
      //TODO: Error management...
    }
    return [];
  }
}