### Abgrenzung zu ISiK Stufe 2 (Basis) bei der Kommunikation *strukturierter* Dokumente (FHIR-Document-Bundle)

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
Bei der einrichtungsinternen Kommunikation strukturierter FHIR-Dokumente ist die Interaktion "Bericht aus Subsystem" vorzuziehen. Wenn eine einrichtungsübergreifende, IHE-Konforme Kommunikation erforderlich ist, kann die Interaktion Dokumentenbereitstellung, bzw. MHD ITI-65 gewählt werden.
