Profile: MhdList
Parent: List
Id: IHE.MHD.List
Title: "MHD common List with designationType"
Description: """A profile on the List resource for MHD. Used with both Folder and SubmissionSet.
- MHD adds a codeable Concept to List for use with Folder and SubmissionSet"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* extension contains DesignationType named designationType 0..*
* modifierExtension ..0
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "use"
* identifier ^slicing.rules = #open
* identifier contains
    uniqueId 1..1 and
    entryUUID 0..*
* identifier[uniqueId] ^short = "uniqueId"
* identifier[uniqueId].use 1..
* identifier[uniqueId].use = #usual
* identifier[entryUUID] ^short = "entryUUID"
* identifier[entryUUID].use 1..
* identifier[entryUUID].use = #official
* code 1..
* code from MHDlistTypesVS (required)

Profile: MinimalDocumentReference
Parent: DocumentReference
Id: IHE.MHD.Minimal.DocumentReference
Title: "MHD DocumentReference Minimal"
Description: """A profile on the DocumentReference resource for MHD with minimal metadata constraints. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* masterIdentifier 1..
* identifier 1..
* docStatus ..0
* type MS
* category ..1 MS
* subject only Reference(Patient)
* subject MS
* date MS
* author MS
* custodian ..0
* relatesTo MS
* securityLabel MS
* content ..1
* content.attachment.contentType 1..
* content.attachment.language MS
* content.attachment.data ..0
* content.attachment.url 1..
* content.attachment.creation MS
* content.format MS
* context.encounter ..0
* context.period MS
* context.facilityType MS
* context.practiceSetting MS
* context.sourcePatientInfo MS

Profile: SubmissionSet
Parent: MhdList
Id: IHE.MHD.Minimal.SubmissionSet
Title: "MHD SubmissionSet Minimal"
Description: """A profile on the List resource for MHD SubmissionSet.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a SubmissionSet implementation of the 
- ebRIM implementation at [3:4.2.3.3 SubmissionSet Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.3).
- with use-cases and constraints found in [3:4.3.1 Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1) for 
  - Document Source implementing not implementing Comprehensive Metadata Option
  - Document Source implementing UnContained Option but not Comprehensive Option
  - equivalent to XDR Document Source implementing Metadata-Limited Option requirements
  - aka the default MHD Document Source"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* extension[designationType] ..1 MS
* extension contains
    SourceId named sourceId 1..1 and
    IntendedRecipient named intendedRecipient 0..*
* identifier 2..
* mode = #working
* code = $MHDlistTypes#submissionset
* subject only Reference(Patient)
* subject MS
* encounter ..0
* date 1..
* source MS
* source.extension contains AuthorOrg named authorOrg 0..1
* orderedBy ..0
* note ..1
* entry.flag ..0
* entry.deleted ..0
* entry.date ..0
* entry.item only Reference(DocumentReference or List)
* emptyReason ..0

Profile: FindDocumentReferencesComprehensiveResponse
Parent: Bundle
Id: IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage
Title: "MHD Find Document References Comprehensive Response message"
Description: "A profile on the Find Document References Comprehensive Response message for ITI-67"
* ^version = "4.0.2"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ComprehensiveDocumentReference

Profile: ComprehensiveProvideDocumentBundle
Parent: UnContainedComprehensiveProvideDocumentBundle
Id: IHE.MHD.Comprehensive.ProvideBundle
Title: "MHD Comprehensive Provide Document Bundle"
Description: """A profile on the Bundle transaction for ITI-65 Provide Document resources with Comprehensive Metadata for MHD.

- [Comprehensive Metadata](StructureDefinition-IHE.MHD.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle`
  - this is otherwise known as XDS-on-FHIR
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive constraints, they may be marked comprehensive
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* entry[SubmissionSet].resource only SubmissionSetComprehensive
* entry[DocumentRefs].resource only ComprehensiveDocumentReference

Profile: ComprehensiveDocumentReference
Parent: UnContainedComprehensiveDocumentReference
Id: IHE.MHD.Comprehensive.DocumentReference
Title: "MHD DocumentReference Comprehensive"
Description: """A profile on the DocumentReference resource for MHD Comprehensive Option with Contained (not UnContained), compatible with XDS-on-FHIR and XCA use.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* author only Reference(Practitioner or PractitionerRole or Organization or Device or Patient or RelatedPerson)
* author ^type[0].aggregation[0] = #contained
* authenticator only Reference(Practitioner or PractitionerRole or Organization)
* authenticator ^type[0].aggregation[0] = #contained
* context.sourcePatientInfo only Reference(Patient)
* context.sourcePatientInfo ^type[0].aggregation[0] = #contained

Profile: AuditProvideBundleRecipient
Parent: AuditEvent
Id: IHE.MHD.ProvideBundle.Audit.Recipient
Title: "Audit Event for Provide Bundle Transaction at Recipient"
Description: """Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens at the Recipient.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110107 "Import"
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
* action = #C
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentSource 1..1 and
    documentRecipient 1..1
* agent[documentSource].type 1..
* agent[documentSource].type = $DCM#110153 "Source Role ID"
* agent[documentSource].who 1..
* agent[documentSource].network 1..
* agent[documentRecipient] obeys val-audit-source
* agent[documentRecipient].type 1..
* agent[documentRecipient].type = $DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..
* agent[documentRecipient].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    submissionSet 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[submissionSet].what 1..
* entity[submissionSet].what only Reference(List)
* entity[submissionSet].type 1..
* entity[submissionSet].type = $audit-entity-type#2 "System Object"
* entity[submissionSet].role = $object-role#20 "Job"

Profile: AuditFindDocumentListsResponder
Parent: AuditEvent
Id: IHE.MHD.FindDocumentLists.Audit.Responder
Title: "Audit Event for Find Document Lists Transaction at Document Responder"
Description: """Defines constraints on the AuditEvent Resource to record when a Find Document Lists Transaction happens, as recorded by the Document Responder.
- Query event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a the query parameters"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110112 "Query"
* subtype = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
* action = #E
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder] obeys val-audit-source
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    queryParameters 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[queryParameters].type 1..
* entity[queryParameters].type = $audit-entity-type#2 "System Object"
* entity[queryParameters].role = $object-role#24 "Query"
* entity[queryParameters].query 1..

Profile: UnContainedComprehensiveProvideDocumentBundle
Parent: MinimalProvideDocumentBundle
Id: IHE.MHD.UnContained.Comprehensive.ProvideBundle
Title: "MHD UnContained Comprehensive Provide Document Bundle"
Description: """A profile on the Bundle transaction for ITI-65 Provide Document resources with UnContained allowed but requiring Comprehensive Metadata for MHD.

- [UnContained Comprehensive Metadata](StructureDefinition-IHE.MHD.UnContained.Comprehensive.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.ProvideBundle` 
  - note that Minimal Metadata does not require containment, so UnContained Minimal is the same as Minimal Metadata
  - note that UnContained only applies to DocumentReference and SubmissionSet type Lists; so the following apply
  - shall be a Transaction Bundle
  - all resources shall be compliant with comprehensive unContained constraints, they may be marked comprehensive unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* entry[SubmissionSet].resource only SubmissionSetComprehensiveUnContained
* entry[DocumentRefs].resource only UnContainedComprehensiveDocumentReference

Profile: AuditFindDocumentListsConsumer
Parent: AuditEvent
Id: IHE.MHD.FindDocumentLists.Audit.Consumer
Title: "Audit Event for Find Document Lists Transaction by the Document Consumer"
Description: """Defines constraints on the AuditEvent Resource to record when a Find Document Lists Transaction happens, as recorded by the Document Consumer.
- Query event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a the query parameters"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110112 "Query"
* subtype = urn:ihe:event-type-code#ITI-66 "Find Document Lists"
* action = #E
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer] obeys val-audit-source
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    queryParameters 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[queryParameters].type 1..
* entity[queryParameters].type = $audit-entity-type#2 "System Object"
* entity[queryParameters].role = $object-role#24 "Query"
* entity[queryParameters].query 1..

Profile: Folder
Parent: MhdList
Id: IHE.MHD.Minimal.Folder
Title: "MHD Folder Minimal"
Description: """A profile on the List resource for MHD use as a Folder with minimal metadata constraints. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a Folder implementation of the 
- ebRIM implementation at [3:4.2.3.4 Folder Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* extension[designationType] MS
* identifier ..2
* identifier[entryUUID] 1..1
* mode = #working
* code = $MHDlistTypes#folder
* subject only Reference(Patient)
* subject MS
* encounter ..0
* source ..0
* orderedBy ..0
* note ..1
* entry.flag ..0
* entry.deleted ..0
* entry.date ..0
* entry.item only Reference(DocumentReference)
* emptyReason ..0

Profile: AuditFindDocumentReferencesResponder
Parent: AuditEvent
Id: IHE.MHD.FindDocumentReferences.Audit.Responder
Title: "Audit Event for Find Document References Transaction at Document Responder"
Description: """Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Responder.
- Query event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a the query parameters"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110112 "Query"
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
* action = #E
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder] obeys val-audit-source
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    queryParameters 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[queryParameters].type 1..
* entity[queryParameters].type = $audit-entity-type#2 "System Object"
* entity[queryParameters].role = $object-role#24 "Query"
* entity[queryParameters].query 1..

Profile: AuditRetrieveDocumentConsumer
Parent: AuditEvent
Id: IHE.MHD.RetrieveDocument.Audit.Consumer
Title: "Audit Event for Retrieve Document Transaction at Document Consumer"
Description: """Defines constraints on the Document Consumer AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Consumer.
- Import event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a document uniqueId (usually a Binary)"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110107 "Import"
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
* action = #C
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer] obeys val-audit-source
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    documentUniqueId 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[documentUniqueId].what.reference 1..
* entity[documentUniqueId].type 1..
* entity[documentUniqueId].type = $audit-entity-type#2 "System Object"
* entity[documentUniqueId].role = $object-role#3 "Report"

Profile: FindDocumentReferencesResponse
Parent: Bundle
Id: IHE.MHD.FindDocumentReferencesResponseMessage
Title: "MHD Find Document References Response message"
Description: "A profile on the Find Document References Response message for ITI-67"
* ^version = "4.0.2"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only MinimalDocumentReference

Profile: FindListsResponse
Parent: Bundle
Id: IHE.MHD.FindDocumentListsResponseMessage
Title: "MHD Find Document Lists Response Message"
Description: "A profile on the Find Document Lists Response message for ITI-66"
* ^version = "4.0.2"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    SubmissionSet 0..* and
    Folder 0..*
* entry[SubmissionSet] ^short = "SubmissionSets"
* entry[SubmissionSet].fullUrl 1..
* entry[SubmissionSet].resource 1..
* entry[SubmissionSet].resource only SubmissionSet
* entry[Folder] ^short = "Folders"
* entry[Folder].fullUrl 1..
* entry[Folder].resource 1..
* entry[Folder].resource only Folder

Profile: MinimalProvideDocumentBundle
Parent: Bundle
Id: IHE.MHD.Minimal.ProvideBundle
Title: "MHD Minimal Provide Document Bundle"
Description: """A profile on the Bundle transaction for ITI-65 Provide Document resources with Minimal metadata for MHD.

- [Minimal Metadata](StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html): `http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle`
  - shall be a Transaction Bundle
  - all resources shall be compliant with minimal constraints, they may be marked minimal, comprehensive, or unContained
  - shall create a [SubmissionSet type List](StructureDefinition-IHE.MHD.Minimal.SubmissionSet.html) that is either minimal, comprehensive, or unContained
  - may create one or more [DocumentReference](StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) that is either minimal, comprehensive, or unContained
  - may create one or more [Binary](http://hl7.org/fhir/R4/binary.html)
  - may create/update one or more [Folder type List](StructureDefinition-IHE.MHD.Minimal.Folder.html) that is either minimal, comprehensive, or unContained
  - may create/update/read one [Patient](http://hl7.org/fhir/R4/patient.html)"""
* ^version = "4.0.2"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* meta.profile 1..
* type = #transaction
* entry MS
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry ^slicing.rules = #closed
* entry.resource MS
* entry contains
    SubmissionSet 1..1 and
    DocumentRefs 0..* and
    Documents 0..* and
    Folders 0..* and
    Patient 0..1
* entry[SubmissionSet] ^short = "the SubmissionSet"
* entry[SubmissionSet] ^definition = "The SubmissionSet defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[SubmissionSet].resource 1..
* entry[SubmissionSet].resource only SubmissionSet
* entry[SubmissionSet].request 1..
* entry[SubmissionSet].request.method = #POST
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].resource 1..
* entry[DocumentRefs].resource only MinimalDocumentReference
* entry[DocumentRefs].request 1..
* entry[DocumentRefs].request.method = #POST
* entry[Documents] ^short = "the documents"
* entry[Documents] ^definition = "the documents referenced by the DocumentReference resources"
* entry[Documents].resource 1..
* entry[Documents].resource only Binary
* entry[Documents].request 1..
* entry[Documents].request.method = #POST
* entry[Folders] ^short = "Folders"
* entry[Folders] ^definition = "any Folders being created or updated"
* entry[Folders].resource 1..
* entry[Folders].resource only Folder
* entry[Folders].request 1..
* entry[Folders].request.method from MHDprovideFolderActions (required)
* entry[Patient] ^short = "the Patient"
* entry[Patient] ^definition = "the Patient"
* entry[Patient].resource 1..
* entry[Patient].resource only Patient
* entry[Patient].request.method from MHDprovidePatientActions (required)

Profile: SubmissionSetComprehensiveUnContained
Parent: SubmissionSet
Id: IHE.MHD.UnContained.Comprehensive.SubmissionSet
Title: "MHD SubmissionSet Comprehensive UnContained"
Description: """A profile on the List resource for MHD UnContained Comprehensive SubmissionSet.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a SubmissionSet implementation of the 
- ebRIM implementation at [3:4.2.3.3 SubmissionSet Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.3).
- with use-cases and constraints found in [3:4.3.1 Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1) for 
  - MHD Document Source that has implemented both Comprehensive Metadata Option and UnContained References Option"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* extension[designationType] 1..
* subject 1..

Profile: SubmissionSetComprehensive
Parent: SubmissionSetComprehensiveUnContained
Id: IHE.MHD.Comprehensive.SubmissionSet
Title: "MHD SubmissionSet Comprehensive"
Description: """A profile on the List resource for MHD Comprehensive SubmissionSet.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a SubmissionSet implementation of the 
- ebRIM implementation at [3:4.2.3.3 SubmissionSet Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.3).
- with use-cases and constraints found in [3:4.3.1 Submission Metadata Attribute Optionality](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3.1) for 
  - MHD Comprehensive Option Document Source
  - aka the XDS Document Source requirements
  - aka the XDR Document Source requirements"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* source only Reference(Practitioner or PractitionerRole or Patient or Device)
* source ^type[0].aggregation[0] = #contained

Profile: AuditFindDocumentReferencesConsumer
Parent: AuditEvent
Id: IHE.MHD.FindDocumentReferences.Audit.Consumer
Title: "Audit Event for Find Document References Transaction at Document Consumer"
Description: """Defines constraints on the AuditEvent Resource to record when a Find Document References Transaction happens, as recorded by the Document Consumer.
- Query event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a the query parameters"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110112 "Query"
* subtype = urn:ihe:event-type-code#ITI-67 "Find Document References"
* action = #E
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer] obeys val-audit-source
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    queryParameters 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[queryParameters].type 1..
* entity[queryParameters].type = $audit-entity-type#2 "System Object"
* entity[queryParameters].role = $object-role#24 "Query"
* entity[queryParameters].query 1..

Profile: AuditRetrieveDocumentResponder
Parent: AuditEvent
Id: IHE.MHD.RetrieveDocument.Audit.Responder
Title: "Audit Event for Retrieve Document Transaction at the Document Responder"
Description: """Defines constraints on the Document Responder AuditEvent Resource to record when a Retrieve Document Transaction happens, as recorded by the Document Responder.
- Export event
- shall have the source as itself
- shall have a document consumer agent
- shall have a document responder agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a document uniqueId (usually a Binary)"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110106 "Export"
* subtype = urn:ihe:event-type-code#ITI-68 "Retrieve Document"
* action = #R
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "consumer, responder, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentConsumer 1..1 and
    documentResponder 1..1
* agent[documentConsumer].type 1..
* agent[documentConsumer].type = $DCM#110153 "Source Role ID"
* agent[documentConsumer].who 1..
* agent[documentConsumer].network 1..
* agent[documentResponder] obeys val-audit-source
* agent[documentResponder].type 1..
* agent[documentResponder].type = $DCM#110152 "Destination Role ID"
* agent[documentResponder].who 1..
* agent[documentResponder].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    documentUniqueId 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[documentUniqueId].what.reference 1..
* entity[documentUniqueId].type 1..
* entity[documentUniqueId].type = $audit-entity-type#2 "System Object"
* entity[documentUniqueId].role = $object-role#3 "Report"

Profile: FolderComprehensive
Parent: Folder
Id: IHE.MHD.Comprehensive.Folder
Title: "MHD Folder Comprehensive"
Description: """A profile on the List resource for MHD Comprehensive Metadata Folder. Note UnContained has no impact on Folder.
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR List for use as a Folder implementation of the 
- ebRIM implementation at [3:4.2.3.4 Folder Attributes](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.4).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* extension[designationType] 1..
* title 1..
* subject 1..

Profile: ProvideDocumentBundleResponse
Parent: Bundle
Id: IHE.MHD.ProvideDocumentBundleResponse
Title: "MHD Provide Document Bundle Response"
Description: """A profile on the Bundle transaction-response for ITI-65 Provide Document Bundle response.

- shall be a transaction response
- shall have at least 1 entry for each entry in the request, in the same order as received in the request
  - entry response location must be indicated"""
* ^version = "4.0.2"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* type = #transaction-response
* entry 1..
* entry ^short = "One entry for each entry in the request, in the same order as received"
* entry.response 1..
* entry.response ^short = "Indicating the results of processing the entry"
* entry.response.location 1..

Profile: UnContainedComprehensiveDocumentReference
Parent: MinimalDocumentReference
Id: IHE.MHD.UnContained.Comprehensive.DocumentReference
Title: "MHD DocumentReference Comprehensive UnContained References Option"
Description: """A profile on the DocumentReference resource for MHD with Comprehensive Metadata Option but without a requirement for contained author, authenticator, or sourcePatientInfo. 
- MHD is based on the [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) model, 
- the [3:4.1 Abstract Metadata Model](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.1.html#4.1), and 
- the use defined here is FHIR DocumentReference implementation of the 
- ebRIM implementation at [3:4.2.3.2 Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2).
- with use-cases and constraints found in [3:4.3 Additional Document Sharing Requirements](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)"""
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* type 1..
* category 1..
* subject 1..
* date 1..
* securityLabel 1..
* content.attachment.language 1..
* content.attachment.creation 1..
* content.format 1..
* context 1..
* context.facilityType 1..
* context.practiceSetting 1..
* context.sourcePatientInfo 1..

Profile: AuditProvideBundleSource
Parent: AuditEvent
Id: IHE.MHD.ProvideBundle.Audit.Source
Title: "Audit Event for Provide Bundle Transaction at Source"
Description: """Defines constraints on the AuditEvent Resource to record when a Provide Bundle Transaction happens at the Source.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"""
* ^version = "4.0.2"
* ^status = #active
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://ihe.net"
* ^contact[0].telecom[1].system = #email
* ^contact[0].telecom[1].value = "secretary@ihe.net"
* ^contact[1].name = "John Moehrke"
* ^contact[1].telecom[0].system = #email
* ^contact[1].telecom[0].value = "JohnMoehrke@gmail.com"
* ^contact[1].telecom[0].use = #work
* ^jurisdiction[0] = $m49.htm#001
* ^copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* modifierExtension ..0
* type = $DCM#110106 "Export"
* subtype = urn:ihe:event-type-code#ITI-65 "Provide Document Bundle"
* action = #R
* outcome 1..
* outcomeDesc MS
* agent ^slicing.discriminator[0].type = #pattern
* agent ^slicing.discriminator[0].path = "type"
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent ^slicing.rules = #open
* agent contains
    documentSource 1..1 and
    documentRecipient 1..1
* agent[documentSource] obeys val-audit-source
* agent[documentSource].type 1..
* agent[documentSource].type = $DCM#110153 "Source Role ID"
* agent[documentSource].who 1..
* agent[documentSource].network 1..
* agent[documentRecipient].type 1..
* agent[documentRecipient].type = $DCM#110152 "Destination Role ID"
* agent[documentRecipient].who 1..
* agent[documentRecipient].network 1..
* entity ..2
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[0].path = "type"
* entity ^slicing.description = "patient and submission set involved"
* entity ^slicing.rules = #closed
* entity contains
    patient 1..1 and
    submissionSet 1..1
* entity[patient].what 1..
* entity[patient].what only Reference(Patient)
* entity[patient].type 1..
* entity[patient].type = $audit-entity-type#1 "Person"
* entity[patient].role = $object-role#1 "Patient"
* entity[submissionSet].what 1..
* entity[submissionSet].what only Reference(List)
* entity[submissionSet].type 1..
* entity[submissionSet].type = $audit-entity-type#2 "System Object"
* entity[submissionSet].role = $object-role#20 "Job"