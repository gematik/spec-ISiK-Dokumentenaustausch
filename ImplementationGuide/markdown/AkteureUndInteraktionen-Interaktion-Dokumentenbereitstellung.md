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
| Hinweis | Breaking Change!|
|---------|---------------------|
| {{render:ImplementationGuide-Images-ig-bilder-Warning}} | Die in dieser Version erfolgte Umstellung der Interaktion von der $submit-document-Operation auf eine REST-basierte CREATE-Interaktion ist nicht kompatibel zum vorherigen Release. Die Änderung dient dem Zweck der Harmonisierung mit zwischenzeitlich erfolgten Änderungen in der zugrundeliegenden IHE-MHD-Spezifikation.  |

#### CREATE-Interaktion 

Die Übermittlung des Dokumentes vom Client an den Server erfolgt mittels einer [CREATE-Interaktion](http://hl7.org/fhir/http.html#create) auf der Ressource DocumentReference. Das anzulegende Dokument wird im Body der Interaktion übermittelt.
`POST [base]/DocumentReference`
{{json:dok-beispiel-client-with-binary-pdf-example-short}}

**Hinweis:** Die Binary-Ressourcen sind der Lesbarkeit halber verkürzt dargestellt!

#### Erwartetes Verhalten des Clients
* Der Client muss sicherstellen, dass `DocumentReference.subject` und `DocumentReference.encounter` gültige Links auf serverseitig vorhandene Ressourcen enthalten
* Der Client muss das eigentliche Dokument (PDF, JPEG o.ä.) base64-codiert in `DocumentReference.content.attachment.data` einbetten und den Mime-Type des Dokumentes in `DocumentReference.content.attachment.dataType` adäquat setzen.

#### Erwartetes Verhalten des Servers
* Der Server MUSS das eingebettete Dokument aus der DocumentReference herauslösen, separat persistieren und in `DocumentReference.content.attachemnt.url` auf das separierte Dokument verweisen. Beim Abruf einer DocumentReference, bzw. bei der Suche nach DocumentReference-Ressourcen darf das Dokument niemals eingebettet an den Client zurückgegeben werden. Das Dokument muss über den Binary-Endpunkt der API abrufbar gemacht werden.
<!-- If the submission contains a structured FHIR document-Bundle, Servers MAY chose to store additional representations of the document,
e.g. native FHIR (XML and/or JSON) for FHIR aware Clients and/or an HTML-Document representing the document's narrative to allow easy read access for FHIR agnostic clients. 
The Binary representation mostly serves the purpose of archiving an immutable version of the document, rather than making it available to other consumers!
If Servers can provide multiple representations of the same document, this SHOULD be reflected in multiple `content`-elements in the DocumentReference with the 
-->
* If a Client submits a DocumentReference which includes a `relatesTo`-Element, the Server SHALL process the submission in accordance with `relatesTo.code` as either a 
replacement, transformation, appendix or a signature of the document referenced in `relatesTo.target`. If applicable, Servers SHALL update 
the `status` of the related DocumentReference to `superseded`. 
* Servers SHALL return HTTP 412 (precondition failed) the `relatesTo.target` reference does not resolve on the server.
* Servers SHALL ignore any information submitted by the Client in `DocumentReference.content.attachment.url` and assume the content to be the Binary submitted with the `payload`parameter.
* Servers SHALL adjust the `content`-element to reflect how and where the document has been stored by the server.
"







