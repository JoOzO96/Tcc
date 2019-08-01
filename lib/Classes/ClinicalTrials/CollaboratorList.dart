import 'Collaborator.dart';

class CollaboratorList {
  List<Collaborator> collaborator;

  CollaboratorList({List<Collaborator> collaborator}) {
    this.collaborator = collaborator;
  }

  CollaboratorList.fromJson(Map<String, dynamic> json) {
    if (json['Collaborator'] != null) {
      collaborator = new List<Collaborator>();
      json['Collaborator'].forEach((v) {
        collaborator.add(new Collaborator.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collaborator != null) {
      data['Collaborator'] = this.collaborator.map((v) => v.toJson()).toList();
    }
    return data;
  }
}