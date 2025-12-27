import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressEvent;
  final bool isLoading;
  const ElevatedButtonWidget({
    super.key,
    required this.buttonLabel,
    required this.onPressEvent,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {    
    return ElevatedButton(
      onPressed: isLoading ? null : onPressEvent,
      child: Text(
              buttonLabel,
              
            ),
    );
  }
}
