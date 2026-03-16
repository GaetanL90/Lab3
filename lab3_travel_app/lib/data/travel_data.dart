class Destination {
  final String id, title, location, description, imageAsset;
  final double price, rating;
  final int nights;
  final List<String> tags;
  bool isFavorite;

  Destination({
    required this.id, required this.title, required this.location,
    required this.description, required this.price, required this.rating,
    required this.nights, required this.imageAsset, required this.tags,
    this.isFavorite = false,
  });
}

List<Destination> popularDestinations = [
  Destination(id: 'paris', title: 'Paris Getaway', location: 'Paris, France', description: 'Experience the magic of the City of Light with charming streets, world-class museums, and cozy cafes.', price: 1299, rating: 4.8, nights: 5, imageAsset: 'assets/images/paris.jpg', tags: ['City', 'Romantic']),
  Destination(id: 'bali', title: 'Bali Escape', location: 'Bali, Indonesia', description: 'Relax on tropical beaches, explore lush rice terraces, and witness stunning sunsets.', price: 999, rating: 4.9, nights: 7, imageAsset: 'assets/images/bali.jpg', tags: ['Beach', 'Adventure']),
  Destination(id: 'kyoto', title: 'Kyoto Temples', location: 'Kyoto, Japan', description: 'Walk through bamboo forests, ancient shrines, and traditional tea houses.', price: 1150, rating: 4.7, nights: 4, imageAsset: 'assets/images/kyoto.jpg', tags: ['City', 'Culture']),
  Destination(id: 'capetown', title: 'Cape Town Adventure', location: 'South Africa', description: 'Coastal drives, table mountain hiking, and a vibrant city life.', price: 1399, rating: 4.6, nights: 6, imageAsset: 'assets/images/capetown.jpg', tags: ['Adventure', 'City']),
  Destination(id: 'alps', title: 'Swiss Alps', location: 'Switzerland', description: 'Snowy peaks and luxury resorts for the ultimate winter experience.', price: 1500, rating: 4.9, nights: 5, imageAsset: 'assets/images/Mountain.jpeg', tags: ['Adventure', 'Nature']),
  Destination(id: 'maldives', title: 'Maldives Lagoon', location: 'Maldives', description: 'Crystal clear waters and overwater bungalow luxury.', price: 2000, rating: 5.0, nights: 6, imageAsset: 'assets/images/Island.jpeg', tags: ['Beach', 'Romantic']),
];