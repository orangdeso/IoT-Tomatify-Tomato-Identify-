import 'package:flutter/material.dart';

class CustomTextTomat extends StatelessWidget {
  final String title;
  final String description;

  const CustomTextTomat({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.grey.shade800,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
