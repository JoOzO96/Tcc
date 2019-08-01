class PhaseList {
  List<String> phase;

  PhaseList({List<String> phase}) {
    this.phase = phase;
  }

  PhaseList.fromJson(Map<String, dynamic> json) {
    phase = json['Phase'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Phase'] = this.phase;
    return data;
  }
}