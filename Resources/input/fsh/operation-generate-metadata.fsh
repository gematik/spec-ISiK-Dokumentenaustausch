Instance: GenerateMetadata
InstanceOf: OperationDefinition
Usage: #example
Title: "generate-metadata"
Description: ""
* insert Meta-Inst
* url = "https://gematik.de/fhir/ISiK/v2/OperationDefinition/GenerateMetadata"
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
  * name = #metadata
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "DocumentReference created based on the submitted input"
  * type = #DocumentReference

Profile: GenerateMetadatatInput
Parent: Parameters
Id: GenerateMetadataInput
Title: "GenerateMetadataInput"
Description: "Profil zur Validierung der Input-Parameter für $generate-metadata"
* insert Meta
* obeys gen-in-1
* obeys gen-in-2
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains fhir-document 0..1 MS 
    and non-fhir-document 0..1  
    and non-fhir-document-type 0..1 
    and target-endpoint 0..1 
* parameter[fhir-document]
  * name = "fhir-document"
  * resource 1..1 MS
  * resource only https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKBerichtBundle
* parameter[non-fhir-document]
  * name = "non-fhir-document"
  * resource 1..1 MS
  * resource only ISiKBinary
* parameter[non-fhir-document-type]
  * ^short = "genauer Typ der Dokumenttyp der Binärdaten"
  * name = "non-fhir-document-type"
  * value[x] only code
* parameter[target-endpoint]
  * ^short = "Server-Endpunkt auf dem passende Patient-/Encounter-Referenzen gesucht werden sollen. 
  Wenn der Parameter nicht gesetzt wird, verwendet der Server, der die Operation ausführt, per default den eigenen Endpunkt"
  * name = "target-endpoint"
  * value[x] only uri


Profile: GenerateMetadataOutput
Parent: Parameters
Id: GenerateMetadataOutput
Title: "GenerateMetadataOutput"
Description: "Profil zur Validierung der Output-Parameter für $generate-metadata"
* insert Meta
* parameter 1..1 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains metadata 1..1 MS
* parameter[metadata]
  * ^short = "erzeugte DocumentReference-Ressource"
  * ^comment = "..."
  * name = "metadata"
  * resource 1..1 MS
  * resource only ISiKDokumentenMetadaten
  * resource.id 1..1 MS

Invariant: gen-in-1
Description: "Es muss entweder der Parameter `fhir-document` oder der parameter `non-fhir-document` übermittelt werden!"
Expression: "parameter.where(name = 'fhir-document').exists() xor parameter.where(name='non-fhir-document').exists()"
Severity: #error

Invariant: gen-in-2
Description: "Wenn der Parameter `non-fhir-document` übermittelt wird, muss auch `non-fhir-document-type` übermittelt werden. `non-fhir-document-type` darf nicht in Verbindung mit `fhir-document` übermittelt werden."
Expression: "parameter.where(name = 'non-fhir-document').exists().not() xor parameter.where(name = 'non-fhir-document-type').exists()"
Severity: #error
