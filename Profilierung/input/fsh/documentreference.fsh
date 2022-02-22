
Profile: ISiKDokumentenMetadaten
Parent: DocumentReference
Id: ISiKDokumentenMetadaten
Title: "Erforderliche Metadaten für Dokumentenaustausch in ISiK"
* insert Meta
* masterIdentifier 1.. MS
  * ^short = "Versionsspezifische OID des Dokumentes"
  * system 1..1 MS
  * system = "urn:ietf:rfc:3986"
    * ^short = "Namensraum des Identifiers"
    * ^comment = "Fix: `urn:ietf:rfc:3986`"
  * value 1..1 MS
    * ^short = "Wert des Identifiers"
    * ^comment = "OID mit URI-Präfix &quot;urn:oid:&quot;"
//* identifier 1..* MS
* identifier ^comment = "Abweichend zu MHD V4.0.1 ist die Angabe eines Identifiers in ISiK nicht erforderlich.
Ein solcher kann bei Bedarf (z.B. zur Weitergabe des Dokumentes per XDS) erzeugt werden.
&#13;[Konsens der Arbeitsgruppe vom 12.11.2021]"
* status MS
  * ^short = "Status des Dokumentenmetadatensatzes" 
  * ^comment = "Der Status des Dokumentes wird in DocumentReference.docStatus gesetzt!"
* docStatus 0..1 MS
  * ^short = "Bearbeitungsstatus des Dokumentes"
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von docStatus im ISiK-Kontext erlaubt. Doe Verwendung von docStatus bleibt jedoch optional, 
  da nicht alle Dokumentenerzeugende Systeme einen expliziten Freigabe-Workflow haben. Dekomentenserver müssen jedoch in der Lage sein, den Dokumentenstatus 
  - sofern vorhanden - zu persistieren, anzuzeigen und zu reproduzieren.
  &#13;[Konsens der Arbeitsgruppe vom 10.12.2021]"
* type 1.. MS
  * ^short = "Dokumententyp"
  * ^comment = "Im ISiK-Kontext ist die Typisierung eines Dokumentes mit Hilfe eines KDL-Codes *und* des IHE-XDS-Type-Codes erforderlich. 
  Während ersterer eine feingranulare Dokumentenklassifikation für die gezielte Suche nach medizinischen udn Administrativen Dokumenten ermöglicht, 
  ist letzterer für den einrichtungsübergreifenden Dokumentenautausch maßgeblich.
  Der XDS-Type-Code kann mit Hilfe der bereitgestellten [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap)
  aus dem KDL-Code ermittelt werden. Weitere Typisierungen (z.B. nach SNOMED oder LOINC) sind uneingeschränkt erlaubt.

  [Konsens der Arbeitgruppe vom 18.02.2022]"
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains  KDL 1..1 MS and XDS 1..1 
* type.coding[XDS] from http://ihe-d.de/ValueSets/IHEXDStypeCode (required)
  * ^short = "Dokumenttyp gem. IHE-De-Terminologie"
  * ^comment = "Der XDS-Type-Code kann über die im Rahmen der [KDL-Spezifikation](https://simplifier.net/kdl) publizierten 
  [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap) aus dem KDL-Code ermittelt werden"
* type.coding[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required)  
  * ^short = "Dokumenttyp gem. KDL-Terminologie"
  * system 1..1 MS
  * system = "http://dvmd.de/fhir/CodeSystem/kdl"
    * ^short = "Kodiersystem"
    * ^comment = "Fix: &quot;http://dvmd.de/fhir/CodeSystem/kdl&quot;"
  * code 1..1 MS
    * ^short = "Code"
    * ^comment = "Der KDL-Code"
  * display 1..1 MS
    * ^short = "Anzeigetext"
    * ^comment = "Der Anzeigetext zum KDL-Code"
* category 1..1 
  * ^short = "Dokumentklasse/-Kategorie"
  * ^comment = "Die Kategorisierung von Dokumenten erfolgt mittels der von IHE Deutschland publizierten XDS-Class-Codes.
  Der XDS-Class-Code kann mit Hilfe der bereitgestellten [ConceptMap](https://simplifier.net/kdl/~resources?category=ConceptMap)
  aus dem KDL-Code ermittelt werden."
* category from http://ihe-d.de/ValueSets/IHEXDSclassCode (required)
* category.coding
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains XDS 1..1 MS
* category.coding[XDS]
  * system 1..1 MS
    * ^short = "Kodiersystem"
  * code 1..1 MS
    * ^short = "Code"
    * ^comment = "Der XDS-Class-Code"
  * display 1..1 MS
    * ^short = "Anzeigetext"
    * ^comment = "Der Anzeigetext zum XDS-Class-Code"
* subject only Reference(Patient)
* subject 1..1 MS
  * ^short = "Patientenbezug des Dokumentes"
  * ^comment = "Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.subject)"
  * reference 1..1 MS
    * ^short = "Absolute oder relative URL des Patienten auf dem Server"
    * ^comment = "Absolute oder relative URL des Patienten auf dem Server"
* date 
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von date im ISiK-Kontext nicht verpflichtend. 
Die Motivation für die verbindliche Verwendung von `date` seitens IHE ist nicht nachvollziehbar. 
Ein entsprechender Change Request zur Harmonisierung wurde eingereicht. Das Dokumentendatum wird in attachment.creation gesetzt."
* author MS
* custodian ..0
  * ^comment = "Einschränkung der Kardinalität analog MHD V4.0.1"
* description 1..1 MS
  * ^comment = "Genaue menschenlesbare Beschreibung des Dokumentes, z.B. &quot;Lungenfunktionstest vom 18.02.2022&quot;"
* relatesTo MS
* securityLabel 1.. MS
* securityLabel from ISiKConfidentialityCodes (required)
  * ^short = "Vertraulichkeit"
  * ^comment = "Die Bereitstellung des Vertraulichkeitsinformation durch den Ersteller des Dokumentes ist verpflichtend.
Ebenso sind Dokumentenserver verpflichtet, diese Information zu persistieren und bei der Dokumentenabfrage zu reproduzieren.
Die ISiK-Spezifikation trifft jedoch keine Annahmen darüber, wie sich einzelne Vertraulichkeitsstufen auf die Zugriffsberechtigungen
verschiedener benutzer auf ein Dokument auswirken. Im ISiK-Kontext ist die Angabe einer der drei Vertraulichkeitsstufen
N | R | V verpflichtend, jedoch ohne Einschränkung der Verwendung zusätzlicher Vertraulichkeits-Flags.
&#13; 

[Konsens der Arbeitsgruppe vom 12.11.2021]"
* content ..1 MS
  * ^short = "Beschreibung des Dokumenteninhaltes"
  * attachment MS
    * ^short = "Anhang"
    * contentType 1.. MS
      * ^short = "Mimetype des Dokumentes"
      * ^comment = "Mimetype (Dateityp) des Dokumentes (z.B. &quot;application/pdf&quot;)"
    * language 1.. MS
      * ^short = "Sprache, in der das Dokument verfasst wurde."
      * ^comment = "Kann bei Systemen, die keine Mehrsprachigkeit unterstützen, 
      fest auf &quotde&quot; oder &quotde-DE&quot; gesetzt werden."
    * data ..0
      *  ^comment = "Um die Suche nach Dokumenten effizient zu gestalten, dürfen die Dokumente selbst 
      nicht in die DocumentReference eingebettet werden, sondern müssen als separates Datenobjekt referenziert werden."
    * url 1.. MS
      * ^short = "Link zum Dokument"
      * ^comment = "Link zum Dokument (als Binary-Ressource)"
    * creation 1.. MS
      * ^short = "Dokumentendatum"
      * ^comment = "Es obliegt dem erzeugenden System, zu entscheiden, 
      welches Datum als Dokumentendatum geeignet ist, z.B. Datum der Erstellung oder Datum der letzten Änderung"
  * format 1.. MS
  * format from http://ihe-d.de/ValueSets/IHEXDSformatCodeDE (required)
    * ^short = "Format des Dokumentes"
    * ^comment = "Sofern das Dokument nicht auf einem standardisierten, 
    strukturierten Austauschformat (z.B. CDA) basiert, für dessen Interpretation ein konkretes Schema herangezogen werden muss,
    genügt die Angabe des Codes 
    &quot;urn:ihe:iti:xds:2017:mimeTypeSufficient&quot;"  
* context 1.. MS
  * encounter ..1 MS
    * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung der Encounter-Referenz im ISiK-Kontext erlaubt."
  * event from http://ihe-d.de/ValueSets/IHEXDSeventCodeList (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
    * coding 1..1 
      * system 1..1 
      * code 1..1 
//  * period MS
  * facilityType 1.. MS
  * facilityType from http://ihe-d.de/ValueSets/IHEXDShealthcareFacilityTypeCode (required)
    * ^short = "Art der Einrichtung, aus der das Dokument stammt"
    * ^comment = "Kann, sofern keine abweichende Information bekannt ist auf &quot;KHS&quot; gesetzt werden."
  * practiceSetting 1.. MS
  * practiceSetting from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"



