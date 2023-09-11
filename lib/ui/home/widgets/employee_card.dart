import 'dart:math';

import 'package:clarity_assignment/domain/employees/models/employee.dart';
import 'package:clarity_assignment/ui/home/widgets/back_edit_card.dart';
import 'package:clarity_assignment/ui/home/widgets/font_preview_card.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
    required this.isFront,
    required this.onStartEdit,
    required this.onFinishEdit,
  });

  final Employee employee;
  final bool isFront;
  final VoidCallback onStartEdit;
  final Function(String, String) onFinishEdit;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isFront
          ? FrontPreviewCard(
              employee: employee,
              onEdit: onStartEdit,
            )
          : BackEditCard(
              employee: employee,
              onFinishEditing: onFinishEdit,
            ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
