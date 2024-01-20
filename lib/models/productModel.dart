
class ProductModel{
  final String? id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final List<Map<String, dynamic>> category;

  const ProductModel({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.category,
});
  toJson(){
    return {
      "id":id,
      "title":title,
      "imageUrl":imageUrl,
      "price":price,
      "description":description,
      "category":category,
    };
  }

}