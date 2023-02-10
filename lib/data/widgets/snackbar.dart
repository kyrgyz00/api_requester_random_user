import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key, required this.error});
  final String? error;
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(error.toString()));
    
  }
}
//  final snackBar = SnackBar(
//               content: Text("bekbolot"),
//             );
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(snackBar);