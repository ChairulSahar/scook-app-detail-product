class Review{
  final String name;
  final String description;
  final String profile;
  final String variant;
  final String date;
  final String sellerResponse;
  final String sellerResponseDate;
  final double review;
  Review({
    required this.name,
    required this.description,
    required this.profile,
    required this.variant,
    required this.date,
    required this.sellerResponse,
    required this.sellerResponseDate,
    required this.review,
  });
}

final listReview = [
  Review(
    profile: 'assets/profile.png',
    name: 'Maritza Mendez',
    variant: 'Blueberry',
    date: '24-Mar-2024',
    sellerResponse: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus.',
    sellerResponseDate: '24-Mar-2024',
    review: 5,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Review(
    profile: 'assets/profile.png',
    name: 'Mendez',
    variant: 'All Variant',
    date: '24-Mar-2024',
    sellerResponse: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus.',
    sellerResponseDate: '24-Mar-2024',
    review: 5,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Review(
    profile: 'assets/profile.png',
    name: 'Maritza',
    variant: 'Blueberry',
    date: '24-Mar-2024',
    sellerResponse: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus.',
    sellerResponseDate: '24-Mar-2024',
    review: 5,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
  Review(
    profile: 'assets/profile.png',
    name: 'Mendez Maritza',
    variant: 'Blueberry',
    date: '24-Mar-2024',
    sellerResponse: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus.',
    sellerResponseDate: '24-Mar-2024',
    review: 5,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus odio, varius non volutpat at, porttitor sollicitudin massa. Vivamus et pretium sem. Ut vitae suscipit ex. Aenean laoreet mauris sit amet hendrerit congue. Nam ac sem id augue pellentesque interdum vitae ut ex. Donec a diam nec nunc vulputate rutrum."
  ),
];