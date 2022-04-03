## Dokumentenabfrage und -Zugriff

### Dokumentenabfrage
Dokumente können anhand ihrer Metadaten gesucht werden. Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel {{pagelink:DocumentReferenceInteraktionen}}
mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme Suchparameter zu implementieren.

Es gelten die allgemeinen Festlegunen zu Suchparametern gemäß [ISiK Basisprofil Stufe 2](https://simplifier.net/guide/isik-basismodul-stufe2/UebergreifendeFestlegungenSuchparameter)

Die Ergebnisse einer Suchanfrage werden in Form eines Bundles zurückgegeben:
{{tree:https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenSuchergebnisse, hybrid}}


Beispiele:
* Suche anhand von Patientenkontext (PID) und Dokumentendatum:
  `[base]/DocumentReference?patient.identifier=1234&creation=gt2021-10-06`
* Suche nach vorläufigen Endoskopiebefunden (anhand KDL-Dokumenttyp und `docStatus`):
  `[base]/DocumentReference?type=http://dvmd.de/fhir/CodeSystem/kdl|DG02010&doc-status=preliminary`
* Suche von Dokumenten anhand der Nummer des Abrechnungsfalles:
  `[base]/DocumentReference?encounter.account:identifier=56789`

### Dokumentenzugriff

Das den Metadaten zugeordnete Dokument kann jeweils unter `DocumentReference.content.attachment.url` vom Server abgerufen werden.
Es gelten die Festlegungen gem. [IHE ITI-68: Retrieve Document](https://profiles.ihe.net/ITI/MHD/ITI-68.html#236841-retrieve-document-request-message)

Der einzige MIME-Type, den alle Dokumentenserver verpflichtend zurückgeben können MÜSSEN ist der MIME Type, der dem `DocumentReference.content.attachment.contentType` entspricht.

Dokumentenserver SOLLEN das Dokument präferiert über einen [Binary-Endpunkt](http://hl7.org/fhir/binary.html) bereitstellen. Dieser verfügt über folgende Besonderheit:

* Wenn der Zugriff mit dem Accept-Header `application/fhir+xml` oder `application/fhir+json` erfolgt, müssen die Daten als Binary-Ressource im angeforderten Format zurückgegeben werden.
* Wenn der Zugriff mit einem *anderen* Accept-Header als `application/fhir+xml` oder `application/fhir+json` erfolgt, so soll das Dokument im angeforderten Format zurückgegeben werden,
z.B. MUSS bei Zugriffen mit Accept-Header `application/pdf` das Dokument unmittelbar als PDF zurückgegeben werden, sofern dies dem Content-Type der Binary-Ressource entspricht.