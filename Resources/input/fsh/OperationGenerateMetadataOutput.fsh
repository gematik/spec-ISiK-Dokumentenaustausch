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
* parameter contains output-metadata 1..1 MS and information 0..1  
* parameter[output-metadata]
  * ^short = "Dokumentenmetadaten wie sie vom Server erzeugt/gemapped wurden"
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