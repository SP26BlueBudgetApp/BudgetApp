import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 180,
        height: 42,
        child: MaterialButton(
            onPressed: onPressed,
            color: const Color.fromARGB(255, 83, 83, 83),
            textColor:Colors.white,
            child: Text(
              label,
              style: const TextStyle(fontSize: 18),
            )           

          )
        );
  }
}