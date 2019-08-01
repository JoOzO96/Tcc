import 'CollaboratorList.dart';
import 'LeadSponsor.dart';
import 'ResponsibleParty.dart';

class SponsorCollaboratorsModule {
  ResponsibleParty responsibleParty;
  LeadSponsor leadSponsor;
  CollaboratorList collaboratorList;

  SponsorCollaboratorsModule(
      {ResponsibleParty responsibleParty,
      LeadSponsor leadSponsor,
      CollaboratorList collaboratorList}) {
    this.responsibleParty = responsibleParty;
    this.leadSponsor = leadSponsor;
    this.collaboratorList = collaboratorList;
  }

  SponsorCollaboratorsModule.fromJson(Map<String, dynamic> json) {
    responsibleParty = json['ResponsibleParty'] != null
        ? new ResponsibleParty.fromJson(json['ResponsibleParty'])
        : null;
    leadSponsor = json['LeadSponsor'] != null
        ? new LeadSponsor.fromJson(json['LeadSponsor'])
        : null;
    collaboratorList = json['CollaboratorList'] != null
        ? new CollaboratorList.fromJson(json['CollaboratorList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responsibleParty != null) {
      data['ResponsibleParty'] = this.responsibleParty.toJson();
    }
    if (this.leadSponsor != null) {
      data['LeadSponsor'] = this.leadSponsor.toJson();
    }
    if (this.collaboratorList != null) {
      data['CollaboratorList'] = this.collaboratorList.toJson();
    }
    return data;
  }
}