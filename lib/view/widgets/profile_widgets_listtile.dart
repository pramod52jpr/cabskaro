import 'package:flutter/material.dart';

class ProfileWidgetListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Icon icon;

  const ProfileWidgetListTile({
    required this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
