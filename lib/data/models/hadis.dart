class hadis {
  String? name;
  String? slug;
  int? total;

  hadis({this.name, this.slug, this.total});

  hadis.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['total'] = this.total;
    return data;
  }
}
