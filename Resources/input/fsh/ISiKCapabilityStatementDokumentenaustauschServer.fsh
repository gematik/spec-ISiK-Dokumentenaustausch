Instance: ISiKCapabilityStatementDokumentenaustauschServer
InstanceOf: CapabilityStatement
Usage: #definition
* description =
  "Dieses CapabilityStatement beschreibt alle Interaktionen, die ein ISiK-konformes System unterstützen MUSS bzw. KANN,
  um das Bestätigungsverfahren für dieses Modul zu bestehen.

  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.
Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden.
Der `MODE`-Parameter kann ignoriert werden.
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`).
Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN,
wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.

Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen
und die Versionsnummer angeben.
Darüber hinaus MUSS in `CapabilityStatement.instantiates` die Canonical URL des nachfolgenden CapabilityStatements angegeben werden.

Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement mit `SHALL` gekennzeichnet sind.
Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten,
sofern diese in der Instanz implementiert wurden.

Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich."
* insert Meta-Inst
* insert Meta-CapabilityStatement
* name = "ISiKCapabilityStatementDokumentenaustauschServer"
* title = "ISiK CapabilityStatement Dokumentenaustausch Server"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server

* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #Patient
  * supportedProfile = "https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKPatient"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #search-type
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "identifier"
    * definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
    * type = #token
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "birthdate"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
    * type = #date
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "gender"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
    * type = #token

* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #Encounter
  * supportedProfile = "https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #search-type
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "identifier"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-identifier"
    * type = #token
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "status"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-status"
    * type = #token  
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "class"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-class"
    * type = #token
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference
  * searchParam[+]
    * insert Expectation (#MAY)
     // Kommentar zur Festlegung mit MAY: Da die Implementierung von subject als Suchparameter vom Typ Reference komplex ist, wird hier im Sinne der Übergreifenden Festlegung eine Umsetzung nicht zwingend erfordert.
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-subject"
    * type = #reference
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "part-of"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-part-of"
    * type = #reference
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "date"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-date"
    * type = #date
  
* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #DocumentReference
  * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten"
    * insert Expectation (#SHALL)
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #create
    * documentation = "siehe {{pagelink:Dokumentenbereitstellung}}"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
    * documentation = "siehe {{pagelink:Dokumentenabfrage}}"
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #search-type
  * insert CommonSearchParameters

  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "status"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?status=final`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Clients und Server verpflichend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?patient=Patient/123`
        `GET [base]/DocumentReference?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`
        `GET [base]/DocumentReference?patient.identifier=1032702`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).
        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der FHIR-Kernspezifikation - Abschnitt [Chained Parameters](https://hl7.org/fhir/R4/search.html#chaining).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Clients und Server verpflichend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?type=http://dvmd.de/fhir/CodeSystem/kdl|AD010101`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "category"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
    * type = #token
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?category=http://ihe-d.de/CodeSystem/IHEXDSclassCode|BEF`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).
        Dieser Suchparameter ist für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "creation"
    * definition = "https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
    * type = #date
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?creation=2021-11-05`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).
        Dieser Suchparameter ist Teil der IHE-MHD-Spezifikation und für die Umsetzung des IHE MHD Profils für Server verpflichtend."
  * searchParam[+]
    * insert Expectation (#SHALL)
    * name = "encounter"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
    * type = #reference
    * documentation =
        "**Beispiel:**
        `GET [base]/DocumentReference?encounter=Encounter/123`
        **Anwendungshinweis:**
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  
        
        Der verkettete Suchparameter "encounter.account:identifier" (zur Suche anhand der Abrechnungsfallnummer) MUSS unterstützt werden:

        Beispiele:

        ```GET [base]/DocumentReference?encounter.account:identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867```

      	```GET [base]/DocumentReference?encounter.account:identifier=7567867```

        Anwendungshinweise: Weitere Informationen zur Suche nach Reference-type Parametern, insbesondere in Verbindung mit dem `:identifier`-Modifier finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/R4/search.html#reference).

	Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt "Chained Parameters"](https://hl7.org/fhir/R4/search.html#chaining)."
  * searchInclude[+] = "DocumentReference:patient"
    * insert Expectation(#SHALL)
  * searchInclude[+] = "DocumentReference:encounter"
    * insert Expectation(#SHALL)

  * operation[+]
    * insert Expectation (#MAY)
    * name = #update-metadata
    * definition = Canonical(UpdateMetadata)
  * operation[+]
    * insert Expectation (#MAY)
    * name = #generate-metadata
    * definition = "https://profiles.ihe.net/ITI/MHD/OperationDefinition/generate-metadata"


* rest.resource[+]
  * insert Expectation (#SHALL)
  * type = #Binary
  * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBinary"
    * insert Expectation (#SHALL)
  * interaction[+]
    * insert Expectation (#SHALL)
    * code = #read
    * documentation = "Für die Ressource Binary MUSS die REST-Interaktion `read` implementiert werden.
    Es MÜSSEN die Regeln aus der FHIR-Kernspezifikation zur Abfrage einer Binary Ressource beachtet werden.
    Siehe [Serving Binary Resources using the RESTful API](https://www.hl7.org/fhir/R4/binary.html#rest).

    Um die Handhabung der base64-kodierten Binary-Ressourcen clientseitig zu erleichtern,
    MUSS ein bestätigungsrelevantes System (Server) bei READ-Interaktionen Accept-Header
    mit einem Wert außer den [FHIR-Mime-Types](https://www.hl7.org/fhir/R4/http.html#mime-type) unterstützen.
    Falls ein solcher Accept-Header durch einen Client verwendet wird, MUSS  bestätigungsrelevante System (Server)
    das Binary in seiner nativen Form (definiert durch Binary.contentType) zurückgeben."

