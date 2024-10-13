import 'package:flutter/material.dart';

class LicensePageCustom extends StatefulWidget {
  const LicensePageCustom({super.key});

  @override
  State<LicensePageCustom> createState() => _LicensePageCustomState();
}

class _LicensePageCustomState extends State<LicensePageCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  LicensePage(
      applicationName: 'NovaBot',
      applicationIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('asset/child1.png'),
        ),
        applicationVersion: '1.0.0',
      ),
    );
  }
}