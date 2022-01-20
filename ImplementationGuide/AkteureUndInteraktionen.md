## Akteure und Interaktionen

### Akteure
#### Dokumentenserver
Das bestätigungsrelevante System nimmt die Rolle des Dokumentenservers ein. Ein Dokumentenserver nimmt Dokumente von Clients zur Speicherung/Archivierung/Verwaltung entgegen und erlaubt Clients die Suche nach und den Abruf von Dokumenten.
Dieses ISiK-Modul legt fest, welche Suchkriterien mindestens implementiert werden müssen und welche Kriterien darüber hinaus optional bereitgestellt werden können.
Dokumentenserver müssen mindestens die Interaktion "Dokumentenabfrage" implementieren. Die Umsetzung der Dokumentenbereitstellung ist optional.

#### (webbasierter/mobiler) Client
Clients können Dokumente von einem Dokumentenserver abfragen um sie z.B. einem Anwender anzuzeigen. Dabei können Sie die für die Server verpflichtend festgelegten Suchkriterien beliebig kombinieren.
Clients sind nicht verpflichtet, alle von den Servern geforderten Suchkriterien zu unterstützen.
Weiterhin können Clients neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln. Dabei müssen sie jedoch mindestens die in diesem Modul verpflichtend festgelegten Metadaten zu den Dokumenten bereitstellen.
Sowohl die Implementierung der Interaktion "Dokumentenabfrage" als auch "Dokumentenbereitstellung" sind für Clients optional.

{{render:isikprimrscope}} 

### Interaktionen
#### Dokumentenabfrage
Ein (webbasierter/mobiler) Client möchte Dokumente anhand definierter Kriterien abfragen.

#### Dokumentenbereitstellung
Ein (webbasierter/mobiler) Client möchte neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln.

#### Herstellung von Patient- und Encounterkontext
Vor der Bereitstellung von Dokumenten muss ein Client einen Patienten- und Encounterkontext herstellen, damit das Dokument serverseitig anhand der Patient- und Encoutner-Verlinkungen in der DocumentReference korrekt zugeordnet werden kann.
Zur Herstellung des Kontextes sind folgende Verfahren möglich:

1. **SMARTApp Launch**: Wenn der Aufruf der App im Rahmen des SMART-Frameworks erfolgt, kennt der Client bereits beim Start den aktuellen Patienten- und ggf. den Encounterkontext. Dabei wählt ein Anwender im Primärsystem (Server) einen Patienten und Fall aus und startet in diesem Kontext die App. Referenzen auf Patient und Encounter werden im Zuge der Authorisierung von Server an Client übermittelt. (Siehe Modul "[Sicherheit - Launch Context und Scopes](https://simplifier.net/guide/ImplementierungsleitfadenISiK-Sicherheit/ScopesAndLaunchContext)). 
2. **bekannte Fallnummer**: Der Client kennt die Fallnummer (z.B. durch das Einscannen eines Barcodes, aus einer V2 MDM-Nachricht). Der Client sucht den Encounter der Ebene 1 (Einrichtungskontakt) anhand der Fallnummer. Wenn auf dem Server kein eindeutiger Treffer gefunden werden kann, stellt dies einen Fehlerzustand dar. Die Auswahls muss dann ggf. manuell erfolgen (siehe Punkt "manuelle Auswahl".). Wenn ein eindeutiges Ergebnis gefunden wurde, kann der Patientenkontext aus der subject-Referenz des Encounters entnommen werden. Wenn das Dokument auf Abteilungsebene zugeordnet werden soll, muss der Client in einem weiteren Schritt alle dem Einrichtungskontakt über die partOf-Referenz zugeordneten Encounter der Ebene 2 abfragen und (bei mehr als einem Ergebnis, z.B. aufgrund fachabteilungsübergreifender Verlegung oder mehrere Vor-/Nachstationärer Besuche) eine Auswahl durch den Benutzer anfordern, sofern keine automatische Auswahl möglich ist.
3. **Arbeitsliste**: Der Client ruft auf dem Server eine Arbeitsliste ab (z.B. Liste aller Encounter, die aktuelle auf einer bestimmten Station/Ambulanz stattfinden, Liste aller ServiceRequests/Tasks, die durch den Client abgearbeitet werden müssen (aktuell noch nicht im Scope der ISiK-Spezifikationen!!) und etabliert den Kontext nachdem der Benutzer einen Eintrag der Liste ausgewählt hat.
4. **manuelle Auswahl**. Nach dem Start des Clients verwendet der Benutzer eine Suchmaske, in der anhand von Patientennummer oder anderer demografischer Daten gesucht werden kann. Der Client verwendet die [Patient-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/PatientPatient#PatientInteraktionen), um auf dem Server nach zutreffenden Patienten zu suchen. Der Anwender wählt den gesuchten Patienten aus der Liste der Suchtreffer aus. Im Anschluss listet der Client mit Hilfe der [Encounter-Interaktionen des ISiK-Basismoduls](https://simplifier.net/guide/isik-basismodul-stufe2/KontaktFallEncounter#Interaktionen) die relevanten Besuche des ausgewählten Patienten auf. (Anm.: Welche Besuche als "relevant" erachtet werden, liegt im Ermessen des Clients. Es könnte z.B. anhand eines Zeitfensters, der Fallart oder der Encounter-Ebene (Einrichtungskontakt oder Abteilungskontakt) gefiltert werden.) Der Anwender wählt den zutreffenden Encounter aus.


### erweiterte Interaktionen
Der Fokus dieser Spezifikation liegt auf den Festlegungen zum Datenaustausch innerhalb einer Einrichtung, umfasst jedoch auch Best Practice-Empfehlungen zur Einstellung von Dokumenten in die EPA eines Patienten, der Weiterleitung an andere Leistungserbringer via KIM oder dem einrichtungsübergreifenden Dokumentenaustausch via MHD/XDS.
{{render:isikkontextunderwscope}}
#### Dokumentenaustausch mit der ePA

#### Dokumentenaustausch via KIM

#### Dokumentenaustausch mit einem externen IHE-XDS/MHD Repository

### Abgrenzung zu ISiK Stufe 2 (Basis) bei der Kommunikation strukturierter Dokumente (FHIR-Document-Bundle)

#### Interaktion ISiK Stufe 2 (Basis): Bericht aus Subsystem
* HTTP-verb: POST auf [base]
* Bundle.type: document
* erforderliches Verhalten: das Zielsystem verarbeitet den Inhalt des Dokumentes (HTML + Ressourcen soweit möglich), das Original muss nicht zwingend persitiert werden. Das Dokument muss bei der Suche nach DocumentReference nicht zwingend angezeigt werden
* Optionen:
  * das Original-Dokument wird als Bundle persistiert und eine Provenance-Ressource verlinkt die verarbeiteten Ressourcen mit dem Original.
  * das Zielsystem erstellt eine DocumentReference und verweist damit auf das Bundle (oder nur das HTML) um bei Anfragen nach DocumentReference das Bundle brücksichtigen zu können.
  * der Client fordert beim Dokumentenserver eine DocumentReference für das Bundle an (mittels $generate-Operation: automatisiertes Mapping der Composition-Metadaten auf DocumentReference) und verwendet anschließend die Dokumentenbereitstellungs-Interaktion um das Dokument im Original zu persistieren.

#### Interaktion Dokumentenaustausch: Dokumentenbereitstellung (analog MHD ITI-65) 
* HTTP-verb: POST auf [base]
* Bundle.type: transaction (MHD ITI-65) mit DocumentBundle als Payload
* DocumentReference.attachment: FHIR-document-Bundle
* erforderliches Verhalten: das document Bundle wird im Original persistiert und bei der Suche nach DocumentReferences angezeigt
* Option:
  * Das Zielsystem verarbeitet darüber hinaus den Inhalt des Dokumentes und eine Provenance-Ressource verlinkt die verarbeiteten Ressourcen mit dem Original 

#### Empfehlung für ISiK-Entwickler
Bei der einrichtungsinternen Kommnunkation strukturierter FHIR-Dokumente ist die Interaktion "Bericht aus Subsystem" vorzuziehen. Wenn eine einrichtungsübergreifende, IHE-Konforme Kommunikation erforderlich ist, kann die Interaktion Dokumentenbereitstellung, bzw. MHD ITI-65 gewählt werden.



