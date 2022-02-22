Profile: ISiKStrukturiertesDokument
Parent: Composition
Id: ISiKStrukturiertesDokument
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines strukturierten Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* insert Meta
* id 1..
* text 1.. MS
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1..
  * system 1..
  * value 1..
* status = #final (exactly)
* type.coding 1..
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    KDL 1..1 and
    XDS 1..1 and 
    LOINC 0..1
* type.coding[LOINC] = $loinc#55112-7
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1..
    * obeys kdl-1
* type.coding[XDS] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains
    XDS 1..1 and
    LOINC 0..1 
* category.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* category.coding[XDS].
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
  * code 1..
* subject 1.. MS
* subject only Reference(ISiKPatient)
  * reference 1.. MS
* encounter 1.. MS
* encounter only Reference(ISiKKontaktGesundheitseinrichtung)
  * reference 1.. MS
* date MS
* author only Reference(PractitionerRole or Device or Organization or ISiKAngehoeriger or ISiKPatient or ISiKPersonImGesundheitsberuf)
  * display 1.. MS
* title 1..1 MS
* section 1.. MS
  * title 1.. MS
  * text 1.. MS
  * section MS


Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('[A-Z]{2}[0-9]{6}')"
