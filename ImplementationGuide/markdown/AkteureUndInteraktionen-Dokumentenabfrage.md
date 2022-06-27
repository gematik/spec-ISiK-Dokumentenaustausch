## Dokumentenabfrage und -zugriff

### Dokumentenabfrage
Dokumente können anhand ihrer Metadaten gesucht werden. Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel {{pagelink:ImplementationGuide/markdown/DocumentReference_Interaktionen.md}}
mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere FHIR-konforme Suchparameter zu implementieren.

Es gelten die allgemeinen Festlegungen zu Suchparametern gemäß [ISiK Basisprofil Stufe 2](https://simplifier.net/guide/implementierungsleitfadenisik-basismodul/I-m-UebergreifendeFestlegungen-UebergreifendeFestlegungen-Suchparameter?version=current)

Die Ergebnisse einer Suchanfrage werden in Form eines Bundles zurückgegeben:
{{tree:https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse, hybrid}}

Suchergebnisse können zahlreich sein. Server MÜSSEN daher [FHIR-konformes Paging](http://hl7.org/fhir/R4/http.html#paging) unterstützen. Server KÖNNEN im SearchSet-Bundle auch Ressourcen vom Typ [OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html) mit Informationen über die Suchergebnisse zurückgeben. Diese müssen in `Bundle.entry.search.mode` mit dem Wert `outcome` gekennzeichnet sein. Die Issues im OperationOutcome dürfen nur dem Schweregrad `information` oder `warning` entsprechen.
Issues vom Schweregrad `error` oder `fatal` sind unzulässig.


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
