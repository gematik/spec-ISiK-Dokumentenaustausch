Instance: ISiK-capabilityStatement-dokumentenaustausch-server
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-Inst
* url = "https://gematik.de/fhir/ISiK/v2/CapabilityStatement/dokumentenaustausch-server"
* name = "ISiKCapabilityStatementDokumentenaustauschServer"
* title = "ISiK CapabilityStatement Dokumentenaustausch Server"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls &quot;Dokumentenaustausch&quot; zu bestehen."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* implementationGuide = "https://gematik.de/fhir/ISiK/ImplementationGuide/ISiK-Dokumentenaustausch|2.0.0"
* rest.mode = #server
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #DocumentReference
  * supportedProfile = "https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenMetadaten"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-patient"
    * type = #reference
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-type"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "creation"
    * definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
    * type = #date
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "encounter"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-encounter"
    * type = #reference
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Binary
  * supportedProfile = "https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKBinary"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read   
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Composition
  * supportedProfile = "https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKStrukturiertesDokument"
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Bundle
  * supportedProfile = "https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKStrukturiertesDokumentBundle"
* rest.operation[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * name = #submit-document
  * definition = Canonical(SubmitDocument)
* rest.operation[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #MAY
  * name = #update-metadata
  * definition = Canonical(UpdateMetadata)

