Instance: ISiK-capabilityStatement-dokumentenaustausch-server
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* name = "ISiKCapabilityStatementDokumentenaustauschServer"
* title = "ISiK CapabilityStatement Dokumentenaustausch Server"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls &quot;Dokumentenaustausch&quot; zu bestehen."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server
* rest.resource[+]
  * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Patient
  * supportedProfile = "https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPatient"
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "identifier"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Patient-identifier"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "family"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/individual-family"
    * type = #string
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "given"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/individual-given"
    * type = #string
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "birthdate"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/individual-birthdate"
    * type = #date
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "gender"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/individual-gender"
    * type = #token
* rest.resource[+]
  * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Encounter
  * supportedProfile = "https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "identifier"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-identifier"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "status"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-status"
    * type = #token  
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "class"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-class"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "type"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/clinical-patient"
    * type = #reference
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "subject"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-subject"
    * type = #reference
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "part-of"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-part-of"
    * type = #reference
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "date"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Encounter-date"
    * type = #date
* rest.resource[+]
  * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #DocumentReference
  * supportedProfile = "https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenMetadaten"
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #create
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "status"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/DocumentReference-status"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "patient"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/DocumentReference-patient"
    * type = #reference
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "type"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/DocumentReference-type"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "category"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/DocumentReference-category"
    * type = #token
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "creation"
    * definition = "https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
    * type = #date
  * searchParam[+]
    * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "encounter"
    * definition = "https://hl7.org/fhir/R4/SearchParameter/DocumentReference-encounter"
    * type = #reference
* rest.operation[+]
  * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #MAY
  * name = #update-metadata
  * definition = Canonical(UpdateMetadata)
* rest.operation[+]
  * extension.url = "https://hl7.org/fhir/R4/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #MAY
  * name = #generate-metadata
  * definition = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/generate-metadata"
