ValueSet: MHDlistTypesVS
Id: MHDlistTypesVS
Title: "MHD List Types ValueSet"
Description: "ValueSet of the MHD List Types allowed"
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
* MHDlistTypes#folder
* MHDlistTypes#submissionset

ValueSet: MHDprovidePatientActions
Id: MHDprovidePatientActions
Title: "MHD Patient Types ValueSet"
Description: "A ValueSet of the allowed actions in a ITI-65 Provide Document Bundle for the Patient type Resource. Where Patient would typically be indicated as a GET (read), but might be created or updated depending on policy."
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
* HTTPVerb#GET
* HTTPVerb#POST
* HTTPVerb#PUT

ValueSet: MHDprovideFolderActions
Id: MHDprovideFolderActions
Title: "MHD Folder List Types ValueSet"
Description: "A ValueSet of the allowed actions in a ITI-65 Provide Document Bundle for the Folder List type Resources. Where Folders are allowed to be Updated in addition to Created."
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
* HTTPVerb#POST
* HTTPVerb#PUT