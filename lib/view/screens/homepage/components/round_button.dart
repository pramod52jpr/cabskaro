import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: 200,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(227, 132, 42, 0.8))),
        onPressed: loading ? () {} : onPressed,
        child: loading
            ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 3)
            : Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
      ),
    );
  }
}
