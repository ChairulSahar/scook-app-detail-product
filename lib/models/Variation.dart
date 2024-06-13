class Variation{
  final String name;
  final double price;
  final double sold;
  final String description;
  final String productImage;
  final String stocks;
  final double review;
  final double reviewCount;
  Variation({
    required this.name,
    required this.price,
    required this.sold,
    required this.description,
    required this.productImage,
    required this.stocks,
    required this.review,
    required this.reviewCount,
  });
}

final listVariaton = [
  Variation(
    productImage: 'assets/lipbalm-all.png',
    name: 'All Variant',
    price: 159000,
    review: 4.4,
    reviewCount: 100,
    stocks: "In Stock",
    sold: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Variation(
    productImage: 'assets/lipbalm-blue.png',
    name: 'Blueberry',
    price: 50000,
    review: 4.4,
    reviewCount: 100,
    stocks: "In Stock",
    sold: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Variation(
    productImage: 'assets/lipbalm-kiwi.png',
    name: 'Kiwi',
    price: 50000,
    review: 4.4,
    reviewCount: 100,
    stocks: "In Stock",
    sold: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Variation(
    productImage: 'assets/lipbalm-berry.png',
    name: 'Berry',
    price: 50000,
    review: 4.4,
    reviewCount: 100,
    stocks: "Out of Stock",
    sold: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Variation(
    productImage: 'assets/lipbalm-berry.png',
    name: 'Berry No2',
    price: 50000,
    review: 4.4,
    reviewCount: 100,
    stocks: "Out of Stocs",
    sold: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
];