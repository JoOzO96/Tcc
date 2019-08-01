class DesignWhoMaskedList {
  List<String> designWhoMasked;

  DesignWhoMaskedList({List<String> designWhoMasked}) {
    this.designWhoMasked = designWhoMasked;
  }
  DesignWhoMaskedList.fromJson(Map<String, dynamic> json) {
    designWhoMasked = json['DesignWhoMasked'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DesignWhoMasked'] = this.designWhoMasked;
    return data;
  }
}