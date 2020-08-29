class ProductResponse {
  final String id;
  final String name;
  final String picture;
  final String description;

  ProductResponse(this.id, this.name, this.picture, this.description);

  ProductResponse.fromMap(List<dynamic> data)
      : id = data[0].toString(),
        name = data[1].toString(),
        picture = data[2].toString(),
        description = data[3].toString();
}
