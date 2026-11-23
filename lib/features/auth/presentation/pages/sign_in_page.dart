import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/validation/auth_validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/auth_page_layout.dart';
import '../../../../core/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _showAuthUnavailableMessage();
  }

  void _showAuthUnavailableMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign-in is not connected to an account service yet.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: 'Welcome back',
      description: 'Sign in to pick up right where you left off.',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              controller: _emailController,
              label: 'Email address',
              hint: 'you@example.com',
              prefixIcon: Icons.alternate_email_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: AuthValidators.email,
            ),
            const SizedBox(height: 17),
            AppTextField(
              controller: _passwordController,
              label: 'Password',
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outline_rounded,
              textInputAction: TextInputAction.done,
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
              validator: (value) =>
                  value == null || value.isEmpty ? 'Enter your password' : null,
            ),
            const SizedBox(height: 26),
            PrimaryButton(label: 'Sign in', onPressed: _submit),
          ],
        ),
      ),
      footer: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text('New to Hash?', style: TextStyle(color: AppColors.muted)),
          TextButton(
            onPressed: () => context.push(AppRoutes.signUp),
            child: const Text(
              'Create account',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
