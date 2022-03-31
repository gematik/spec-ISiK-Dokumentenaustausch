Instance: SubmitDocument
InstanceOf: OperationDefinition
Usage: #example
Title: "submit-document"
Description: ""
* insert Meta-Inst
* url = "https://gematik.de/fhir/ISiK/v2/OperationDefinition/SubmitDocument"
* title = "Submission of new document"
//* status = #draft
* kind = #operation
* name = "submit-document"
* description = "Submit document metadata and payload to a server for storage/persistence."
* purpose = "Using Operations instead of transaction Bundles allows for refined server side 
    logic beyond create/update to occur and simplifies client control"
* code = #submit-document
* comment = "
    Expected behaviour:

* Servers SHALL store the submitted binary with the associated metadata and make it available through the FHIR API
* If the submission contains a structured FHIR document-Bundle, Servers MAY chose to store additional representations of the document,
e.g. native FHIR (XML and/or JSON) for FHIR aware Clients and/or an HTML-Document representing the document's narrative to allow easy read access for FHIR agnostic clients. 
The Binary representation mostly serves the purpose of archiving an immutable version of the document, rather than making it available to other consumers!
If Servers can provide multiple representations of the same document, this SHOULD be reflected in multiple `content`-elements in the DocumentReference with the respective mime-type.
* If a Client submits a DocumentReference which includes a `relatesTo`-Element, the Server SHALL process the submission in accordance with `relatesTo.code` as either a 
replacement, transformation, appendix or a signature of the document referenced in `relatesTo.target`. If applicable, Servers SHALL update 
the `status` of the related DocumentReference to `superseded`. 
* Servers SHALL return HTTP 412 (precondition failed) the `relatesTo.target` reference does not resolve on the server.
* Servers SHALL ignore any information submitted by the Client in `DocumentReference.content.attachment.url` and assume the content to be the Binary submitted with the `payload`parameter.
* Servers SHALL adjust the `content`-element to reflect how and where the document has been stored by the server.
"
//* resource = DocumentReference
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SubmitDocumentInput)
* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #metadata (exactly)
  * use = #in 
  * min = 1
  * max = "1"
  * documentation = "DocumentReference containing document metadata"
  * type = #DocumentReference
* parameter[+]
  * name = #payload (exactly)
  * use = #in 
  * min = 1
  * max = "1"
  * documentation = "Binary containing document payload"
  * type = #Binary
* parameter[+]
  * name = #output-metadata
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "DocumentReference as persisted by the server"
  * type = #DocumentReference
* parameter[+]
  * name = #information (exactly) 
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "Additional information and/or warnings  about the operation the server whishes to convey to the client"
  * type = #OperationOutcome

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
  * name = "metadata" (exactly)
  * resource 1..1 MS
  * resource only ISiKDokumentenMetadaten
    * ^short = "Dokumentenmetadaten als Document-Ressource"
    * content ..1
* parameter[payload]
  * ^short = "das Dokument"
  * ^definition = "Das Dokument (z.B. PDF, DOC, JPEG etc.) base64-codiert eingebettet in eine Binary-Ressource"
  * name MS 
    * ^short = "Name des Parameters"
  * name = "payload" (exactly)
  * resource 1..1 MS
  * resource only ISiKBinary
    * ^short = "Dokument als Binary-Ressource"



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



