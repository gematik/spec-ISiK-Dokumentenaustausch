## Dokumentenabfrage und -Zugriff
Für alle Interaktionen gelten die Vereinbarungen zu REST-API aus dem [ISiK Basismodul Stufe 2](https://simplifier.net/guide/ImplementierungsleitfadenISiK-Basismodul/UebergreifendeFestlegungenRest)

### Dokumentenabfrage
Dokumente können anhand ihrer Metadaten gesucht werden. Im Rahmen der ISiK-Spezifikation müssen mindestens die im Kapitel {{pagelink:DocumentReferenceInteraktionen}}
mit `MUSS` gekennzeichneten Suchparameter unterstützt werden. Einzelnen Systemen steht es frei, darüber hinaus weitere Suchparameter zu implementieren.

Es gelten die allgemeinen Festlegunen zu Suchparametern gemäß [ISiK Basisprofil Stufe 2](https://simplifier.net/guide/isik-basismodul-stufe2/UebergreifendeFestlegungenSuchparameter)

Die Ergebnisse einer Suchanfrage werden in Form eines Bundles zurückgegeben:
{{tree:https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenSuchergebnisse, hybrid}}

### Dokumentenzugriff

Das den Metadaten zugeordnete Dokument kann jeweils unter `DocumentReference.content.attachment.url` vom Server abgerufen werden.
Für den Zugriff auf das Dokument gelten die Vereinbarungen zum [Binary-Endpunkt](http://hl7.org/fhir/binary.html), insbesondere bezüglich des Verhaltens bei der [Bereitstellung 
der Daten über die RESTful-API](http://hl7.org/fhir/binary.html#rest):
* Wenn der Zugriff mit dem Accept-Header `application/fhir+xml` oder `application/fhir+json` erfolgt, müssen die Daten als Binary-Ressource im angeforderten Format zurückgegeben werden.
* Wenn der Zugriff mit einem *anderen* Accept-Header als `application/fhir+xml` oder `application/fhir+json` erfolgt, so soll das Dokument im angeforderten Format zurückgegeben werden,
z.B. MUSS bei Zugriffen mit Accept-Header `application/pdf` das Dokument unmittelbar als PDF zurückgegeben werden, sofern dies dem Content-Type der Binary-Ressource entspricht.

