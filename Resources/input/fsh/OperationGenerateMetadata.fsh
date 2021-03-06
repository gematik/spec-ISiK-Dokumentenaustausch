Instance: GenerateMetadata
InstanceOf: OperationDefinition
Usage: #example
Title: "generate-metadata"
Description: ""
* insert Meta-Inst
* url = "https://gematik.de/fhir/isik/v2/Dokumentenaustausch/OperationDefinition/GenerateMetadata"
* title = "Generation of DocumentReference from structured Documents"
//* status = #draft
* kind = #operation
* name = "GenerateMetadata"
* description = "Generate Document metadata (DocumentReference) from structured FHIR and non-FHIR-Documents"
* purpose = "Using Operations instead of transaction Bundles allows for refined server side 
    logic beyond create/update to occur and simplifies client control"
* code = #generate-metadata
* comment = "
    Expected behaviour:
* Servers SHALL create DocumentReference Resources from the Bundle provided through the 'fhir.document' parameter by 
 mapping the metadata fields from the Composition in the document Bundle according to the [Composition-DocumentReference.Mapping](http://hl7.org/fhir/composition-mappings.html#fhirdocumentreference)
* Servers SHALL attempt to match the target of Composition.subject to an existing Resource on it's own endpoint
 and populate DocumentReference.subject.reference accordingly.
* If no matching target id found, the Server SHALL reply with HTTP 412 (precondition failed) and return an OperationOutcome

* Servers MAY attempt to resolve additional references, such as Composition.author, Composition.encounter etc.

* Servers MAY allow clients to redirect any attempts to find matches to another endpoint. This is especially helpful, 
when the $generate-metadata operation is provided by a third party other than the document's intended destination server.

* Servers MAY offer additional mapping services for non-fhir-documents although these may need more advanced mapping/business logic,
terminology mapping services and more complex patient matching. If they offer additional non-fhir mapping capabilities, 
Servers SHOULD expose a derived OperationDefinition in their CapabilityStatment, which clearly defines the acceptable `non-fhir-document-types`.

* Clients SHOULD populate `non-fhir-document-type` with a code acceptable to the server, when submitting `non-fhir-document`s
"
* resource = #DocumentReference
* system = false
* type = true
* instance = false
* inputProfile = Canonical(GenerateMetadataInput)
* outputProfile = Canonical(GenerateMetadataOutput)
* parameter[+]
  * name = #fhir-document
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "FHIR document Bundle"
  * type = #Bundle
* parameter[+]
  * name = #non-fhir-document
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "non FHIR structured document or other document metadata source"
  * type = #Binary
* parameter[+]
  * name = #non-fhir-document-type
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "type of submitted non fhir document"
  * type = #code
* parameter[+]
  * name = #target-endpoint
  * use = #in 
  * min = 0
  * max = "1"
  * documentation = "fhir endpoint on which matches for Patient (and other items) are searched"
  * type = #uri
* parameter[+]
  * name = #output-metadata
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "DocumentReference created based on the submitted input"
  * type = #DocumentReference
* parameter[+]
  * name = #information (exactly) 
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "Additional information and/or warnings  about the operation the server whishes to convey to the client"
  * type = #OperationOutcome