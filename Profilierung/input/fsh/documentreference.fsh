
Profile: ISiKDokumentenMetadaten
Parent: DocumentReference
Id: ISiKDokumentenMetadaten
Title: "Erforderliche Metadaten für Dokumentenaustausch in ISiK"
* masterIdentifier 1.. MS
  * ^short = "Versionsspezifische OID des Dokumentes"
  * system 1..1 MS
  * system = "urn:ietf:rfc:3986"
  * value 1..1 MS
    * ^short = "Die OID"
    * ^comment = "OID mit URI-Präfix &quot;urn:oid:&quot;"
//* identifier 1..* MS
* identifier ^comment = "Abweichend zu MHD V4.0.1 ist die Angabe eines Identifiers in ISiK nicht erforderlich.
Ein solcher kann bei Bedarf (z.B. zur Weitergabe des Dokumentes per XDS) erzeugt werden.
&lt;[Konsens der Arbeitsgruppe vom 12.11.2021]"
* status MS
  * ^short = "Status des Dokumentenmetadatensatzes (Der Status des Dokumentes wird in DocumentReference.docStatus gesetzt!)"
* docStatus 
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von docStatus im ISiK-Kontext erlaubt."
* type 1.. MS
* type.coding 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type 
  * ^short = "Dokumententyp"
  * ^comment = "Im ISiK-Kontext ist die Klassifikation eines Dokumentes mit Hilfe eines KDL-Codes erforderlich.
Dadurch entfällt die Notwendigkeit, den XDS-Class- und Type-Code in der Instanz mitzuführen, da dieser bei Bedarf anhand
der in der KDL-Spezifikation vorhandenen Mappingtabellen ermittelt werden kann.
&lt;[Konsens der Arbeitsgruppe vom 12.11.2021]"
* type.coding contains  KDL 1..1 MS and XDS 0..1 
* type.coding[XDS] from http://ihe-d.de/ValueSets/IHEXDStypeCode (required)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
  * system 1..1 MS
  * code 1..1 MS
* type.coding[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required) 
  * system 1..1 MS
  * system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * code 1..1 MS
  * display 1..1 MS
* category 0..1 
  * ^short = "Dokumentklasse oder -Kategorie"
  * ^comment = "Im ISiK-Kontext ist die Klassifikation eines Dokumentes mit Hilfe eines KDL-Codes erforderlich.
Dadurch entfällt die Notwendigkeit, den XDS-Class- und Type-Code in der Instanz mitzuführen, da dieser bei Bedarf anhand
der in der KDL-Spezifikation vorhandenen Mappingtabellen ermittelt werden kann.
&lt;[Konsens der Arbeitsgruppe vom 12.11.2021]"
* category from http://ihe-d.de/ValueSets/IHEXDSclassCode (preferred)
  * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
* subject only Reference(Patient)
* subject 1..1 MS
  * ^short = "Patientenbezug des Dokumentes"
  * ^comment = "Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.subject)"
//* date MS 
* date ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von date im ISiK-Kontext nicht verpflichtend. 
Die Motivation für die verbindliche Verwendung von `date` seitens IHE ist nicht nachvollziehbar. 
Ein entsprechender Change Request zur Harmonisierung wurde eingereicht. Das Dokumentendatum wird in attachment.creation gesetzt."
* author MS
* custodian ..0
* relatesTo MS
// Beschreibung was "MS" hier konkret bedeutet erforderlich: 
// im Rahmen des Bestätigungverfahrens: speichern und wieder zurückliefern, ggf. auch dem Benutzer anzeigen
// Binding reduzieren auf R|N|V (required)
* securityLabel 1.. MS
* securityLabel from ISiKConfidentialityCodes (required)
  * ^comment = "Die Bereitstellung des Vertraulichkeitsinformation durch den Ersteller des Dokumentes ist verpflichtend.
Ebenso sind Dokumentenserver verpflichtet, diese Information zu persistieren und bei der Dokumentenabfrage zu reproduzieren.
Die ISiK-Spezifikation trifft jedoch keine Annahmen darüber, wie sich einzelne Vertraulichkeitsstufen auf die Zugriffsberechtigungen
verschiedener benutzer auf ein Dokument auswirken. Im ISiK-Kontext ist die Angabe einer der drei Vertraulichkeitsstufen
N | R | V verpflichtend, jedoch ohne Einschränkung der Verwendung zusätzlicher Vertraulichkeits-Flags.
&lt;[Konsens der Arbeitsgruppe vom 12.11.2021]"
* content ..1 MS
  * attachment MS
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
  * period MS
  * facilityType 1.. MS
  * facilityType from http://ihe-d.de/ValueSets/IHEXDShealthcareFacilityTypeCode (required)
    * ^short = "Art der Einrichtung, aus der das Dokument stammt"
    * ^comment = "Kann, sofern keine abweichende Information bekannt ist auf &quot;KHS&quot; gesetzt werden."
  * practiceSetting 1.. MS
  * practiceSetting from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"



