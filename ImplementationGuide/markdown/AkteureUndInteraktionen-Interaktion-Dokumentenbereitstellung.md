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

### Dokumentenübermittlung (IHE MHD ITI-105 (Simplified Publish))

Die Dokumentenübermittlung erfolgt mittels [IHE MHD ITI-105 (Simplifierd Publish)](https://profiles.ihe.net/ITI/MHD/ITI-105.html)

Die Übermittlung des Dokumentes vom Client an den Server erfolgt mittels einer [CREATE-Interaktion](http://hl7.org/fhir/http.html#create) auf dem Ressourcentyp DocumentReference. Das anzulegende Dokument wird im Body der Interaktion übermittelt.

| Hinweis | Breaking Change!|
|---------|---------------------|
| {{render:ImplementationGuide-Images-ig-bilder-Warning}} | Die in dieser Version erfolgte Umstellung der Interaktion von der $submit-document-Operation auf eine REST-basierte CREATE-Interaktion ist nicht kompatibel zu den Festlegungen dieses Module in Stufe 2! Die Änderung dient dem Zweck der Harmonisierung mit der IHE-MHD-Interaktion ITI-105 (Simplified Publish), die zum Zeitpunkt des Releases von Stufe 2 noch nicht zur Verfügung stand.  |

#### Maßgebliche Änderungen gegenüber Stufe 2 für den Client
* Der Client muss das eigentliche Dokument (PDF, JPEG o.ä.) base64-codiert in `DocumentReference.content.attachment.data` einbetten und den Mime-Type des Dokumentes in `DocumentReference.content.attachment.dataType` adäquat setzen
* Die Übermittlung erfolgt mittels POST auf den Endpunkt `[base]/DocumentReference` anstatt wie bisher mittels POST auf den Endpunkt `[base]\DocumentReference\$submit-document`
* Die DocumentReference-Ressource mit den eingebetteten Binärdaten wird nun unmittelbar im Body der Interaktion gesendet. Die Notwendigkeit, DocumentReference und Binary in eine Parameters-Ressource zu wrappen, entfällt damit.
* Die Antwort des Servers erfolgt in Form einer DocumentReference-Ressource (im Erfolgsfall) bzw. einer OperationOutcome-Ressource im Fehlerfall anstelle wie bisher einer Parameters-Ressource.

#### Maßgebliche Änderungen gegenüber Stufe 2 für den Server
* Die DocumentReference-Ressource mit den eingebetteten Binärdaten wird nun unmittelbar im Body der Interaktion gesendet. Die Notwendigkeit, DocumentReference und Binary aus der Parameters-Ressource zu extrahieren, entfällt damit.
* Die Übermittlung erfolgt mittels POST auf den Endpunkt `[base]/DocumentReference` anstatt wie bisher mittels POST auf den Endpunkt `[base]\DocumentReference\$submit-document`
* Der Server MUSS das eingebettete Dokument aus der DocumentReference herauslösen, separat persistieren und in `DocumentReference.content.attachemnt.url` auf das separierte Dokument verweisen. Beim Abruf einer DocumentReference, bzw. bei der Suche nach DocumentReference-Ressourcen darf das Dokument niemals eingebettet an den Client zurückgegeben werden. Das Dokument muss über den Binary-Endpunkt der API abrufbar gemacht werden.
* Die Antwort des Servers erfolgt in Form einer DocumentReference-Ressource (im Erfolgsfall) bzw. einer OperationOutcome-Ressource im Fehlerfall anstelle wie bisher einer Parameters-Ressource.

### Hinweise und Anmerkungen zur Implementierung von ITI-105 (Simplified Publish) im Kontext von ISiK

#### [2:3.105.4.1 Simplified Publish Request Message](https://profiles.ihe.net/ITI/MHD/ITI-105.html#2310541-simplified-publish-request-message)

##### [2:3.105.4.1.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105411-trigger-events)
Die Vereinbarungen gelten uneingeschränkt

##### [2:3.105.4.1.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105412-message-semantics)
* Die übermittelte Ressource muss nur gegen das Profil "ISiKDokumentenMetadaten" valide sein, nicht gegen die IHE-DocumentReference-Profile, da die Übermittlung des Elementes `DocumentReference.docStatus` im ISiK-Kontext erlaubt, im IHE-Kontext jedoch verboten ist.

##### [2:3.105.4.1.2.1 DocumentReference Resources](2:3.105.4.1.2.1 DocumentReference Resources)
* Die DocumentReference-Ressoucen müssen im ISiK-Kontext auf Basis des Profils "ISiKDokumentenMetadaten" und den dort vereinbarten Kardinalitäten bzw. MustSupport-Flags erstellt werden.
* Die Verwendung von Contained-Ressourcen ist im ISiK-Kontext nicht erlaubt

##### [2:3.105.4.1.2.2 Patient Identity](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054122-patient-identity)
* Der Client MUSS eine der im  Kapitel "Herstellung von Patient- und Enocunterkontext" beschriebenen Optionen verwenden, um den Patienten- und Encounter-Kontext zu etablieren.
* Logische Referenzen für Patient und Encounter sind im ISiK-Kontext nicht erlaubt
* `DocumentReference.sourcePatientInfo` wird im ISiK-Kontext nicht verwendet
##### [2:3.105.4.1.2.3 Replace, Transform, Signs, and Append Associations](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054123-replace-transform-signs-and-append-associations)
Die Vereinbarungen gelten uneingeschränkt

##### [2:3.105.4.1.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105413-expected-actions)
Die Erzeugung einer SubmisstionSet Ressource durch den Server ist im ISiK-Kontext nicht erforderlich. 

##### [2:3.105.4.1.3.1 Grouping with Actors in other Document Sharing Profiles](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054131-grouping-with-actors-in-other-document-sharing-profiles)
Das Kapitel ist für den ISiK-Kontext nicht relevant

#### [2:3.105.4.2 Simplified Publish Response Message](https://profiles.ihe.net/ITI/MHD/ITI-105.html#2310542-simplified-publish-response-message)

##### [2:3.105.4.2.1 Trigger Events](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105421-trigger-events)
Die Vereinbarungen gelten uneingeschränkt
 
##### [2:3.105.4.2.2 Message Semantics](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105422-message-semantics)
Die Vereinbarungen gelten uneingeschränkt

##### [2:3.105.4.2.3 Expected Actions](https://profiles.ihe.net/ITI/MHD/ITI-105.html#23105423-expected-actions)
Die Vereinbarungen gelten uneingeschränkt

#### [2:3.105.4.3 CapabilityStatement Resource](https://profiles.ihe.net/ITI/MHD/ITI-105.html#2310543-capabilitystatement-resource)
Es gelten die Vereinbarungen gemäß {{pagelink:ImplementationGuide-markdown-CapabilityStatement}}

### [2:3.105.5 Security Considerations](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231055-security-considerations)
Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Sicherheit](https://simplifier.net/spec-isik-sicherheit)


### Beispiel

`POST [base]/DocumentReference`
{{json:dok-beispiel-client-with-binary-pdf-example-short}}

**Hinweis:** Die Binary-Ressourcen sind der Lesbarkeit halber verkürzt dargestellt!







