import 'package:flutter/material.dart';

class OnboardingPageModel {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final String? imageUrl;

  const OnboardingPageModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    this.imageUrl,
  });
}
