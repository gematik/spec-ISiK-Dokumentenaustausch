## Interaktion: Dokumentenbereitstellung
### Herstellung von Patient- und Encounterkontext
Vor der Bereitstellung von Dokumenten muss ein Client einen Patienten- und Encounterkontext herstellen, damit das Dokument serverseitig anhand der Patient- und Encoutner-Verlinkungen in der DocumentReference korrekt zugeordnet werden kann.
Zur Herstellung des Kontextes sind folgende Verfahren möglich:

1. **SMARTApp Launch**: Wenn der Aufruf der App im Rahmen des SMART-Frameworks erfolgt, kennt der Client bereits beim Start den aktuellen Patienten- und ggf. den Encounterkontext. Dabei wählt ein Anwender im Primärsystem (Server) einen Patienten und Fall aus und startet in diesem Kontext die App. Referenzen auf Patient und Encounter werden im Zuge der Authorisierung von Server an Client übermittelt. (Siehe Modul [Sicherheit - Launch Context und Scopes](https://simplifier.net/guide/ImplementierungsleitfadenISiK-Sicherheit/ScopesAndLaunchContext)). 
2. **bekannte Fallnummer**: Der Client kennt die Fallnummer (z.B. durch das Einscannen eines Barcodes, oder beim Mapping von V2 auf FHIR aus  PV1.#19). Der Client sucht den Encounter anhand der Fallnummer (`/Encounter?account:identifier=<Fallnummer>` bzw. `/Encounter.account.identifier=<Fallnummer>`). Da unter einer Fallnummer mehrere Encounter zusammengefasst werden können, sollte als zusätzliches Suchkriterium entweder ein Datum/Zeitraum oder eine Selektion auf den Status "in-progress" verwendet werden. Wenn ein eindeutiges Ergebnis gefunden wurde, kann der Patientenkontext aus der subject-Referenz des Encounters entnommen werden. 
3. **Arbeitsliste**: Der Client ruft auf dem Server eine Arbeitsliste ab (z.B. Liste aller Encounter, die aktuell auf einer bestimmten Station/Ambulanz stattfinden, Liste aller ServiceRequests/Tasks, die durch den Client abgearbeitet werden müssen (aktuell noch nicht im Scope der ISiK-Spezifikationen!!) und etabliert den Kontext nachdem der Benutzer einen Eintrag der Liste ausgewählt hat.
4. **manuelle Auswahl**. Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/PatientPatient#PatientInteraktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet der Client mit Hilfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/KontaktFallEncounter#Interaktionen) die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand eines Zeitfensters, der Fallart oder der Encounter-Ebene (Einrichtungskontakt oder Abteilungskontakt) gefiltert werden.) Der Anwender wählt den zutreffenden Encounter aus.

| Hinweis | Gefahr fehlerhafter Zuordnung!|
|---------|---------------------|
| {{render:Warning}} | Die manuelle Auswahl von Patienten- und Fallkontext durch einen Benutzer ist fehleranfällig. Clients müssen geeigente Vorkehrungen und Plausibilitätsprüfungen implementieren um Falschzuordnungen zu verhindern.|

### Dokumentenübermittlung
Die Übermittlung des Dokumentes vom Client an den Server erfolgt mit Hilfe der `$submit-document` Operation.

**Hinweis:** Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht für die Dokumentenbereitstellung ein 
Transaction-Bundle mit POST-Interaktionen vor. 
Aus Gründen, die [in der diesbezüglichen Diskussion im internationalen FHIR-Chat](https://chat.fhir.org/#narrow/stream/179223-ihe/topic/MHD.20update.20and.20status) 
nachzulesen sind, ist dieses Vorgehen jedoch zu hinterfragen und wird seitens IHE voraussichtlich in künftigen MHD-Versionen geändert.

Um den hier erarbeiteten Vorschlag einer Dokumentenübermittlung mittels Operations der internationalen FHIR-Community im allgemeinen und 
IHE im besonderen vorstellen zu können, in der Hoffnung und Erwartung, dass diese dem Vorgehen folgen, wird dieser Teil der ISiK-Spezifikation 
ausnahmsweise auf Englisch spezifiziert.

#### OperationDefinition `$submit-document`

{{render: ISiK-Dokumentenaustausch/submit-document}}

#### In-Parameters Definition (ISiK)

{{render: ISiK-Dokumentenaustausch/submitdocumentinput}}

#### Out-Parameters Definition (ISiK)

{{render: ISiK-Dokumentenaustausch/submitdocumentoutput}}

#### Beispiel:
**Hinweis:** Die Binary-Ressourcen sind der Lesbarkeit halber verkürzt dargestellt!
##### Request
`POST [base]/$submit-document`
{{xml: ISiK-Dokumentenaustausch/parameters-example}}
##### Response
{{xml: ISiK-Dokumentenaustausch/parameters-example-out}}


#### Hinweise zur Extraktion des HTML-Narratives

Die menschenlesbare Repräsentation ("Narrative") eines Dokumentes setzt sich zusammen aus dem Inhalt von 'Composition.text', einer Repräsentation der Metadaten (z.B. Dokumenttyp, Patientenname, Patientennummer, Aufnahmenummer, datum) sowie der Aggregation der Inhalte von 'Composition.section', wobei zu beachten ist, dass ein Dokument beliebig viele Sections und Sub-Sections haben kann.
Die einzelnen Bestandteile des Narratives KÖNNEN mit \<div\>-Elementen zusammengefügt werden.



