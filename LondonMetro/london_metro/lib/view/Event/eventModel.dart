// tour.dart
class MyEvent {
  final int id;
  final String web_url;
  final String currency_code;
  final double rating;
  final String description;
  final String duration;
  final String thumbnail_url;
  final int review_count;
  final String image_url;
  final int saving_amount;
  final String title;
  final double price;
  final String short_title;

  MyEvent({
    required this.id,
    required this.web_url,
    required this.currency_code,
    required this.rating,
    required this.description,
    required this.duration,
    required this.thumbnail_url,
    required this.review_count,
    required this.image_url,
    required this.saving_amount,
    required this.title,
    required this.price,
    required this.short_title,
  });

  factory MyEvent.fromJson(Map<String, dynamic> json) {
    return MyEvent(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      web_url: json['web_url'],
      currency_code: json['currency_code'],
      rating: (json['rating'] is String)
          ? double.parse(json['rating'])
          : json['rating'].toDouble(),
      description: json['description'],
      duration: json['duration'],
      thumbnail_url: json['thumbnail_url'],
      review_count: json['review_count'] is int
          ? json['review_count']
          : int.parse(json['review_count']),
      image_url: json['image_url'],
      saving_amount: json['saving_amount'] is int
          ? json['saving_amount']
          : int.parse(json['saving_amount']),
      title: json['title'],
      price: (json['price'] is String)
          ? double.parse(json['price'])
          : json['price'].toDouble(),
      short_title: json['short_title'],
    );
  }
}
