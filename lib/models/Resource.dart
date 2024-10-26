// Resource model for the MoonVocs app.
// This model represents educational resources to support students in their orientation projects.

import 'package:flutter/material.dart';

/// The Resource class represents educational resources for students,
/// including attributes like title, description, and popularity.
class Resource {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavorite, isPopular;

  Resource({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Sample resources for demo purposes
List<Resource> demoResources = [
  Resource(
    id: 1,
    images: [
      "assets/images/Psychologie.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "J'apprends à mieux me connaître",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavorite: true,
    isPopular: true,
  ),
  Resource(
    id: 2,
    images: [
      "assets/images/Metiers.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Je trouve mes métiers préférés",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Resource(
    id: 3,
    images: [
      "assets/images/Ecoles.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Je postule aux écoles",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavorite: true,
    isPopular: true,
  ),
  Resource(
    id: 4,
    images: [
      "assets/images/Formations.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Formations pour mon avenir",
    price: 45.00,
    description: description,
    rating: 4.6,
    isFavorite: true,
  ),
  Resource(
    id: 5,
    images: [
      "assets/images/Bourses.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Je cherche des bourses d'études",
    price: 55.00,
    description: description,
    rating: 4.7,
    isFavorite: false,
    isPopular: true,
  ),
];

const String description =
    "This resource helps you explore, plan, and achieve your educational and career goals. Discover paths and opportunities that match your strengths and interests.";
