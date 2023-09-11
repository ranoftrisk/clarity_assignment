import 'package:cached_network_image/cached_network_image.dart';
import 'package:clarity_assignment/domain/employees/models/employee.dart';
import 'package:clarity_assignment/ui/generic/employee_image.dart';
import 'package:clarity_assignment/ui/generic/stylish_text_field.dart';
import 'package:clarity_assignment/ui/home/widgets/card_data_column.dart';
import 'package:clarity_assignment/utils/styles.dart';
import 'package:flutter/material.dart';

class BackEditCard extends StatelessWidget {
  const BackEditCard(
      {super.key, required this.employee, required this.onFinishEditing});

  final Employee employee;
  final Function(String, String) onFinishEditing;

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

    const imageSize = 100.0;
    return SizedBox(
      height: 250,
      child: Card(
        color: ColorStyles.backColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              EmployeeImage(imageSize: imageSize, employee: employee),
              SizedBox(
                width: 8,
              ),
              Expanded(child: buildNameColumn(firstNameController, lastNameController)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: ColorStyles.callToAction,
                    ),
                    onPressed: (){
                      final firstName = firstNameController.text;
                      final lastName = lastNameController.text;
                      onFinishEditing.call(firstName,lastName);
                    },
                  ),
                  Icon(
                    employee.gender.getIcon(),
                    color: employee.gender.getColor(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildNameColumn(TextEditingController firstName, TextEditingController lastName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardDataColumn(
            headline: "First name", bottom:StylishTextField(controller: firstName,hint: employee.firstName,)),
        SizedBox(
          height: 8,
        ),
        CardDataColumn(
            headline: "Last name", bottom: StylishTextField(controller: lastName,hint: employee.lastName,)),
      ],
    );
  }
}
