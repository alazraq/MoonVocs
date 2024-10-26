import 'Resource.dart';

class Cart {
  final Resource resource;
  final int numOfItem;

  Cart({required this.resource, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(resource: demoResources[0], numOfItem: 2),
  Cart(resource: demoResources[1], numOfItem: 1),
  Cart(resource: demoResources[3], numOfItem: 1),
];
