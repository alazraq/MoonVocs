import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Resource.dart';

class ResourceImages extends StatefulWidget {
  const ResourceImages({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final Resource resource;

  @override
  _ResourceImagesState createState() => _ResourceImagesState();
}

class _ResourceImagesState extends State<ResourceImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.resource.images[selectedImage]),
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.resource.images.length,
              (index) => SmallResourceImage(
                isSelected: index == selectedImage,
                press: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                image: widget.resource.images[index],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SmallResourceImage extends StatefulWidget {
  const SmallResourceImage(
      {super.key,
      required this.isSelected,
      required this.press,
      required this.image});

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  State<SmallResourceImage> createState() => _SmallResourceImageState();
}

class _SmallResourceImageState extends State<SmallResourceImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(widget.isSelected ? 1 : 0)),
        ),
        child: Image.asset(widget.image),
      ),
    );
  }
}
