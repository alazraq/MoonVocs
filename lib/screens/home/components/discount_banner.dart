import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hello Youssouf!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20), // Space between the greeting and the objectives
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Objective Column
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Plus Icon.svg', // Path to your asset
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    width: 24, // Adjust the size as needed
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1 Objectif validé",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Mission Column
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Success.svg', // Path to your asset
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    width: 24, // Adjust the size as needed
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "0 Mission complétée",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
