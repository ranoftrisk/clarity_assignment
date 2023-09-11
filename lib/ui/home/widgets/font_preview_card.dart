import 'package:cached_network_image/cached_network_image.dart';
import 'package:clarity_assignment/domain/employees/models/employee.dart';
import 'package:clarity_assignment/ui/generic/employee_image.dart';
import 'package:clarity_assignment/ui/home/widgets/card_data_column.dart';
import 'package:clarity_assignment/utils/styles.dart';
import 'package:flutter/material.dart';

class FrontPreviewCard extends StatelessWidget {
  const FrontPreviewCard(
      {super.key, required this.employee, required this.onEdit});

  final Employee employee;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;
    return SizedBox(
      height: 150,
      child: Card(
        color: ColorStyles.frontColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              EmployeeImage(imageSize: imageSize, employee: employee),
              SizedBox(
                width: 8,
              ),
              buildNameColumn(),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: ColorStyles.callToAction,
                    ),
                    onPressed: onEdit,
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

  Column buildNameColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardDataColumn(
            headline: "First name", bottom: buildValueText(employee.firstName)),
        SizedBox(
          height: 8,
        ),
        CardDataColumn(
            headline: "Last name", bottom: buildValueText(employee.lastName)),
      ],
    );
  }

  Text buildValueText(String value) => Text(
        value,
        style: Styles.valueTextStyle,
      );
}
