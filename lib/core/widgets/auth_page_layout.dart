import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'brand_mark.dart';

class AuthPageLayout extends StatelessWidget {
  const AuthPageLayout({
    required this.title,
    required this.description,
    required this.form,
    required this.footer,
    super.key,
  });

  final String title;
  final String description;
  final Widget form;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandMark(compact: true),
                  const SizedBox(height: 44),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(color: AppColors.muted, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  form,
                  const SizedBox(height: 26),
                  Center(child: footer),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
