import 'DesignMaskingInfo.dart';

class DesignInfo {
  String designAllocation;
  String designInterventionModel;
  String designPrimaryPurpose;
  DesignMaskingInfo designMaskingInfo;

  DesignInfo(
      {String designAllocation,
      String designInterventionModel,
      String designPrimaryPurpose,
      DesignMaskingInfo designMaskingInfo}) {
    this.designAllocation = designAllocation;
    this.designInterventionModel = designInterventionModel;
    this.designPrimaryPurpose = designPrimaryPurpose;
    this.designMaskingInfo = designMaskingInfo;
  }

  DesignInfo.fromJson(Map<String, dynamic> json) {
    designAllocation = json['DesignAllocation'];
    designInterventionModel = json['DesignInterventionModel'];
    designPrimaryPurpose = json['DesignPrimaryPurpose'];
    designMaskingInfo = json['DesignMaskingInfo'] != null
        ? new DesignMaskingInfo.fromJson(json['DesignMaskingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DesignAllocation'] = this.designAllocation;
    data['DesignInterventionModel'] = this.designInterventionModel;
    data['DesignPrimaryPurpose'] = this.designPrimaryPurpose;
    if (this.designMaskingInfo != null) {
      data['DesignMaskingInfo'] = this.designMaskingInfo.toJson();
    }
    return data;
  }
}