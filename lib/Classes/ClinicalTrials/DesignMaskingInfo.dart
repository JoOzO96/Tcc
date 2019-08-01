import 'DesignWhoMaskedList.dart';

class DesignMaskingInfo {
  String designMasking;
  DesignWhoMaskedList designWhoMaskedList;

  DesignMaskingInfo(
      {String designMasking, DesignWhoMaskedList designWhoMaskedList}) {
    this.designMasking = designMasking;
    this.designWhoMaskedList = designWhoMaskedList;
  }

  DesignMaskingInfo.fromJson(Map<String, dynamic> json) {
    designMasking = json['DesignMasking'];
    designWhoMaskedList = json['DesignWhoMaskedList'] != null
        ? new DesignWhoMaskedList.fromJson(json['DesignWhoMaskedList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DesignMasking'] = this.designMasking;
    if (this.designWhoMaskedList != null) {
      data['DesignWhoMaskedList'] = this.designWhoMaskedList.toJson();
    }
    return data;
  }
}