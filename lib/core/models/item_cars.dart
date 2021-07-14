class ItemCars {
  final String name;
  final String price;
  final String asset;
  final bool favorited;
  final int color;


  ItemCars(this.name, this.price, this.asset, this.favorited, this.color);

  @override
  String toString() {
    return '{ name: ${this.name}, price: ${this.price}, asset: ${this.asset}, favorited: ${this.favorited}, color: ${this.color} }';
  }
}

class ItemCarDetail extends ItemCars{
  final int index;

  ItemCarDetail(String name, String price, String asset, bool favorited, int color, this.index) : super(name, price, asset, favorited, color);
}