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
  * name MS 
    * ^short = "Name des Parameters"
  * name = "fhir-document"
  * resource 1..1 MS
  * resource only https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/ISiKBerichtBundle
* parameter[non-fhir-document]
  * name MS 
    * ^short = "Name des Parameters"
  * name = "non-fhir-document"
  * resource 1..1 MS
  * resource only ISiKBinary
* parameter[non-fhir-document-type]
  * ^short = "genauer Typ der Dokumenttyp der Binärdaten"
  * name MS 
    * ^short = "Name des Parameters"
  * name = "non-fhir-document-type"
  * value[x] 1..1 MS
  * value[x] only code
* parameter[target-endpoint]
  * ^short = "Server-Endpunkt auf dem passende Patient-/Encounter-Referenzen gesucht werden sollen. 
  Wenn der Parameter nicht gesetzt wird, verwendet der Server, der die Operation ausführt, per default den eigenen Endpunkt"
  * name MS 
    * ^short = "Name des Parameters"
  * name = "target-endpoint"
  * value[x] 1..1 MS
  * value[x] only uri

Invariant: gen-in-1
Description: "Es muss entweder der Parameter `fhir-document` oder der parameter `non-fhir-document` übermittelt werden!"
Expression: "parameter.where(name = 'fhir-document').exists() xor parameter.where(name='non-fhir-document').exists()"
Severity: #error

Invariant: gen-in-2
Description: "Wenn der Parameter `non-fhir-document` übermittelt wird, muss auch `non-fhir-document-type` übermittelt werden. `non-fhir-document-type` darf nicht in Verbindung mit `fhir-document` übermittelt werden."
Expression: "parameter.where(name = 'non-fhir-document').exists().not() xor parameter.where(name = 'non-fhir-document-type').exists()"
Severity: #error