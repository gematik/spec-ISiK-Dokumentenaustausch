Profile: SubmitDocumentOutput
Parent: Parameters
Id: SubmitDocumentOutput
Title: "SubmitDocumentOutput"
Description: "Profil zur Validierung der Output-Parameter für $submit-document"
* insert Meta
* parameter 1..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains output-metadata 1..1 MS and information 0..1  
* parameter[output-metadata]
  * ^short = "Dokumentenmetadaten wie sie vom Server verstanden/persistiert wurden"
  * ^comment = "..."
  * name MS 
    * ^short = "Name des Parameters"
  * name = "output-metadata" (exactly)
  * resource only ISiKDokumentenMetadaten
  * resource.id 1..1 MS
* parameter[information]
  * ^short = "Informationen/Hinweise zum Ergebnis der Operation"
  * ^comment = "..."
  * name MS 
    * ^short = "Name des Parameters"
  * name = "information" (exactly)
  * resource only OperationOutcome

Instance: submit-document-out-params
InstanceOf: SubmitDocumentOutput
Usage: #example
Title: "submit-document-out-params"
Description: ""
* parameter[+]
  * name = "output-metadata"
  * resource = dok-beispiel-server
    * id = "123456789"
    * content.attachment.url = "http://mein-dokumentenserver/dokumente/1231232312.pdf"
* parameter[+]
  * name = "information"
  * resource = oo-beispiel

Instance: oo-beispiel
InstanceOf: OperationOutcome
Usage: #example
Title: "oo-beispiel"
* issue
  * severity = #information
  * code = #informational
  * diagnostics = "Well done!"