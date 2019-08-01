import 'package:unidb/Classes/ClinicalTrials/ConditionsModule.dart';
import 'package:unidb/Classes/ClinicalTrials/DescriptionModule.dart';
import 'package:unidb/Classes/ClinicalTrials/OversightModule.dart';

import 'ArmsInterventionsModule.dart';
import 'ContactsLocationsModule.dart';
import 'DesignModule.dart';
import 'EligibilityModule.dart';
import 'IdentificationModule.dart';
import 'OutcomesModule.dart';
import 'ReferencesModule.dart';
import 'SponsorCollaboratorsModule.dart';
import 'StatusModule.dart';

class ProtocolSection {
  IdentificationModule identificationModule;
  StatusModule statusModule;
  SponsorCollaboratorsModule sponsorCollaboratorsModule;
  OversightModule oversightModule;
  DescriptionModule descriptionModule;
  ConditionsModule conditionsModule;
  DesignModule designModule;
  ArmsInterventionsModule armsInterventionsModule;
  OutcomesModule outcomesModule;
  EligibilityModule eligibilityModule;
  ContactsLocationsModule contactsLocationsModule;
  ReferencesModule referencesModule;

  ProtocolSection(
      {IdentificationModule identificationModule,
      StatusModule statusModule,
      SponsorCollaboratorsModule sponsorCollaboratorsModule,
      OversightModule oversightModule,
      DescriptionModule descriptionModule,
      ConditionsModule conditionsModule,
      DesignModule designModule,
      ArmsInterventionsModule armsInterventionsModule,
      OutcomesModule outcomesModule,
      EligibilityModule eligibilityModule,
      ContactsLocationsModule contactsLocationsModule,
      ReferencesModule referencesModule}) {
    this.identificationModule = identificationModule;
    this.statusModule = statusModule;
    this.sponsorCollaboratorsModule = sponsorCollaboratorsModule;
    this.oversightModule = oversightModule;
    this.descriptionModule = descriptionModule;
    this.conditionsModule = conditionsModule;
    this.designModule = designModule;
    this.armsInterventionsModule = armsInterventionsModule;
    this.outcomesModule = outcomesModule;
    this.eligibilityModule = eligibilityModule;
    this.contactsLocationsModule = contactsLocationsModule;
    this.referencesModule = referencesModule;
  }

  ProtocolSection.fromJson(Map<String, dynamic> json) {
    identificationModule = json['IdentificationModule'] != null
        ? new IdentificationModule.fromJson(json['IdentificationModule'])
        : null;
    statusModule = json['StatusModule'] != null
        ? new StatusModule.fromJson(json['StatusModule'])
        : null;
    sponsorCollaboratorsModule = json['SponsorCollaboratorsModule'] != null
        ? new SponsorCollaboratorsModule.fromJson(
            json['SponsorCollaboratorsModule'])
        : null;
    oversightModule = json['OversightModule'] != null
        ? new OversightModule.fromJson(json['OversightModule'])
        : null;
    descriptionModule = json['DescriptionModule'] != null
        ? new DescriptionModule.fromJson(json['DescriptionModule'])
        : null;
    conditionsModule = json['ConditionsModule'] != null
        ? new ConditionsModule.fromJson(json['ConditionsModule'])
        : null;
    designModule = json['DesignModule'] != null
        ? new DesignModule.fromJson(json['DesignModule'])
        : null;
    armsInterventionsModule = json['ArmsInterventionsModule'] != null
        ? new ArmsInterventionsModule.fromJson(json['ArmsInterventionsModule'])
        : null;
    outcomesModule = json['OutcomesModule'] != null
        ? new OutcomesModule.fromJson(json['OutcomesModule'])
        : null;
    eligibilityModule = json['EligibilityModule'] != null
        ? new EligibilityModule.fromJson(json['EligibilityModule'])
        : null;
    contactsLocationsModule = json['ContactsLocationsModule'] != null
        ? new ContactsLocationsModule.fromJson(json['ContactsLocationsModule'])
        : null;
    referencesModule = json['ReferencesModule'] != null
        ? new ReferencesModule.fromJson(json['ReferencesModule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.identificationModule != null) {
      data['IdentificationModule'] = this.identificationModule.toJson();
    }
    if (this.statusModule != null) {
      data['StatusModule'] = this.statusModule.toJson();
    }
    if (this.sponsorCollaboratorsModule != null) {
      data['SponsorCollaboratorsModule'] =
          this.sponsorCollaboratorsModule.toJson();
    }
    if (this.oversightModule != null) {
      data['OversightModule'] = this.oversightModule.toJson();
    }
    if (this.descriptionModule != null) {
      data['DescriptionModule'] = this.descriptionModule.toJson();
    }
    if (this.conditionsModule != null) {
      data['ConditionsModule'] = this.conditionsModule.toJson();
    }
    if (this.designModule != null) {
      data['DesignModule'] = this.designModule.toJson();
    }
    if (this.armsInterventionsModule != null) {
      data['ArmsInterventionsModule'] = this.armsInterventionsModule.toJson();
    }
    if (this.outcomesModule != null) {
      data['OutcomesModule'] = this.outcomesModule.toJson();
    }
    if (this.eligibilityModule != null) {
      data['EligibilityModule'] = this.eligibilityModule.toJson();
    }
    if (this.contactsLocationsModule != null) {
      data['ContactsLocationsModule'] = this.contactsLocationsModule.toJson();
    }
    if (this.referencesModule != null) {
      data['ReferencesModule'] = this.referencesModule.toJson();
    }
    return data;
  }
}