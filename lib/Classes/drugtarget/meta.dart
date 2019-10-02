class Meta {
  int limit;
  String next;
  int offset;
  Null previous;
  int totalCount;

  Meta({this.limit, this.next, this.offset, this.previous, this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total_count'] = this.totalCount;
    return data;
  }
}