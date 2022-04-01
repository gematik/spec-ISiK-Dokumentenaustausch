Alias: $LocationPhysicalType = http://terminology.hl7.org/CodeSystem/location-physical-type
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Instance: BeispielBesuch
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* status = #in-progress
* class = $v3-ActCode#IMP
* type[0] = $kontaktart-de#operation
* type[+] = $Kontaktebene#versorgungsstellenkontakt
* serviceType = $FachabteilungsschluesselCS#0100
* subject = Reference(PatientinMusterfrau)
* period.start = "2022-04-12"
* account = Reference(AbrechnungsfallAmbulant)
* account.idenitifer
  * type = $v2-0203#VN
  * system = "https://test.krankenhaus.de/fhir/sid/fallnr"
  * value = "0123456789"
* location.physicalType = $LocationPhysicalType#bd "Bed"
* location.location.identifier.system = "https://test.krankenhaus.de/fhir/sid/locationid"
* location.location.identifier.value = "123"
* location.location.display = "Bett 123"
* serviceProvider.identifier.system = "https://test.krankenhaus.de/fhir/sid/fachabteilungsid"
* serviceProvider.identifier.value = "XYZ"
* serviceProvider.display = "Fachabteilung XYZ"