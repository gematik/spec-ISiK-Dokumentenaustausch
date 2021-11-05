
Profile: ISiKDokumentenMetadaten
Parent: DocumentReference
Id: ISiKDokumentenMetadaten
Title: "Erforderliche Metadaten für Dokumentenaustausch in ISiK"
* modifierExtension ..0
* masterIdentifier 1.. MS
* identifier 1.. MS
* status MS
* docStatus 
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von docStatus im ISiK-Kontext erlaubt."
* type 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type contains XDS 1..1 MS and KDL 0..1 MS
* type[XDS] from http://ihe-d.de/ValueSets/IHEXDStypeCode (required)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
  * coding 1..1 MS
    * system 1..1 MS
    * code 1..1 MS
* type[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required) 
  * coding 1..1 MS
    * system 1..1 MS
    * system = "http://dvmd.de/fhir/CodeSystem/kdl"
    * code 1..1 MS
* category 1..1 MS
* category from http://ihe-d.de/ValueSets/IHEXDSclassCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* subject only Reference(Patient)
* subject 1..1 MS
//* date MS 
* author MS
* custodian ..0
* relatesTo MS
* securityLabel 1.. MS
* securityLabel from http://ihe-d.de/ValueSets/IHEXDSconfidentialityCode (extensible)
* content ..1 MS
  * attachment MS
    * contentType 1.. MS
    * language 1.. MS
    * data ..0
    * url 1..
    * creation 1.. MS
  * format 1.. MS
  * format from http://ihe-d.de/ValueSets/IHEXDSformatCodeDE (preferred)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"  
* context 1.. MS
  * encounter ..1 MS
    * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung der Encounter-Referenz im ISiK-Kontext erlaubt."
  
  * event 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * event contains XDS 1..1 MS and KDL 0..1 MS
  * event[XDS] from http://ihe-d.de/ValueSets/IHEXDSeventCodeList (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
    * coding 1..1 MS
      * system 1..1 MS
      * code 1..1 MS
  * event[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required) 
    * coding 1..1 MS
      * system 1..1 MS
      * system = "http://dvmd.de/fhir/CodeSystem/kdl"
      * code 1..1 MS
  * period MS
  * facilityType 1.. MS
  * facilityType from http://ihe-d.de/ValueSets/IHEXDShealthcareFacilityTypeCode (preferred)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
  * practiceSetting 1.. MS
  * practiceSetting from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (preferred)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
  * sourcePatientInfo 1.. MS


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
* entry[DocumentReference].resource only ISiKDokumentenMetadaten



