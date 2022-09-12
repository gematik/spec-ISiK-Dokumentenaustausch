## Interaktion: Dokumentenbereitstellung
### Herstellung von Patient- und Encounterkontext
Vor der Bereitstellung von Dokumenten muss ein Client einen Patienten- und Encounterkontext herstellen, damit das Dokument serverseitig anhand der Patient- und Encounter-Verlinkungen in der DocumentReference korrekt zugeordnet werden kann.
Zur Herstellung des Kontextes sind folgende Verfahren möglich:

1. **SMARTApp Launch**: Wenn der Aufruf der App im Rahmen des SMART-Frameworks erfolgt, kennt der Client bereits beim Start den aktuellen Patienten- und ggf. den Encounterkontext. Dabei wählt ein Anwender im Primärsystem (Server) einen Patienten und Fall aus und startet in diesem Kontext die App. Referenzen auf Patient und Encounter werden im Zuge der Authorisierung vom Server an Client übermittelt. (Siehe Modul [Sicherheit - Launch Context und Scopes](https://simplifier.net/guide/isik-sicherheit/ImplementationGuide-markdown-ScopesAndLaunchContext?version=current)). 
2. **Bekannte Fallnummer**: Der Client kennt die (Abrechnungs-)Fallnummer (z.B. durch das Einscannen eines Barcodes, oder beim Mapping von V2 auf FHIR aus PV1.#19). Der Client sucht den Encounter anhand der Fallnummer (`[base]/Encounter?account:identifier=<Fallnummer>`). Da unter einer Abrechnungs-Fallnummer mehrere Encounter (Besuche) zusammengefasst werden können (z.B. vorstationär + stationär + nachstationär), sollte als zusätzliches Suchkriterium entweder ein Datum/Zeitraum oder eine Selektion auf `Encounter.status` verwendet werden. Wenn ein zutreffender Encounter gefunden wurde, kann der Patientenkontext aus der subject-Referenz des Encounters entnommen werden. 
3. **Arbeitsliste**: Der Client ruft auf dem Server eine Arbeitsliste ab (z.B. Liste aller Encounter, die aktuell auf einer bestimmten Station/Ambulanz stattfinden, Liste aller ServiceRequests/Tasks, die durch den Client abgearbeitet werden müssen (aktuell noch nicht im Scope der ISiK-Spezifikationen!) und etabliert den Kontext, nachdem der Benutzer einen Eintrag der Liste ausgewählt hat.
4. **Manuelle Auswahl**. Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/implementierungsleitfadenisik-basismodul/ImplementationGuide-markdown-Datenobjekte-Datenobjekte-Patient?version=current#ImplementationGuide-markdown-Patient-Patient-Interaktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet der Client, mithílfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/implementierungsleitfadenisik-basismodul/ImplementationGuide-markdown-Datenobjekte-Datenobjekte-Kontakt?version=current#I-markdown-KontaktGesundheitseinrichtung-Kontakt-Interaktionen), die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand von `Encounter.period`, `Encounter.class` und/oder `Encounter.status` gefiltert werden). Der Anwender wählt den zutreffenden Encounter aus.

| Hinweis | Gefahr fehlerhafter Zuordnung!|
|---------|---------------------|
| {{render:ImplementationGuide-Images-ig-bilder-Warning}} | Die manuelle Auswahl von Patienten- und Fallkontext durch einen Benutzer ist fehleranfällig. Clients müssen geeigente Vorkehrungen und Plausibilitätsprüfungen implementieren um Falschzuordnungen zu verhindern.|

### Dokumentenübermittlung
Die Übermittlung des Dokumentes vom Client an den Server erfolgt mithílfe der `$submit-document` Operation.

**Hinweis:** Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE MHD-Implementierungsleitfaden sieht für die Dokumentenbereitstellung ein 
Transaction-Bundle mit POST-Interaktionen vor. 
Aus Gründen, die [in der diesbezüglichen Diskussion im internationalen FHIR-Chat](https://chat.fhir.org/#narrow/stream/179223-ihe/topic/MHD.20update.20and.20status) 
nachzulesen sind, ist dieses Vorgehen jedoch zu hinterfragen und wird seitens IHE voraussichtlich in künftigen MHD-Versionen geändert.
Siehe hierzu Kapitel {{pagelink:ImplementationGuide/markdown/DocumentReference_Kompatibilitaet.md}}

Um den hier erarbeiteten Vorschlag einer Dokumentenübermittlung mittels Operations der internationalen FHIR-Community im Allgemeinen und IHE im Besonderen vorstellen zu können, in der Hoffnung und Erwartung, dass diese dem Vorgehen folgen, wird dieser Teil der ISiK-Spezifikation ausnahmsweise auf Englisch spezifiziert.

#### OperationDefinition `$submit-document`

{{render:submit-document}}

#### In-Parameters-Profil (ISiK)

{{render:submitdocumentinput}}
@```from
	StructureDefinition
where 
    url = 'https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/SubmitDocumentInput' 
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```

#### Out-Parameters-Profil (ISiK)

{{render:submitdocumentoutput}}
@```from
	StructureDefinition
where 
    url = 'https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/SubmitDocumentOutput' 
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```

#### Beispiel:
**Hinweis:** Die Binary-Ressourcen sind der Lesbarkeit halber verkürzt dargestellt!
##### Request
`POST [base]/$submit-document`
{{json:resources-fsh-generated-resources-parameters-submit-document-in-params}}
##### Response
{{json:resources-fsh-generated-resources-parameters-submit-document-out-params}}







