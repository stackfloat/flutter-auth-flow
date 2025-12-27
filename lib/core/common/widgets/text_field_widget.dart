import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.errorMessage,
    this.onRevealPassword,
    this.revealPassword = false,
    this.onSubmitted,
  });

  final TextInputType keyboardType;
  final bool isPassword;
  final String ?errorMessage;
  final VoidCallback? onRevealPassword;
  final VoidCallback? onSubmitted;
  final bool revealPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword ? true : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errorMessage,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  revealPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: onRevealPassword,
              )
            : null,
      ),              
    );
  }
}