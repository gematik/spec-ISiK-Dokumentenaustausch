### Anmerkungen zu Must-Support-Feldern

@```from
	StructureDefinition
where 
    url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenMetadaten'
for differential.element
select
	path, short, mustSupport, comment```

### `DocumentReference.masterIdentifier`
**Bedeutung:**
Eindeutige Dokumenten-ID (OID) 

### `DocumentReference.status`

**Bedeutung:** Status des Dokumentenmetadatensatzes (Der Status des Dokumentes selbst wird in DocumentReference.docStatus gesetzt!)

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.status)

### `DocumentReference.type`

**Bedeutung:** Dokumenttyp, codiert mit der [klinischen Dokumentenklassenliste (KDL)](https://simplifier.net/kdl)

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.type)

### `DocumentReference.subject`

**Bedeutung:** Patientenbezug des Dokumentes

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.subject)

### `DocumentReference.author`

**Bedeutung:** Bezug zum Author des Dokumentes

**Hinweise:** 

### `DocumentReference.securityLabel`

**Bedeutung:** Vertraulichkeit des Dokumentes

**Hinweise:** 

### `DocumentReference.context.facilityType`

**Bedeutung:** Art der Einrichtung, in der das Dokument erstellt wurde

**Hinweise:** 

### `DocumentReference.context.practiceSetting`

**Bedeutung:** Fachabteilungskontext, in dem das Dokument erstellt wurde.
Ein Mapping der §301-Fachabteilungscodes auf die IHE-DE-codes befindet sich im [IHE/HL7-Wiki](https://wiki.hl7.de/index.php?title=Ihevs:DocumentEntry.PracticeSettingCode)

**Hinweise:** 