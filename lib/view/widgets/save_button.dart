import 'package:flutter/material.dart';

class Savebutton extends StatelessWidget {
  final Function()? onTap;
  const Savebutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(21),
        // margin: const EdgeInsets.symmetric(horizontal: 105),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 58, 57, 57),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
