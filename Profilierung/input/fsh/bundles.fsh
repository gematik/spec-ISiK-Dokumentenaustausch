
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

Profile: ISiKDokumentenBereitstellung
Parent: Bundle
Id: ISiKDokumentenBereitstellung
Title: "Bereitstellung von Dokumenten"
* type = #transaction
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry ^slicing.rules = #closed
* entry.resource MS
* entry contains
    DocumentRefs 1..* and
    Binary 1..* and
    Patient 0..1
* entry[DocumentRefs] ^short = "Die Dokumentenmetadaten"
* entry[DocumentRefs] ^definition = "Metadaten des Dokumentes als DocumentReference-Ressource"
* entry[DocumentRefs].resource 1..
* entry[DocumentRefs].resource only ISiKDokumentenMetadaten
* entry[DocumentRefs].request 1..
* entry[DocumentRefs].request.method = #POST
* entry[Binary] ^short = "Das Dokument (PDF/Doc/JPEG/TIFF...)"
* entry[Binary] ^definition = "Base64-codierte Repäsentation des Dokumentes"
* entry[Binary].resource 1..
* entry[Binary].resource only ISiKBinary
* entry[Binary].request 1..
* entry[Binary].request.method = #POST
* entry[Patient] ^short = "der Patient"
* entry[Patient] ^definition = "Stammdaten des Patienten"
* entry[Patient].resource 1..
* entry[Patient].resource only Patient
//

Profile: ISiKBinary
Parent: Binary
Id: ISiKBinary
Title: "ISiKBinary"
Description: "Base63-codiertes Dokument"
* contentType 1..1 MS
* data 1..1 MS
