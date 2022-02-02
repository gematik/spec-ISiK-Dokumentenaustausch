Instance: submit-document
InstanceOf: OperationDefinition
Usage: #example
Title: "submit-document"
Description: ""
* title = "Submission of new document"
* status = #draft
* kind = #operation
* name = "submit-document"
* description = "Submit document metadata and payload to a server for storage/persistence."
* purpose = "Using Operations instead of transaction Bundles allows for refined server side 
    logic beyond create/update to occur and simplifies client control"
* code = #submit-document
* comment = "
    Expected behaviour:

**mode `create`:**
* Servers are expected to store the submitted binary with the associated metadata and make it available through the FHIR API
* Servers SHALL return HTTP 412 (precondifion failed) if the DocumentReference.identifier is not unique on the server (already associated with another document)
* Servers SHALL return HTTP 412 (precondition failed) if the DocumentReference.attachment.url is not resolveable within the submitted Parameters resource
    
**mode `update`:**

* Clients SHALL submit a DocumentReference which includes a `relatesTo`-Element with `relatesTo.code` set to `replaces` and `relatesTo.target` referencing the superseded DocumentReference on the server.
* Servers are expected to either replace the previous version of the DocumentReference **or** create a new version and deprecate the old version by updateing it`s `status` to `superseded`.
* Servers SHALL check, if the DocumentReference.identifier of the submitted DocumentReference and the referenced DocumentReference are identical
* Servers SHALL either return HTTP 412 (precondition failed) **or** treat the update as a create if the referenced DocumentReference does not exist on the server.
If the server decides to perform a create instead of an update, the invalid relatesTo-Element MAY be removed from the DocumentReference in order to maintain referential integrity.

**metadata update only:**
* On update, Clients MAY submit DocumentReference Resources without a Binary, if the Document content is unchanged.
* Servers SHALL return HTTP 412 (precondition failed) if the Binary referenced in DocumentReference.attachment.url does not exist on the server.
* Servers SHALL return HTTP 412 (precondition failed) if the DocumentReference.attachment.url in the submitted DocumentReference and the superseded DocumentReference do not match. 
"
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
  * documentation = "Binary containing document payload, optional on update mode"
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




