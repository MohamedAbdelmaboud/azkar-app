// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebha/core/routing/app_router.dart';

import '../widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      context.go(AppRouter.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }
}
