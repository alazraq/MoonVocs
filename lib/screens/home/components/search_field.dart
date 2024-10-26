// SearchField widget for the MoonVocs app's HomeScreen.
// This widget displays a search bar with a hint text for users to search for jobs or training.

import 'package:flutter/material.dart';
import '../../../constants.dart';

/// The SearchField widget provides a search bar with a placeholder for job or training searches.
///
/// This widget appears in the HomeHeader, allowing users to input search queries.
/// It features a search icon, placeholder text, and a subtle background color.
class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {
          // Add search functionality here.
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withOpacity(0.1), // Light background color.
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder, // Border styling.
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Rechercher métier ou formation", // Search placeholder.
          hintStyle: const TextStyle(fontSize: 14),
          prefixIcon: const Icon(Icons.search), // Search icon.
        ),
      ),
    );
  }
}

/// Outline input border styling for the search field.
const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
