import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/employees/models/employee.dart';

class EmployeeImage extends StatelessWidget {
  const EmployeeImage({
    super.key,
    required this.imageSize,
    required this.employee,
  });

  final double imageSize;
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: imageSize,
      height: imageSize,
      imageUrl: employee.imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.contain,
    );
  }
}
