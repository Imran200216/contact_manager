import 'package:flutter/material.dart';

class CmContactCard extends StatelessWidget {
  final String userName;
  final String userPhoneNumber;

  const CmContactCard({
    super.key,
    required this.userName,
    required this.userPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.blue),
        title: Text(
          userName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(userPhoneNumber),
      ),
    );
  }
}
