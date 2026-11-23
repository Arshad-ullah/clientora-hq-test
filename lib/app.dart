import 'package:flutter/material.dart';

import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';

class HashApp extends StatelessWidget {
  const HashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hash',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
