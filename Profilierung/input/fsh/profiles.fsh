
Profile: ISiKDokumentenMetadaten
Parent: DocumentReference
Id: ISiKDokumentenMetadaten
Title: "Erforderliche Metadaten für Dokumentenaustausch in ISiK"
//constraints minimal
* modifierExtension ..0
* masterIdentifier 1..
* identifier 1..
* docStatus ..0
* type MS
* type from http://ihe-d.de/ValueSets/IHEXDStypeCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* category ..1 MS
* category from http://ihe-d.de/ValueSets/IHEXDSclassCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* subject only Reference(Patient)
* subject 1..1 MS
* date MS
* author MS
* custodian ..0
* relatesTo MS
* securityLabel MS
* securityLabel from http://ihe-d.de/ValueSets/IHEXDSconfidentialityCode (extensible)
* content ..1
* content.attachment.contentType 1..
* content.attachment.language MS
* content.attachment.data ..0
* content.attachment.url 1..
* content.attachment.creation MS
* content.format MS
* content.format from http://ihe-d.de/ValueSets/IHEXDSformatCodeDE (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"  
* context.encounter ..1 MS
* context.event from http://ihe-d.de/ValueSets/IHEXDSeventCodeList (preferred)
* context.event from http://dvmd.de/fhir/ValueSet/kdl (preferred)
  * ^comment = "Encounter-Verbot muss aufgehoben werden!"
* context.period MS
* context.facilityType MS
* context.facilityType from http://ihe-d.de/ValueSets/IHEXDShealthcareFacilityTypeCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* context.practiceSetting MS
* context.practiceSetting from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* context.sourcePatientInfo MS
//constraints comprehensive
* type 1..
* category 1..
* date 1..
* securityLabel 1..
* content.attachment.language 1..
* content.attachment.creation 1..
* content.format 1..
* context 1..
* context.facilityType 1..
* context.practiceSetting 1..
* context.sourcePatientInfo 1..



Profile: ISiKDokumentenSuchergebnisse
Parent: Bundle
Id: ISiKDokumentenSuchergebnisse
Title: "Suchergebnisse einer Dokumentensuche"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ComprehensiveDocumentReference



