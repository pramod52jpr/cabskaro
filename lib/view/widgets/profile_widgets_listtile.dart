import 'package:flutter/material.dart';

class ProfileWidgetListTile extends StatelessWidget {
  final String text;
  final Icon icon;
final VoidCallback ontap;
  const ProfileWidgetListTile({super.key, 
    required this.text,
    required this.icon, required, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:ontap ,
      leading: icon, 
      title: Text(
        text, 
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
    );
  }
}
