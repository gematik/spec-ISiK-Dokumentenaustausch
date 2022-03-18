
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


Invariant: ISiK-docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"

/* Profile: ISiKDokumentenBereitstellung
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
    DocumentReference 1..* and
    Binary 1..* and
    Patient 0..1
* entry[DocumentReference] ^short = "Die Dokumentenmetadaten"
* entry[DocumentReference] ^definition = "Metadaten des Dokumentes als DocumentReference-Ressource"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ISiKDokumentenMetadaten
* entry[DocumentReference].request 1..
* entry[DocumentReference].request.method = #POST
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
// */
