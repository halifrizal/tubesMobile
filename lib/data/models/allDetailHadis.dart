class allDetailHadist {
  String? name;
  String? slug;
  int? total;
  Pagination? pagination;
  List<Items>? items;

  allDetailHadist(
      {this.name, this.slug, this.total, this.pagination, this.items});

  allDetailHadist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    total = json['total'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['total'] = this.total;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? totalItems;
  int? currentPage;
  int? pageSize;
  int? totalPages;
  int? startPage;
  int? endPage;
  int? startIndex;
  int? endIndex;
  List<int>? pages;

  Pagination(
      {this.totalItems,
      this.currentPage,
      this.pageSize,
      this.totalPages,
      this.startPage,
      this.endPage,
      this.startIndex,
      this.endIndex,
      this.pages});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    startPage = json['startPage'];
    endPage = json['endPage'];
    startIndex = json['startIndex'];
    endIndex = json['endIndex'];
    pages = json['pages'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    data['currentPage'] = this.currentPage;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    data['startPage'] = this.startPage;
    data['endPage'] = this.endPage;
    data['startIndex'] = this.startIndex;
    data['endIndex'] = this.endIndex;
    data['pages'] = this.pages;
    return data;
  }
}

class Items {
  int? number;
  String? arab;
  String? id;

  Items({this.number, this.arab, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['arab'] = this.arab;
    data['id'] = this.id;
    return data;
  }
}
