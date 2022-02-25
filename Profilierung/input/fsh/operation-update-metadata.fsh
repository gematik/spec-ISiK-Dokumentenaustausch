Instance: UpdateMetadata
InstanceOf: OperationDefinition
Usage: #example
Title: "update-metadata"
Description: ""
* insert Meta-Inst
* url = "https://gematik.de/fhir/ISiK/v2/OperationDefinition/UpdateMetadata"
* title = "Update document metadata"
//* status = #draft
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

