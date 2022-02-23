Profile: ISiKStrukturiertesDokument
Parent: Composition
Id: ISiKStrukturiertesDokument
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines strukturierten Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* insert Meta
* id 1..
  * ^short = "System-interne Datensatz-ID"
* text 1.. MS
  * ^short = "menschenlesbare Repräsentation des Dokumentenkopfes (Metadaten)"
  * ^comment = "Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:
      * Composition.subject:Patient.name.family
      * Composition.subject:Patient.birthDate
      * Composition.subject:Patient.identifier:pid
      * Composition.status
      * Composition.type.text
      * Composition.date
      * Composition.title
      * Composition.author.display"
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1..
  * ^short = "versionsunabhängiger weltweit eindeutiger Identifier des Dokumentes"
  * ^comment = "Vom Dokumenten-erzeugenden system zugewiesener Identifier des Dokumentes mit Angabe der URL des vom Subsystem verwendeten Namensraumes"
  * system 1.. MS
  * value 1.. MS
* status = #final (exactly)
  * ^short = "Status des Dokumentes"
* type 1.. MS
  * ^short = "Dokumenttyp"  
* type.coding 1..
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    KDL 1..1 MS and
    XDS 1..1 MS and 
    LOINC 0..1
* type.coding[LOINC] = $loinc#55112-7
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1.. MS
    * ^short = "Namensraum des Codes"
    * ^comment = "Fix: &quot;http://dvmd.de/fhir/CodeSystem/kdl&quot;"
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1.. MS
    * ^short = "Der KDL-Code"
    * ^comment = "Es sind aussschließlich achtstellige KDL-Codes erlaubt"
    * obeys kdl-1
* type.coding[XDS] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category 1.. MS
  * ^short = "Dokumentenkategorie"
* category.coding contains
    XDS 1..1 MS and
    LOINC 0..1 
* category.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* category.coding[XDS]
  * ^short = "Dokumentenklasse nach IHE-XDS(DE)"
  * system 1.. MS
    * ^short = "Namensraum des Codes"
  * system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
  * code 1..
    * ^short = "Der XDS-Code"
* subject 1.. MS
  * ^short = "Patientenbezug des Dokumentes"
* subject only Reference(ISiKPatient)
  * reference 1.. MS
* encounter 1.. MS
  * ^short = "Fallbezug des Dokumentes"
* encounter only Reference(ISiKKontaktGesundheitseinrichtung)
  * reference 1.. MS
* date MS
  * ^short = "Datum der letzten Änderung am Dokument"
* author only Reference(PractitionerRole or Device or Organization or ISiKAngehoeriger or ISiKPatient or ISiKPersonImGesundheitsberuf)
  * ^short = "In der aktuellen Ausbaustufe von ISiK ist die Verwendung der textuellen Repräsentation (display) von Autor und Subsystem ausreichend. Die darüber hinaus gehende Verlinkung auf Practitioner bzw. Device-Ressourcen KANN implementiert werden."
  * display 1.. MS
* title 1..1 MS
  * ^short = "Dokumentenbezeichnung"
  * ^comment = "Die Dokumentenbezeichnung dient der Darstellung des Dokumentes in einer Übersicht, z.B. in einer Patientenakte, und KANN der schnellen Auffindbarkeit eines gesuchten Dokumentes dienen. Geeignete Bezeichnungen sind zum Beispiel
&quot;Kleines Blutbild vom 13.10.2020&quot;
&quot;Pathologiebefund (Abstrich) vom 13.10.2020&quot;
&quot;Blutgasmessung vom 13.10.2020 14:14h&quot;"
* section 1.. MS
  * ^short = "Inhalt des Dokumentes unterteilt in Kapitel"
  * title 1.. MS
    * ^short = "Kapitelüberschrift"
  * text 1.. MS
    * ^short = "menschenlesbare Repräsentation des Inhalts eines Kapitels"
    * ^comment = "Für Aggregation einer vollständigen menschenlesbaren Repräsentation MÜSSEN die Repräsentationen der einzelnen Kapitel an die Repräsentation der Metadaten (Composition.text) angehängt werden. Für die Separierung KÖNNEN einfache <div>-Tags verwendet werden. Es ist zu beachten, dass Kapitel auch Unterkapitel enthalten KÖNNEN (Composition.section.section), die bei der Aggregation entsprechend berücksichtigt werden MÜSSEN.

          Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:

          section.title + Freitext oder
          section.title + Resource.text der referenzierten Ressource oder
          section.title + eine aggregierte Repräsentation von Resource.text wenn in einer Section mehrere Ressourcen referenziert werden."
  * section MS
    * ^short = "Unterkapitel"



Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('[A-Z]{2}[0-9]{6}')"
