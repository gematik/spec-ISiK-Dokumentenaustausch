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

{{render:ImplementationGuide/Bilder/ISiKPrimärScope.jpg/Composition-Bundle.png}} 

### Interaktionen
#### Dokumentenabfrage
Ein (webbasierter/mobiler) Client möchte Dokumente anhand definierter Kriterien abfragen.

#### Dokumentenbereitstellung
Ein (webbasierter/mobiler) Client möchte neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln.


### erweiterte Interaktionen
#### Dokumentenaustausch mit der ePA

#### Dokumentenaustausch via KIM

### Dokumentenaustausch mit einem externen IHE-XDS/MHD Repository

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



