import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const DeleteDialog({
    Key? key,
    required this.onCancel,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete Student',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          wordSpacing: 4,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Are you sure you want to delete this student?',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Comfortaa',
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(fontFamily: 'Comfortaa'),
          ),
          onPressed: onCancel,
        ),
        TextButton(
          child: const Text(
            'Delete',
            style: TextStyle(
              fontFamily: 'Comfortaa',
            ),
          ),
          onPressed: onDelete,
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 51, 50, 50),
    );
  }
}
