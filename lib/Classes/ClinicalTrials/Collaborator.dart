class Collaborator {
  String collaboratorName;
  String collaboratorClass;

  Collaborator({String collaboratorName, String collaboratorClass}) {
    this.collaboratorName = collaboratorName;
    this.collaboratorClass = collaboratorClass;
  }

  Collaborator.fromJson(Map<String, dynamic> json) {
    collaboratorName = json['CollaboratorName'];
    collaboratorClass = json['CollaboratorClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CollaboratorName'] = this.collaboratorName;
    data['CollaboratorClass'] = this.collaboratorClass;
    return data;
  }
}