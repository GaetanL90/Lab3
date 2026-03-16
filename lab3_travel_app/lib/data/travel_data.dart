class Destination {
  const Destination({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.nights,
    required this.imageAsset,
    required this.tags,
  });

  final String id;
  final String title;
  final String location;
  final String description;
  final double price;
  final double rating;
  final int nights;
  final String imageAsset;
  final List<String> tags;
}

const List<Destination> popularDestinations = [
  Destination(
    id: 'paris',
    title: 'Paris Getaway',
    location: 'Paris, France',
    description:
        'Discover the City of Light with charming streets, museums, and cafes.',
    price: 1299,
    rating: 4.8,
    nights: 5,
    imageAsset: 'assets/images/paris.jpg',
    tags: ['City', 'Romantic', 'Culture'],
  ),
  Destination(
    id: 'bali',
    title: 'Bali Escape',
    location: 'Bali, Indonesia',
    description:
        'Relax on tropical beaches, rice terraces, and stunning sunsets.',
    price: 999,
    rating: 4.9,
    nights: 7,
    imageAsset: 'assets/images/bali.jpg',
    tags: ['Beach', 'Relax', 'Tropical'],
  ),
  Destination(
    id: 'kyoto',
    title: 'Kyoto Temples',
    location: 'Kyoto, Japan',
    description:
        'Walk through bamboo forests, shrines, and traditional tea houses.',
    price: 1150,
    rating: 4.7,
    nights: 4,
    imageAsset: 'assets/images/kyoto.jpg',
    tags: ['History', 'Temple', 'Nature'],
  ),
  Destination(
    id: 'cape-town',
    title: 'Cape Town Adventure',
    location: 'Cape Town, South Africa',
    description:
        'Cable cars, coastal drives, and a vibrant waterfront city.',
    price: 1399,
    rating: 4.6,
    nights: 6,
    imageAsset: 'assets/images/capetown.jpg',
    tags: ['Adventure', 'Coast', 'City'],
  ),
];

