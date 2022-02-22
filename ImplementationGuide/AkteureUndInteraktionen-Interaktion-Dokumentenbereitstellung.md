## Interaktion: Dokumentenbereitstellung
### Herstellung von Patient- und Encounterkontext
Vor der Bereitstellung von Dokumenten muss ein Client einen Patienten- und Encounterkontext herstellen, damit das Dokument serverseitig anhand der Patient- und Encoutner-Verlinkungen in der DocumentReference korrekt zugeordnet werden kann.
Zur Herstellung des Kontextes sind folgende Verfahren möglich:

1. **SMARTApp Launch**: Wenn der Aufruf der App im Rahmen des SMART-Frameworks erfolgt, kennt der Client bereits beim Start den aktuellen Patienten- und ggf. den Encounterkontext. Dabei wählt ein Anwender im Primärsystem (Server) einen Patienten und Fall aus und startet in diesem Kontext die App. Referenzen auf Patient und Encounter werden im Zuge der Authorisierung von Server an Client übermittelt. (Siehe Modul "[Sicherheit - Launch Context und Scopes](https://simplifier.net/guide/ImplementierungsleitfadenISiK-Sicherheit/ScopesAndLaunchContext)). 
2. **bekannte Fallnummer**: Der Client kennt die Fallnummer (z.B. durch das Einscannen eines Barcodes, aus einer V2 MDM-Nachricht). Der Client sucht den Encounter der Ebene 1 (Einrichtungskontakt) anhand der Fallnummer. Wenn auf dem Server kein eindeutiger Treffer gefunden werden kann, stellt dies einen Fehlerzustand dar. Die Auswahls muss dann ggf. manuell erfolgen (siehe Punkt "manuelle Auswahl".). Wenn ein eindeutiges Ergebnis gefunden wurde, kann der Patientenkontext aus der subject-Referenz des Encounters entnommen werden. Wenn das Dokument auf Abteilungsebene zugeordnet werden soll, muss der Client in einem weiteren Schritt alle dem Einrichtungskontakt über die partOf-Referenz zugeordneten Encounter der Ebene 2 abfragen und (bei mehr als einem Ergebnis, z.B. aufgrund fachabteilungsübergreifender Verlegung oder mehrere Vor-/Nachstationärer Besuche) eine Auswahl durch den Benutzer anfordern, sofern keine automatische Auswahl möglich ist.
3. **Arbeitsliste**: Der Client ruft auf dem Server eine Arbeitsliste ab (z.B. Liste aller Encounter, die aktuelle auf einer bestimmten Station/Ambulanz stattfinden, Liste aller ServiceRequests/Tasks, die durch den Client abgearbeitet werden müssen (aktuell noch nicht im Scope der ISiK-Spezifikationen!!) und etabliert den Kontext nachdem der Benutzer einen Eintrag der Liste ausgewählt hat.
4. **manuelle Auswahl**. Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/PatientPatient#PatientInteraktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet der Client mit Hilfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/KontaktFallEncounter#Interaktionen) die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand eines Zeitfensters, der Fallart oder der Encounter-Ebene (Einrichtungskontakt oder Abteilungskontakt) gefiltert werden.) Der Anwender wählt den zutreffenden Encounter aus.

### Dokumentenübermittlung
Die Übermittlung des Dokumentes vom Client an den Server erfolgt mit Hilfe der `$submit-document` Operation.
Hinweis: Der zum Zeitpunkt der Erstellung dieser Spezifikation vorliegende IHE-MHD-Implementierungsleitfaden sieht für die Dokumentenbereitstellung ein 
Transaction-Bundle mit POST-Interaktionen vor. 
Aus Gründen, die [in der diesbezüglichen Diskussion im internationalen FHIR-Chat](https://chat.fhir.org/#narrow/stream/179223-ihe/topic/MHD.20update.20and.20status) 
nachzulesen sind, ist dieses Vorgehen jedoch zu hinterfragen und wird seitens IHE voraussichtlich in künftigen MHD-Versionen geändert.

Um den hier erarbeiteten Vorschlag einer Dokumentenübermittlung mittels Operations der internationalen FHIR-Community im allgemeinen und 
IHE im besonderen vorstellen zu können, in der Hoffnung und Erwartung, dass diese dem Vorgehen folgen, wird dieser Teil der ISiK-Spezifikation 
ausnahmsweise auf Englisch spezifiziert.

#### OperationDefinition `$submit-document`

{{render: ISiK-Dokumentenaustausch/SubmitDocument}}

#### In-Parameters

{{render: ISiK-Dokumentenaustausch/submitdocumentinput}}

#### Out-Parameters

{{render: ISiK-Dokumentenaustausch/submitdocumentoutput}}

### Hinweis zum Umgang mit strukturierten FHIR-basierten Dokumenten
Wenn es sich bei dem bereitgestellten Dokument nicht um Binärdaten (PDF, DOC, JPEG...) sondern um ein strukturiertes, FHIR-basiertes Dokument (Bundle) handelt, so ist die Bereitstellung des metadata-Parameters durch den Client optional.
Server müssen die fehlenden Metadaten aus dem Dokumentenheader (Composition-Ressource) anhand des [vorgegebenen Mappings](https://simplifier.net/ISiK-Dokumentenaustausch/ISiKDokumentenMetadaten/~mappings) ermitteln.
Für das Bestätigungsverfahren in ISiK ist dabei das Patienten- und Encounter-Matching ausschließlich anhand von Patienten- und Fallnummer erforderlich.
Komplexere Matchingverfahren *können* implementiert werden, sind jedoch *nicht* Bestandteil des Testverfahrens.


#### Verarbeitung des Dokumentes

In der aktuellen Ausbaustufe von ISiK MUSS ein empfangenes Fhir-basiertes, strukturiertes Dokument in folgenden Schritten verarbeitet werden:

1. Extraktion der Patient-Ressource aus dem Bundle und Herstellung des Patientenbezuges anhand der Aufnahmenummer ('Patient.identifier')
2. Extraktion der Encounter.Ressource aus dem Bundle und Herstellung des Fallbezuges anhand der Aufnahmenummer ('Encounter.identifier')
3. Extraktion der Meta-Daten in eine DocumentReference-Ressource, sowie der menschenlesbaren Repräsentation des Dokumentes ('Composition.text' + 'Composition.section.text' in eine Binary-Ressource mit HTML-Content)
4. Hinzufügen des Dokumentes und seiner Metadaten zur Fallakte des Patienten 
5. Visualisierung des Dokumentes und seiner Metadaten in der Fallakte des Patienten

{{render:ImplementationGuide/Images/Composition-Bundle.png}}
*Die Grafik zeigt an einem vereinfachten Beispiel die Zuordnung des HTML-Dokumentes zu Patient und Kontakt in der aktuellen Ausbaustufe von ISiK (schwarze Pfeile). Die grauen Pfeile deuten die Übernahme strukturierter Daten, wie sie in weiteren Ausbaustufen erforderlich wird.*

#### Hinweise zum Umgang mit der menschenlesbaren Repräsentation

Die menschenlesbare Repräsentation ("Narrative") eines Dokumentes setzt sich zusammen aus dem Inhalt von 'Composition.text', einer Repräsentation der Metadaten (z.B. Dokumenttyp, Patientenname, Patientennummer, Aufnahmenummer, datum) sowie der Aggregation der Inhalte von 'Composition.section', wobei zu beachten ist, dass ein Dokument beliebig viele Sections haben kann.
Die einzelnen Bestandteile des Narratives KÖNNEN mit \<div\>-Elementen zusammengefügt werden.

#### Hinweise zum Umgang mit strukturierten Daten

Auch wenn in der aktuellen Stufe nur die Übernahme der menschenlesbaren Repräsentation erforderlich ist, empfiehlt es sich dennoch, das vollständige Bundle samt der strukturierten Anteile zu einem Dokument als ein weiteres Attachment zur DocumentReference zu persistieren, so dass zu einem späteren Zeitpunkt, wenn eine Übernahme einzelner Daten möglich ist, diese auch rückwirkend erfolgen kann.

#### Mapping Composition -> DocumentReference
 @```
      from StructureDefinition
      where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKDokumentenMetadaten'
      for differential.element
      select
        Path: id,
        join mapping.where(identity = 'CompositionDocumentReferenceMapping') { map, comment }
      ```
