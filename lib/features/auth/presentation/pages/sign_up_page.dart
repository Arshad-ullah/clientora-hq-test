import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/validation/auth_validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/auth_page_layout.dart';
import '../../../../core/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Account creation is not connected to an account service yet.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: 'Create your account',
      description: 'A few details and you’re ready to get started.',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              controller: _nameController,
              label: 'Full name',
              hint: 'Your name',
              prefixIcon: Icons.person_outline_rounded,
              textInputAction: TextInputAction.next,
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Enter your name'
                  : null,
            ),
            const SizedBox(height: 15),
            AppTextField(
              controller: _emailController,
              label: 'Email address',
              hint: 'you@example.com',
              prefixIcon: Icons.alternate_email_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: AuthValidators.email,
            ),
            const SizedBox(height: 15),
            AppTextField(
              controller: _passwordController,
              label: 'Password',
              hint: 'At least 8 characters',
              prefixIcon: Icons.lock_outline_rounded,
              textInputAction: TextInputAction.next,
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                tooltip: _isPasswordVisible ? 'Hide password' : 'Show password',
                onPressed: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Create a password';
                }
                if (value.length < 8) return 'Use at least 8 characters';
                return null;
              },
            ),
            const SizedBox(height: 15),
            AppTextField(
              controller: _confirmPasswordController,
              label: 'Confirm password',
              hint: 'Enter your password again',
              prefixIcon: Icons.lock_outline_rounded,
              textInputAction: TextInputAction.done,
              obscureText: !_isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            PrimaryButton(label: 'Create account', onPressed: _submit),
          ],
        ),
      ),
      footer: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(color: AppColors.muted),
          ),
          TextButton(
            onPressed: () => context.go(AppRoutes.signIn),
            child: const Text(
              'Sign in',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
