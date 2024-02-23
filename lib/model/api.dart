class Apimodel {
  dynamic id;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic category;
  dynamic image;
  Map rating;

  Apimodel({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
  });
  factory Apimodel.api({required Map e}) {
    return Apimodel(
        id: e['id'],
        category: e['category'],
        description: e['description'],
        image: e['image'],
        price: e['price'],
        rating: e['rating'],
        title: e['title']);
  }
}
