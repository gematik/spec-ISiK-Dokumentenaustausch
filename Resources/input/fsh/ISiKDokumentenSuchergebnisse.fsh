Profile: ISiKDokumentenSuchergebnisse
Parent: Bundle
Id: ISiKDokumentenSuchergebnisse
Title: "Suchergebnisse einer Dokumentensuche"
* insert Meta
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
  * type.coding[XDS] 1..1 MS
  * category.coding[XDS] 1..1 MS

Instance: Suchergebnis-Beispiel
InstanceOf: ISiKDokumentenSuchergebnisse
Usage: #example
Title: "Suchergebnis-Beispiel"
Description: ""
* total = 1
* entry.fullUrl = "http://meinfhirserver.de/DocumentReference/dok-beispiel"
* entry.resource = dok-beispiel-server
