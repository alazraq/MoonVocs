import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) onSearchChanged;
  final List<String> countries;
  final Function(String?) onCountrySelected;

  const SearchField({
    Key? key,
    required this.onSearchChanged,
    required this.countries,
    required this.onCountrySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure the column takes full width
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: "Rechercher métier ou formation",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButtonFormField<String>(
            isExpanded: true, // Ensure the dropdown is expanded to fit its parent width
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            hint: const Text("Select a country"),
            value: countries.contains('All') ? 'All' : null,
            onChanged: onCountrySelected,
            items: countries.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
