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

Profile: SubmitDocumentInput
Parent: Parameters
Id: SubmitDocumentInput
Title: "SubmitDocumentInput"
Description: "Profil zur Validierung der Input-Parameter für $submit-document"
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains mode 1..1 MS 
    and metadata 0..1 MS 
    and payloadBinary 0..1 MS
    and payloadBundle 0..1 MS
* parameter[mode]
  * name = "mode"
  * value[x] only code
  * valueCode from SubmitDocumentModes
* parameter[metadata]
  * ^short = "Dokumentenmetadaten in Form einer DocumentReference-Ressource"
  * ^comment = "Die Metadaten können weggelassen werden, wenn es sich bei dem übermittelten Dokument um ein strukturiertes, FHIR-basiertes Dokument handelt.
    In diesem Fall kann der Server die Metadaten aus der Composition-Ressource im Bundle extrahieren."
  * name = "metadata"
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
* parameter 2..2 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains mode 1..1 MS 
    and metadata 1..1 MS 
* parameter[mode]
  * ^short = "Verarbeitungsmodus der vom Server verwendet wurde"
  * name = "mode"
  * value[x] only code
  * valueCode from SubmitDocumentModes
* parameter[metadata]
  * ^short = "Dokumentenmetadaten wie sie vom Server verstanden/erzeugt/persistiert wurden"
  * ^comment = "Die Metadaten können weggelassen werden, wenn es sich bei dem übermittelten Dokument um ein strukturiertes, FHIR-basiertes Dokument handelt.
    In diesem Fall kann der Server die Metadaten aus der Composition-Ressource im Bundle extrahieren."
  * name = "metadata"
  * resource only ISiKDokumentenMetadaten
  * resource.id 1..1 MS



ValueSet: SubmitDocumentModes
Id: SubmitDocumentModes
Title: "SubmitDocumentModes"
Description: ""
* http://hl7.org/fhir/restful-interaction#create "create"
* http://hl7.org/fhir/document-relationship-type#replaces "replaces"
//* http://hl7.org/fhir/restful-interaction#update "update"




Instance: update-metadata
InstanceOf: OperationDefinition
Usage: #example
Title: "update-metadata"
Description: ""
* title = "Update document metadata"
* status = #draft
* kind = #operation
* name = "update-metadata"
* description = "Update selected, uncritical document metadata in a save and controlled manner without having to replace the whole document"
* code = #update-metadata
* comment = "
    Expected behaviour:
Servers are expected to update the DocumentReference element(s) with the submitted values(s)
"
* resource = #DocumentReference
* system = false
* type = false
* instance = true
//* inputProfile = Canonical(UpdateMetadata)
//* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #docStatus
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "new value for element `docStatus`"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = "http://hl7.org/fhir/ValueSet/composition-status"
