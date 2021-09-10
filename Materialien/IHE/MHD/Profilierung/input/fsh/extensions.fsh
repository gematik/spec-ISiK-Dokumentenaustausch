Extension: SourceId
Id: ihe-sourceId
Title: "Publisher organization identity of the SubmissionSet"
Description: "The globally unique, immutable, identifier of the entity that contributed the SubmissionSet. When a broker is involved in sending SubmissionSets from a collection of client systems, it shall use a different sourceId for submissions from each separate system to allow for tracking. The format of the identifier is an OID."
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
* . ^short = "Publisher organization identity of the SubmissionSet"
* . ^definition = "The globally unique, immutable, identifier of the entity that contributed the SubmissionSet. When a broker is involved in sending SubmissionSets from a collection of client systems, it shall use a different sourceId for submissions from each separate system to allow for tracking. The format of the identifier is an OID."
* value[x] only Identifier

Extension: DesignationType
Id: ihe-designationType
Title: "Clinical code of the List"
Description: "Expresses contentType of submissionSet or the codeList of a Folder. Usually expressed in LOINC or SNOMED."
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
* . ^short = "Clinical code of the List"
* . ^definition = "Expresses contentType of submissionSet or the codeList of a Folder. Usually expressed in LOINC or SNOMED."
* value[x] only CodeableConcept

Extension: IntendedRecipient
Id: ihe-intendedRecipient
Title: "Intended recipient of the SubmissionSet"
Description: "holds the identity of the organization or person the SubmissionSet is intended. For XDR and eMail (e.g. Direct) this tends to be a Practitioner or Patient with a telecom holding an email, but this is not strictly required."
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
* . ^short = "Intended recipient of the SubmissionSet"
* . ^definition = "holds the identity of the organization or person the SubmissionSet is intended. For XDR and eMail (e.g. Direct) this tends to be a Practitioner or Patient with a telecom holding an email, but this is not strictly required."
* value[x] only Reference(Practitioner or Organization or Patient or RelatedPerson or Group or Device or Location)

Extension: AuthorOrg
Id: ihe-authorOrg
Title: "Author organization of the SubmissionSet"
Description: "When the author of the SubmissionSet is an Organization, this extension shall be used."
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
* . ^short = "Author organization of the SubmissionSet"
* . ^definition = "When the author of the SubmissionSet is an Organization, this extension shall be used."
* value[x] only Reference(Organization)