### Anmerkungen zu Must-Support-Feldern

@```from
	StructureDefinition
where 
    url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenMetadaten' 
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```