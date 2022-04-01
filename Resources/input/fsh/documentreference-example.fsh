Instance: dok-beispiel-server
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
//* meta.profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.DocumentReference"
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
//* identifier.system = "urn:ietf:rfc:3986"
//* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* status = #current
* category = $ihe-de-class#BEF "Befundbericht"
* type.coding[+] = $ihe-de-type#PATH "Pathologiebefundberichte"
* type.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(BeispielPatient)
//* date = "2020-12-31T23:50:50-05:00"
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.language = #de
* content.attachment.url = "http://example.com/Binary/12345"
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = $sct#408467006
* context.encounter = Reference(BeispielBesuch)
//* context.sourcePatientInfo = Reference(Patient/ex-patient)
//* context.event.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"

Instance: dok-beispiel-client
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
//* meta.profile = "http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.DocumentReference"
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
//* identifier.system = "urn:ietf:rfc:3986"
//* identifier.value = "urn:uuid:0c287d32-01e3-4d87-9953-9fcc9404eb21"
* status = #current
//* category = $ihe-de-class#BEF "Befundbericht"
//* type.coding[+] = $ihe-de-type#PATH "Pathologiebefundberichte"
* type.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(BeispielPatient)
//* date = "2020-12-31T23:50:50-05:00"
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.language = #de
* content.attachment.url = "Binary/12345"
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = $sct#408467006
* context.encounter = Reference(BeispielBesuch)
