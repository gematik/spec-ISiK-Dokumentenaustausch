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

**mode `create`:**
* Servers are expected to store the submitted binary with the associated metadata and make it available through the FHIR API
* Servers SHALL return HTTP 412 (precondifion failed) if the DocumentReference.identifier is not unique on the server (already associated with another document)
* Servers SHALL return HTTP 412 (precondition failed) if the DocumentReference.attachment.url is not resolveable within the submitted Parameters resource
    
**mode `replaces`:**

* Clients SHALL submit a DocumentReference which includes a `relatesTo`-Element with `relatesTo.code` set to `replaces` and `relatesTo.target` referencing the superseded DocumentReference on the server.
* Servers are expected to either replace the previous version of the DocumentReference **or** create a new version and deprecate the old version by updating it's `status` to `superseded`.
* Servers SHALL check, if the DocumentReference.identifier of the submitted DocumentReference and the referenced DocumentReference are identical
* Servers SHALL either return HTTP 412 (precondition failed) **or** treat the update as a create if the referenced DocumentReference does not yet exist on the server.
If the server decides to perform a create instead of an update, the invalid relatesTo-Element MAY be removed from the DocumentReference in order to maintain referential integrity.
"
//* resource = DocumentReference
* system = true
* type = false
* instance = false
* inputProfile = Canonical(SubmitDocumentInput)
* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #input-mode
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "determines the mode (create/update) in which the client wants the server to processes the document"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = Canonical(SubmitDocumentModes)
* parameter[+]
  * name = #input-metadata
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "DocumentReference containing document metadata"
  * type = #DocumentReference
* parameter[+]
  * name = #payloadBinary
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "Binary containing document payload"
  * type = #Binary
* parameter[+]
  * name = #payloadBundle
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "Bundle containing FHIR document"
  * type = #Bundle
* parameter[+]
  * name = #output-mode
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "determines the mode (create/update) in which the server actually processed the document"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = Canonical(SubmitDocumentModes)
* parameter[+]
  * name = #output-metadata
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "DocumentReference as persisted by the server"
  * type = #DocumentReference

Profile: SubmitDocumentInput
Parent: Parameters
Id: SubmitDocumentInput
Title: "SubmitDocumentInput"
Description: "Profil zur Validierung der Input-Parameter für $submit-document"
* insert Meta
* obeys sub-in-1
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains input-mode 0..1 MS 
    and input-metadata 1..1 MS 
    and payloadBinary 0..1 MS
    and payloadBundle 0..1 MS
* parameter[input-mode]
  * name = "input-mode"
  * value[x] only code
  * valueCode from SubmitDocumentModes
* parameter[input-metadata]
  * ^short = "Dokumentenmetadaten in Form einer DocumentReference-Ressource"
  * ^comment = "..."
  * name = "input-metadata"
  * resource only ISiKDokumentenMetadaten
* parameter[payloadBinary]
  * ^short = "unstrukturiertes oder nicht FHIR-basiertes Dokument"
  * ^definition = "Wenn ein unstrukturiertes oder nicht FHIR-basiertes Dokument (z.B. PDF, Word, CDA) übermittelt werden soll, dann muss dieses im Parameter `payloadBundle` übermittelt werden"
  * name = "payloadBinary"
  * resource only Binary
* parameter[payloadBundle]
  * ^short = "strukturiertes, FHIR-basiertes Dokument"
  * ^definition = "Wenn ein strukturiertes, FHIR-basiertes Dokument (Bundle vom Typ `document`) übermittelt werden soll, dann muss dieses im Parameter `payloadBundle` übermittelt werden"
  * name = "payloadBundle"
  * resource only Bundle
  * resource.type = #document


Profile: SubmitDocumentOutput
Parent: Parameters
Id: SubmitDocumentOutput
Title: "SubmitDocumentOutput"
Description: "Profil zur Validierung der Output-Parameter für $submit-document"
* insert Meta
* parameter 2..2 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains output-mode 1..1 MS 
    and output-metadata 1..1 MS 
* parameter[output-mode]
  * ^short = "Verarbeitungsmodus der vom Server verwendet wurde"
  * name = "output-mode"
  * value[x] only code
  * valueCode from SubmitDocumentModes
* parameter[output-metadata]
  * ^short = "Dokumentenmetadaten wie sie vom Server verstanden/persistiert wurden"
  * ^comment = "..."
  * name = "output-metadata"
  * resource only ISiKDokumentenMetadaten
  * resource.id 1..1 MS


Invariant: sub-in-1
Description: "Es muss entweder ein Payload vom Typ Binary oder vom Typ Bundle übermittelt werden!"
Expression: "parameter.where(name= 'payloadBinary').exists() xor parameter.ahere(name='payloadBundle').exists()"
Severity: #error

