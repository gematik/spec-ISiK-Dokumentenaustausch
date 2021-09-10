Instance: List-SourceId
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for SourceId"
Description: "This SearchParameter enables finding Lists by the SourceId of a submissionSet."
Usage: #definition
* url = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-SourceId"
* version = "4.0.2"
* name = "SourceId"
* status = #active
* date = "2021-08-26T01:01:06+00:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "This SearchParameter enables finding Lists by the SourceId of a submissionSet."
* jurisdiction[0] = $m49.htm#001
* code = #sourceId
* base[0] = #List
* type = #reference
* expression = "(extension('http://profiles.ihe.net/ITI/MHD/StructureDefinition/SourceId').value as Reference)"

Instance: AssociationTypeVsRelatesTo
InstanceOf: ConceptMap
Title: "AssociationType vs RelatesTo"
Description: "map between XDS Association Types and MHD FHIR DocumentReference relatesTo code."
Usage: #definition
* url = "http://profiles.ihe.net/ITI/MHD/ConceptMap/AssociationTypeVsRelatesTo"
* version = "4.0.2"
* name = "AssociationTypeVsRelatesTo"
* status = #active
* date = "2021-05-15"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "map between XDS Association Types and MHD FHIR DocumentReference relatesTo code.\n\n- Source Code - [XDS Association Types](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.2) are indicated as URN, they are here indicated as system and code\n- Destination Code - [DocumentReference relatesTo code](http://hl7.org/fhir/valueset-document-relationship-type.html) are Required codes"
* jurisdiction[0] = $m49.htm#001
* purpose = "show the mapping between Association Types and relatesTo code"
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* sourceUri = "urn:ihe:iti:2007:AssociationType"
* targetUri = "http://hl7.org/fhir/document-relationship-type"
* group[0].element[0].code = #RPLC
* group[0].element[0].target[0].code = #replaces
* group[0].element[0].target[0].equivalence = #equal
* group[0].element[1].code = #XFRM
* group[0].element[1].target[0].code = #transforms
* group[0].element[1].target[0].equivalence = #equal
* group[0].element[2].code = #APND
* group[0].element[2].target[0].code = #appends
* group[0].element[2].target[0].equivalence = #equal
* group[0].element[3].code = #XFRM_RPLC
* group[0].element[3].target[0].code = #replaces
* group[0].element[3].target[0].equivalence = #narrower
* group[0].element[3].target[0].comment = "An XDS Transform Replacement is both a document that replaces and transforms. The mapping here indicates Replace as that is the most specific change."
* group[0].element[4].code = #signs
* group[0].element[4].target[0].code = #signs
* group[0].element[4].target[0].equivalence = #equal
* group[0].element[5].code = #IsSnapshotOf
* group[0].element[5].target[0].code = #transforms
* group[0].element[5].target[0].equivalence = #inexact
* group[0].element[5].target[0].comment = "An XDS IsSnapshotOf is a new instance of what is defined in the parent DocumentEntry (DocumentReference), thus it is a transform in a manner, but is not exactly a transform of the parent document."

Instance: IHE.MHD.DocumentRecipient.Comprehensive
InstanceOf: CapabilityStatement
Title: "Document Recipient implementing Comprehensive Metadata Option"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with Comprehensive declared Option."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133113-document-recipient\">Document Recipient actor</a> with Comprehensive declared Option.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentRecipient.Comprehensive"
* version = "4.0.2"
* name = "IHE_MHD_DocumentRecipient_Comprehensive"
* title = "Document Recipient implementing Comprehensive Metadata Option"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with Comprehensive declared Option."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #server
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle"

Instance: List-DesignationType
InstanceOf: SearchParameter
Title: "search on the IHE defined extension for designationType"
Description: "This SearchParameter enables finding Lists by the designationType code in a submissionSet or folder."
Usage: #definition
* url = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-DesignationType"
* version = "4.0.2"
* name = "DesignationType"
* status = #active
* date = "2021-08-26T01:01:06+00:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "This SearchParameter enables finding Lists by the designationType code in a submissionSet or folder."
* jurisdiction[0] = $m49.htm#001
* code = #designationType
* base[0] = #List
* type = #token
* expression = "(extension('http://profiles.ihe.net/ITI/MHD/StructureDefinition/DesignationType').value as CodeableConcept)"

Instance: IHE.MHD.DocumentSource
InstanceOf: CapabilityStatement
Title: "Document Source (publisher)"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with no declared Options or all declared Options."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133111-document-source\">Document Source actor</a> with no declared Options.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentSource"
* version = "4.0.2"
* name = "IHE_MHD_DocumentSource"
* title = "Document Source (publisher)"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with no declared Options or all declared Options."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #client
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle"
* rest[0].interaction[1].code = #transaction
* rest[0].interaction[1].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle"
* rest[0].interaction[2].code = #transaction
* rest[0].interaction[2].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle"

Instance: IHE.MHD.DocumentRecipient
InstanceOf: CapabilityStatement
Title: "Document Recipient"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with no declared Options or all declared Options."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133113-document-recipient\">Document Recipient actor</a> with no declared Options.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentRecipient"
* version = "4.0.2"
* name = "IHE_MHD_DocumentRecipient"
* title = "Document Recipient"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with no declared Options or all declared Options."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #server
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle"
* rest[0].interaction[1].code = #transaction
* rest[0].interaction[1].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle"
* rest[0].interaction[2].code = #transaction
* rest[0].interaction[2].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle"

Instance: DocumentReference-Creation
InstanceOf: SearchParameter
Title: "search on the DocumentReference.content.attachment.creation element"
Description: "Search Parameter extension enabling clients to search on the DocumentReference.content.attachment.creation element"
Usage: #definition
* url = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* version = "4.0.2"
* name = "Creation"
* status = #active
* date = "2021-08-26T01:01:06+00:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "This SearchParameter enables finding DocumentReference by the creation dateTime."
* jurisdiction[0] = $m49.htm#001
* code = #creation
* base[0] = #DocumentReference
* type = #date
* expression = "DocumentReference.content.attachment.creation"

Instance: IHE.MHD.DocumentResponder
InstanceOf: CapabilityStatement
Title: "Document Responder (server)"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Responder (server)."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133114-document-responder\">Document Responder actor</a>.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentResponder"
* version = "4.0.2"
* name = "IHE_MHD_DocumentResponder"
* title = "Document Responder (server)"
* status = #active
* experimental = false
* date = "2021-05-15T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Responder (server)."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #server
* rest[0].resource[0].type = #DocumentReference
* rest[0].resource[0].profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Query.Minimal.DocumentReference"
* rest[0].resource[0].interaction[0].code = #read
* rest[0].resource[0].interaction[1].code = #search-type
* rest[0].resource[0].searchParam[0].name = "_id"
* rest[0].resource[0].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[0].searchParam[0].type = #token
* rest[0].resource[0].searchParam[0].documentation = "Logical id of this artifact"
* rest[0].resource[0].searchParam[1].name = "_lastupdated"
* rest[0].resource[0].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[0].resource[0].searchParam[1].type = #date
* rest[0].resource[0].searchParam[1].documentation = "When the resource version last changed"
* rest[0].resource[0].searchParam[2].name = "author"
* rest[0].resource[0].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-author"
* rest[0].resource[0].searchParam[2].type = #reference
* rest[0].resource[0].searchParam[2].documentation = "Who and/or what authored the document"
* rest[0].resource[0].searchParam[3].name = "category"
* rest[0].resource[0].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
* rest[0].resource[0].searchParam[3].type = #token
* rest[0].resource[0].searchParam[3].documentation = "Categorization of document"
* rest[0].resource[0].searchParam[4].name = "creation"
* rest[0].resource[0].searchParam[4].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* rest[0].resource[0].searchParam[4].type = #date
* rest[0].resource[0].searchParam[4].documentation = "When this document was created"
* rest[0].resource[0].searchParam[5].name = "date"
* rest[0].resource[0].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-date"
* rest[0].resource[0].searchParam[5].type = #date
* rest[0].resource[0].searchParam[5].documentation = "When this document reference was created"
* rest[0].resource[0].searchParam[6].name = "event"
* rest[0].resource[0].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-event"
* rest[0].resource[0].searchParam[6].type = #token
* rest[0].resource[0].searchParam[6].documentation = "Main clinical acts documented"
* rest[0].resource[0].searchParam[7].name = "facility"
* rest[0].resource[0].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-facility"
* rest[0].resource[0].searchParam[7].type = #token
* rest[0].resource[0].searchParam[7].documentation = "Kind of facility where patient was seen"
* rest[0].resource[0].searchParam[8].name = "format"
* rest[0].resource[0].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-format"
* rest[0].resource[0].searchParam[8].type = #token
* rest[0].resource[0].searchParam[8].documentation = "Format/content rules for the document"
* rest[0].resource[0].searchParam[9].name = "identifier"
* rest[0].resource[0].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest[0].resource[0].searchParam[9].type = #token
* rest[0].resource[0].searchParam[9].documentation = "The identifier for this DocumentReference"
* rest[0].resource[0].searchParam[10].name = "patient"
* rest[0].resource[0].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[0].searchParam[10].type = #reference
* rest[0].resource[0].searchParam[10].documentation = "Who/what is the subject of the document"
* rest[0].resource[0].searchParam[11].name = "period"
* rest[0].resource[0].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
* rest[0].resource[0].searchParam[11].type = #date
* rest[0].resource[0].searchParam[11].documentation = "Time of service that is being documented"
* rest[0].resource[0].searchParam[12].name = "related"
* rest[0].resource[0].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-related"
* rest[0].resource[0].searchParam[12].type = #reference
* rest[0].resource[0].searchParam[12].documentation = "Related Resource"
* rest[0].resource[0].searchParam[13].name = "security-label"
* rest[0].resource[0].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-security-label"
* rest[0].resource[0].searchParam[13].type = #token
* rest[0].resource[0].searchParam[13].documentation = "Document security-tags"
* rest[0].resource[0].searchParam[14].name = "setting"
* rest[0].resource[0].searchParam[14].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-setting"
* rest[0].resource[0].searchParam[14].type = #token
* rest[0].resource[0].searchParam[14].documentation = "Additional details about where the content was created (e.g. clinical specialty)"
* rest[0].resource[0].searchParam[15].name = "status"
* rest[0].resource[0].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
* rest[0].resource[0].searchParam[15].type = #token
* rest[0].resource[0].searchParam[15].documentation = "current | superseded | entered-in-error"
* rest[0].resource[0].searchParam[16].name = "type"
* rest[0].resource[0].searchParam[16].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[0].searchParam[16].type = #reference
* rest[0].resource[0].searchParam[16].documentation = "Kind of document (LOINC if possible)"
* rest[0].resource[1].type = #List
* rest[0].resource[1].profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.List"
* rest[0].resource[1].supportedProfile[0] = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.SubmissionSet"
* rest[0].resource[1].supportedProfile[1] = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.SubmissionSet"
* rest[0].resource[1].supportedProfile[2] = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.SubmissionSet"
* rest[0].resource[1].supportedProfile[3] = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.Folder"
* rest[0].resource[1].supportedProfile[4] = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.Folder"
* rest[0].resource[1].interaction[0].code = #read
* rest[0].resource[1].interaction[1].code = #search-type
* rest[0].resource[1].searchParam[0].name = "_id"
* rest[0].resource[1].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[1].searchParam[0].type = #token
* rest[0].resource[1].searchParam[0].documentation = "Logical id of this artifact"
* rest[0].resource[1].searchParam[1].name = "_lastupdated"
* rest[0].resource[1].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[0].resource[1].searchParam[1].type = #date
* rest[0].resource[1].searchParam[1].documentation = "When the resource version last changed"
* rest[0].resource[1].searchParam[2].name = "code"
* rest[0].resource[1].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[0].resource[1].searchParam[2].type = #token
* rest[0].resource[1].searchParam[2].documentation = "This parameter, of type token, specifies the code.coding value supplied in the List Resource. The value of the code element indicates the List of type SubmissionSet or Folder as indicated."
* rest[0].resource[1].searchParam[3].name = "date"
* rest[0].resource[1].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[0].resource[1].searchParam[3].type = #date
* rest[0].resource[1].searchParam[3].documentation = "This parameter, of type date, specifies the time when the List was created."
* rest[0].resource[1].searchParam[4].name = "identifier"
* rest[0].resource[1].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest[0].resource[1].searchParam[4].type = #token
* rest[0].resource[1].searchParam[4].documentation = "This parameter, of type token, specifies an identifier for this List. The search results represent the results of a search on List.masterIdentifier and List.identifier. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type."
* rest[0].resource[1].searchParam[5].name = "subject"
* rest[0].resource[1].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[1].searchParam[5].type = #reference
* rest[0].resource[1].searchParam[5].documentation = "This parameter is of type Reference(Patient). The Document Consumer may get this reference through the use of the PDQm or PIXm Profiles, or by some other method. When the patient parameter is used, the Patient reference would need to be accessible to both the Document Consumer and the Document Responder."
* rest[0].resource[1].searchParam[6].name = "source"
* rest[0].resource[1].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/List-source"
* rest[0].resource[1].searchParam[6].type = #reference
* rest[0].resource[1].searchParam[6].documentation = "These parameters, of type string, specify the name parts of the author person which is associated with the List. See ITI TF-2x: Appendix Z.2 for use of the string data type."
* rest[0].resource[1].searchParam[7].name = "status"
* rest[0].resource[1].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/List-status"
* rest[0].resource[1].searchParam[7].type = #token
* rest[0].resource[1].searchParam[7].documentation = "This parameter, of type token, specifies the status of the List. If included in the query, the Document Consumer shall populate the code portion of the token with one of the codes in the following Table 3.66.4.1.2.1-1: Values for code for status of List. The system portion of the token shall not be populated."
* rest[0].resource[1].searchParam[8].name = "designationType"
* rest[0].resource[1].searchParam[8].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-DesignationType"
* rest[0].resource[1].searchParam[8].type = #token
* rest[0].resource[1].searchParam[8].documentation = "This IHE extension on parameters defined as SearchParameter/List-DesignationType, of type token, specifies the designation type of the List. The value of the designation type element indicates the clinical purpose of the SubmissionSet or Folder. Note that servers that do not support this extended search parameter will ignore it, and thus return more results than expected."
* rest[0].resource[1].searchParam[9].name = "sourceId"
* rest[0].resource[1].searchParam[9].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-SourceId"
* rest[0].resource[1].searchParam[9].type = #reference
* rest[0].resource[1].searchParam[9].documentation = "This IHE extension on parameters defined as SearchParameter/List-SourceId, of type reference, specifies the source (author) value supplied in the List Resource."
* rest[0].resource[2].type = #Binary
* rest[0].resource[2].interaction[0].code = #read
* rest[0].interaction[0].code = #search-system

Instance: IHE.MHD.DocumentConsumer
InstanceOf: CapabilityStatement
Title: "Document Consumer (client)"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Consumer (client)."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133112-document-consumer\">Document Consumer actor</a>.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentConsumer"
* version = "4.0.2"
* name = "IHE_MHD_DocumentConsumer"
* title = "Document Consumer (client)"
* status = #active
* experimental = false
* date = "2021-05-15T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Consumer (client)."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #client
* rest[0].resource[0].type = #DocumentReference
* rest[0].resource[0].profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Query.Minimal.DocumentReference"
* rest[0].resource[0].interaction[0].code = #read
* rest[0].resource[0].interaction[1].code = #search-type
* rest[0].resource[0].searchParam[0].name = "_id"
* rest[0].resource[0].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[0].searchParam[0].type = #token
* rest[0].resource[0].searchParam[0].documentation = "Logical id of this artifact"
* rest[0].resource[0].searchParam[1].name = "_lastupdated"
* rest[0].resource[0].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[0].resource[0].searchParam[1].type = #date
* rest[0].resource[0].searchParam[1].documentation = "When the resource version last changed"
* rest[0].resource[0].searchParam[2].name = "author"
* rest[0].resource[0].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-author"
* rest[0].resource[0].searchParam[2].type = #reference
* rest[0].resource[0].searchParam[2].documentation = "Who and/or what authored the document"
* rest[0].resource[0].searchParam[3].name = "category"
* rest[0].resource[0].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
* rest[0].resource[0].searchParam[3].type = #token
* rest[0].resource[0].searchParam[3].documentation = "Categorization of document"
* rest[0].resource[0].searchParam[4].name = "creation"
* rest[0].resource[0].searchParam[4].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* rest[0].resource[0].searchParam[4].type = #date
* rest[0].resource[0].searchParam[4].documentation = "When this document was created"
* rest[0].resource[0].searchParam[5].name = "date"
* rest[0].resource[0].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-date"
* rest[0].resource[0].searchParam[5].type = #date
* rest[0].resource[0].searchParam[5].documentation = "When this document reference was created"
* rest[0].resource[0].searchParam[6].name = "event"
* rest[0].resource[0].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-event"
* rest[0].resource[0].searchParam[6].type = #token
* rest[0].resource[0].searchParam[6].documentation = "Main clinical acts documented"
* rest[0].resource[0].searchParam[7].name = "facility"
* rest[0].resource[0].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-facility"
* rest[0].resource[0].searchParam[7].type = #token
* rest[0].resource[0].searchParam[7].documentation = "Kind of facility where patient was seen"
* rest[0].resource[0].searchParam[8].name = "format"
* rest[0].resource[0].searchParam[8].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-format"
* rest[0].resource[0].searchParam[8].type = #token
* rest[0].resource[0].searchParam[8].documentation = "Format/content rules for the document"
* rest[0].resource[0].searchParam[9].name = "identifier"
* rest[0].resource[0].searchParam[9].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest[0].resource[0].searchParam[9].type = #token
* rest[0].resource[0].searchParam[9].documentation = "The identifier for this DocumentReference"
* rest[0].resource[0].searchParam[10].name = "patient"
* rest[0].resource[0].searchParam[10].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[0].searchParam[10].type = #reference
* rest[0].resource[0].searchParam[10].documentation = "Who/what is the subject of the document"
* rest[0].resource[0].searchParam[11].name = "period"
* rest[0].resource[0].searchParam[11].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
* rest[0].resource[0].searchParam[11].type = #date
* rest[0].resource[0].searchParam[11].documentation = "Time of service that is being documented"
* rest[0].resource[0].searchParam[12].name = "related"
* rest[0].resource[0].searchParam[12].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-related"
* rest[0].resource[0].searchParam[12].type = #reference
* rest[0].resource[0].searchParam[12].documentation = "Related Resource"
* rest[0].resource[0].searchParam[13].name = "security-label"
* rest[0].resource[0].searchParam[13].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-security-label"
* rest[0].resource[0].searchParam[13].type = #token
* rest[0].resource[0].searchParam[13].documentation = "Document security-tags"
* rest[0].resource[0].searchParam[14].name = "setting"
* rest[0].resource[0].searchParam[14].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-setting"
* rest[0].resource[0].searchParam[14].type = #token
* rest[0].resource[0].searchParam[14].documentation = "Additional details about where the content was created (e.g. clinical specialty)"
* rest[0].resource[0].searchParam[15].name = "status"
* rest[0].resource[0].searchParam[15].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
* rest[0].resource[0].searchParam[15].type = #token
* rest[0].resource[0].searchParam[15].documentation = "current | superseded | entered-in-error"
* rest[0].resource[0].searchParam[16].name = "type"
* rest[0].resource[0].searchParam[16].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[0].searchParam[16].type = #reference
* rest[0].resource[0].searchParam[16].documentation = "Kind of document (LOINC if possible)"
* rest[0].resource[1].type = #List
* rest[0].resource[1].profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.List"
* rest[0].resource[1].interaction[0].code = #read
* rest[0].resource[1].interaction[1].code = #search-type
* rest[0].resource[1].searchParam[0].name = "_id"
* rest[0].resource[1].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[0].resource[1].searchParam[0].type = #token
* rest[0].resource[1].searchParam[0].documentation = "Logical id of this artifact"
* rest[0].resource[1].searchParam[1].name = "_lastupdated"
* rest[0].resource[1].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest[0].resource[1].searchParam[1].type = #date
* rest[0].resource[1].searchParam[1].documentation = "When the resource version last changed"
* rest[0].resource[1].searchParam[2].name = "code"
* rest[0].resource[1].searchParam[2].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[0].resource[1].searchParam[2].type = #token
* rest[0].resource[1].searchParam[2].documentation = "This parameter, of type token, specifies the code.coding value supplied in the List Resource. The value of the code element indicates the List of type SubmissionSet or Folder as indicated."
* rest[0].resource[1].searchParam[3].name = "date"
* rest[0].resource[1].searchParam[3].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[0].resource[1].searchParam[3].type = #date
* rest[0].resource[1].searchParam[3].documentation = "This parameter, of type date, specifies the time when the List was created."
* rest[0].resource[1].searchParam[4].name = "identifier"
* rest[0].resource[1].searchParam[4].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest[0].resource[1].searchParam[4].type = #token
* rest[0].resource[1].searchParam[4].documentation = "This parameter, of type token, specifies an identifier for this List. The search results represent the results of a search on List.masterIdentifier and List.identifier. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type."
* rest[0].resource[1].searchParam[5].name = "subject"
* rest[0].resource[1].searchParam[5].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[0].resource[1].searchParam[5].type = #reference
* rest[0].resource[1].searchParam[5].documentation = "This parameter is of type Reference(Patient). The Document Consumer may get this reference through the use of the PDQm or PIXm Profiles, or by some other method. When the patient parameter is used, the Patient reference would need to be accessible to both the Document Consumer and the Document Responder."
* rest[0].resource[1].searchParam[6].name = "source"
* rest[0].resource[1].searchParam[6].definition = "http://hl7.org/fhir/SearchParameter/List-source"
* rest[0].resource[1].searchParam[6].type = #reference
* rest[0].resource[1].searchParam[6].documentation = "These parameters, of type string, specify the name parts of the author person which is associated with the List. See ITI TF-2x: Appendix Z.2 for use of the string data type."
* rest[0].resource[1].searchParam[7].name = "status"
* rest[0].resource[1].searchParam[7].definition = "http://hl7.org/fhir/SearchParameter/List-status"
* rest[0].resource[1].searchParam[7].type = #token
* rest[0].resource[1].searchParam[7].documentation = "This parameter, of type token, specifies the status of the List. If included in the query, the Document Consumer shall populate the code portion of the token with one of the codes in the following Table 3.66.4.1.2.1-1: Values for code for status of List. The system portion of the token shall not be populated."
* rest[0].resource[1].searchParam[8].name = "designationType"
* rest[0].resource[1].searchParam[8].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-DesignationType"
* rest[0].resource[1].searchParam[8].type = #token
* rest[0].resource[1].searchParam[8].documentation = "This IHE extension on parameters defined as SearchParameter/List-DesignationType, of type token, specifies the designation type of the List. The value of the designation type element indicates the clinical purpose of the SubmissionSet or Folder. Note that servers that do not support this extended search parameter will ignore it, and thus return more results than expected."
* rest[0].resource[1].searchParam[9].name = "sourceId"
* rest[0].resource[1].searchParam[9].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-SourceId"
* rest[0].resource[1].searchParam[9].type = #reference
* rest[0].resource[1].searchParam[9].documentation = "This IHE extension on parameters defined as SearchParameter/List-SourceId, of type reference, specifies the source (author) value supplied in the List Resource."
* rest[0].resource[2].type = #Binary
* rest[0].resource[2].interaction[0].code = #read
* rest[0].interaction[0].code = #search-system

Instance: IHE.MHD.DocumentSource.Comprehensive
InstanceOf: CapabilityStatement
Title: "Document Source (publisher) implementing Comprehensive Metadata Option"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with Comprehensive Metadata Option."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133111-document-source\">Document Source actor</a> with Comprehensive declared Option.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentSource.Comprehensive"
* version = "4.0.2"
* name = "IHE_MHD_DocumentSource_Comprehensive"
* title = "Document Source (publisher) implementing Comprehensive Metadata Option"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with Comprehensive Metadata Option."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #client
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle"

Instance: IHE.MHD.DocumentSource.UnContained
InstanceOf: CapabilityStatement
Title: "Document Source (publisher) implementing UnContained References Option"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with UnContained Option."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133111-document-source\">Document Source actor</a> with UnContained declared Option.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentSource.UnContained"
* version = "4.0.2"
* name = "IHE_MHD_DocumentSource_UnContained"
* title = "Document Source (publisher) implementing UnContained References Option"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Source (publisher) - with UnContained Option."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #client
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle"
* rest[0].interaction[1].code = #transaction
* rest[0].interaction[1].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.UnContained.Comprehensive.ProvideBundle"

Instance: IHE.MHD.DocumentRecipient.UnContained
InstanceOf: CapabilityStatement
Title: "Document Recipient implementing UnContained References Option"
Description: "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with UnContained declared Option."
Usage: #definition
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\tThis Requirements CapabilityStatement describes the <a href=\"1331_actors_and_transactions.html#133113-document-recipient\">Document Recipient actor</a> with UnContained declared Option.\n\t</div>"
* url = "http://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentRecipient.UnContained"
* version = "4.0.2"
* name = "IHE_MHD_DocumentRecipient_UnContained"
* title = "Document Recipient implementing UnContained References Option"
* status = #active
* experimental = false
* date = "2021-02-22T00:00:00-05:00"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://ihe.net"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "secretary@ihe.net"
* contact[1].name = "John Moehrke"
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* contact[1].telecom[0].use = #work
* description = "IHE ITI Mobile access to Health Documents (MHD) - Document Recipient - with UnContained declared Option."
* jurisdiction[0] = $m49.htm#001
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #application/fhir+xml
* format[1] = #application/fhir+json
* rest[0].mode = #server
* rest[0].security.description = "Recommend IUA or SMART"
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle"
* rest[0].interaction[1].code = #transaction
* rest[0].interaction[1].documentation = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle"