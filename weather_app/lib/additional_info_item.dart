import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInformationCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
