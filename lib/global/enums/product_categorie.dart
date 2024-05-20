enum ProductCategory {
  fruits('Fruits'),
  vegetables('Vegetables'),
  seeds('Seeds'),
  wheat('Wheat'),
  none('none');

  const ProductCategory(this.name);
  final String name;

  static ProductCategory? fromString(String name) {
    switch (name.toLowerCase()) {
      case 'fruits':
        return ProductCategory.fruits;
      case 'vegetables':
        return ProductCategory.vegetables;
      case 'seeds':
        return ProductCategory.seeds;
      case 'wheat':
        return ProductCategory.wheat;
      case 'none':
        return ProductCategory.none;
    }
    return null;
  }

  @override
  String toString() {
    return name;
  }
}
