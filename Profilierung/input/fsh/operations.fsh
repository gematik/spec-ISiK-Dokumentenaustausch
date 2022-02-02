Instance: submit-document
InstanceOf: OperationDefinition
Usage: #example
Title: "submit-document"
Description: ""
* title = "Submission of new document"
* status = #draft
* kind = #operation
* name = "submit-document"
* description = "Submits a new document with metadata to a server for storage."
* purpose = "Using Operations instead of transaction Bundles allows for refined server side 
    logic to happen and simplifies client control"
* code = #submit-document
* comment = "Servers are expected to verify the uniqueness of DocumentReference.identifier on the server
    and check referntial integrity of metadata and attachment as submitted by the client.
    Servers should return HTTP 412 (precondifion failed) if the DocumentReference.identifier is not unique
    Servers SHALL return HTTP 412 (precondition failed) if the DocumentReference.attachment.url is not resolveable within the submitted Parameters resource"
//* resource = DocumentReference
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SubmitDocumentInput)
//* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #mode
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "determines the mode (create/update) in which the server processes the document"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = Canonical(SubmitDocumentModes)
* parameter[+]
  * name = #metadata
  * use = #in 
  * min = 1
  * max = "1"
  * documentation = "DocumentReference containing document metadata"
  * type = #DocumentReference
* parameter[+]
  * name = #payload
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "document payload, optional on update mode"
  * type = #Binary




Profile: SubmitDocumentInput
Parent: Parameters
Id: SubmitDocumentInput
Title: "SubmitDocumentInput"
Description: ""
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains mode 1..1 MS and metadata 1..1 MS and payload 0..1 MS
* parameter[mode]
  * name = "mode"
  * value[x] only code
  * valueCode from SubmitDocumentModes
* parameter[metadata]
  * name = "metadata"
  * resource only ISiKDokumentenMetadaten
* parameter[payload]
  * name = "payxload"
  * resource only Binary



ValueSet: SubmitDocumentModes
Id: SubmitDocumentModes
Title: "SubmitDocumentModes"
Description: ""
* http://hl7.org/fhir/restful-interaction#create "create"
* http://hl7.org/fhir/restful-interaction#update "update"




