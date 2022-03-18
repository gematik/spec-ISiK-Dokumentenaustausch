## Dokumentenabfrage und -Zugriff
Für alle Interaktionen gelten die Vereinbarungen zu REST-API aus dem [ISiK Basismodul Stufe 2](https://simplifier.net/guide/isik-basismodul-stufe2/UebergreifendeFestlegungenRest)

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

<!-- FHIR-native Systeme werden das Dokument präferiert über einen [Binary-Endpunkt](http://hl7.org/fhir/binary.html) bereitstellen. Dieser verfügt über folgende Besonderheit:

* Wenn der Zugriff mit dem Accept-Header `application/fhir+xml` oder `application/fhir+json` erfolgt, müssen die Daten als Binary-Ressource im angeforderten Format zurückgegeben werden.
* Wenn der Zugriff mit einem *anderen* Accept-Header als `application/fhir+xml` oder `application/fhir+json` erfolgt, so soll das Dokument im angeforderten Format zurückgegeben werden,
z.B. MUSS bei Zugriffen mit Accept-Header `application/pdf` das Dokument unmittelbar als PDF zurückgegeben werden, sofern dies dem Content-Type der Binary-Ressource entspricht.

Da es sich bei der Verlinkung via `DocumentReference.content.attachment.url` nicht um einen `Reference`-Datentyp im Sinne von FHIR handelt, gelten hier nicht die Gesetzmäßigkeites eines FHIR.Endpunktes. Wenn das Dokument über einen Binary-Endpunkt bereitgestellt wird udn folglich in verschiedenen Formaten (z.B. XML, JSON und nativ) abrufbar ist, so muss für jede verfügbare Repräsentation des Dokumentes ein separater DocumentReference.content-Knoten mit enstprechendem `content.attachment.contentType`-Code angelegt werden. Diese referenzieren dann jeweils auf die Binary-Ressource mit angehängtem [`_format`-Parameter](http://hl7.org/fhir/http.html#parameters).

Siehe hierzu auch die [entsprechende Diskussion in der Internationalen FHIR-Community](https://chat.fhir.org/#narrow/stream/179166-implementers/topic/Attachment.2EcontentType.20for.20FHIR) -->

