import 'package:clarity_assignment/domain/employees/repo/employees_repo.dart';
import 'package:clarity_assignment/ui/generic/loading_screen.dart';
import 'package:clarity_assignment/ui/home/bloc/employee_hr_bloc.dart';
import 'package:clarity_assignment/ui/home/widgets/employee_card.dart';
import 'package:clarity_assignment/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeHrPage extends StatelessWidget {
  const EmployeeHrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => EmployeeRepo(),
      child: BlocProvider(
        create: (context) =>
        EmployeeHrBloc(context.read<EmployeeRepo>())
          ..add(EmployeeHrFetchData()),
        child: BlocBuilder<EmployeeHrBloc, EmployeeHrState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeHrBloc>();
            if (state is EmployeeHrLoading) {
              return const LoadingScreen();
            }
            if (state is EmployeeHrOnFinishedLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Grandmeiser Ltd - Employees",
                    style: Styles.appBarTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final employee = state.employees[index];
                      return EmployeeCard(
                        employee: employee,
                        isFront: employee.isInFrontMode,
                        onStartEdit: () =>
                            bloc.add(EmployeeHrToggleEdit(employee: employee)),
                        onFinishEdit: (String first, String last) => bloc.add(EmployeeHrEditName(first, last, employee: employee)),);
                    },
                    itemCount: state.employees.length,
                  ),
                ),
              );
            }

            return Container(); //...TODO: error state
          },
        ),
      ),
    );
  }
}
