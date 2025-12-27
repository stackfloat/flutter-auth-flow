import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/common/widgets/elevated_button_widget.dart';
import 'package:furniture_ecommerce_app/core/common/widgets/text_field_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 32,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      
                      // Title
                      Text(
                        "Create an Account",
                        style: textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      
                      // Subtitle
                      Text(
                        "Enter your details to register",
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 32),

                      // Name field
                      Text(
                        "Name",
                        style: textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(keyboardType: TextInputType.name,),
                      const SizedBox(height: 20),

                      // Email field
                      Text(
                        "Email Address",
                        style: textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(keyboardType: TextInputType.emailAddress,),
                      const SizedBox(height: 20),
                      
                      // Password field
                      Text(
                        "Password",
                        style: textTheme.labelLarge,                        
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 32),
                      
                      
                      // Password field
                      Text(
                        "Confirm Password",
                        style: textTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      TextFieldWidget(
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 32),

                      // Login button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButtonWidget(
                          buttonLabel: 'Sign Up',
                          onPressEvent: () {
                            // Handle login
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 22),
                      const Spacer(),  // ✅ Now works with IntrinsicHeight
                      
                      // Sign up link at bottom
                      Center(
                        child: Text.rich(
                          TextSpan(
                            style: textTheme.bodyMedium,
                            children: [
                              const TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Sign In",
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}