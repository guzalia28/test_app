enum Types {all, expense, income}

class FilterType {
  String name;
  Types type;

  FilterType({required this.name, required this.type});
}

class Filter {
  String? category;
  FilterType type;

  Filter({this.category, required this.type});
}