CodeSystem: MHDlistTypes
Id: MHDlistTypes
Title: "MHD List Types"
Description: "To use the List resource for two different use-cases we define a code-system with the types of List needed in MHD"
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
* ^content = #complete
* ^count = 2
* #folder "Folder as a FHIR List"
* #submissionset "SubmissionSet as a FHIR List"