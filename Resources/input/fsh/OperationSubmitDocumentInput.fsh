Profile: SubmitDocumentInput
Parent: Parameters
Id: SubmitDocumentInput
Title: "SubmitDocumentInput"
Description: "Profil zur Validierung der Input-Parameter für $submit-document"
* insert Meta
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains metadata 1..1 MS 
    and payload 1..1 MS
* parameter[metadata]
  * ^short = "Dokumentenmetadaten in Form einer DocumentReference-Ressource"
  * ^comment = "..."
  * name MS 
    * ^short = "Name des Parameters"
    * ^comment = "=metadata"
  * name = "metadata" (exactly)
  * resource 1..1 MS
  * resource only ISiKDokumentenMetadaten
    * ^short = "Resource vom Typ `DocumentReference`"
    * content ..1

Instance: submit-document-in-params
InstanceOf: SubmitDocumentInput
Usage: #example
Title: "submit-document-in-params"
Description: ""
* parameter[+]
  * name = "metadata"
  * resource = dok-beispiel-client