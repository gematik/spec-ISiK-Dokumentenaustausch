Instance: BeispielPatient
InstanceOf: ISiKPatient
Usage: #example
* identifier[+].type = $v2-0203#MR
* identifier[=].system = "https://fhir.krankenhaus.example/NamingSystem/PID"
* identifier[=].value = "TestPID"
* active = true
* name[0].use = #official
* name[=].family = "Musterfrau"
* name[=].given = "Erika"
* name[=].prefix = "Dr."
  * extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
  * extension.valueCode = #AC
* name[+].use = #maiden
* name[=].family = "Gabler"
* gender = #female
* birthDate = "1964-08-12"