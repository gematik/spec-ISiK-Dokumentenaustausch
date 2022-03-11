## Abgrenzung zu ISiK Stufe 2 (Basis) bei der Kommunikation *strukturierter* Dokumente (FHIR-Document-Bundle)

### Interaktion ISiK Modul Basis Stufe 2: Bericht aus Subsystem
* UseCase: Client übermittelt diverse strukturierte Informationen in Form eines Dokumentes an einen Empfänger. Der Empfänger (oder ggf. dessen Benutzer) kann selbst entscheiden, welche Informationen übernommen und ggf. weiterverarbeitet werden können/sollen. Als Minimum muss der Narrative (die HTML-Repräsentation des gesamten Dokumentes) übernommen werden.
* HTTP-verb: POST auf [base]
* Content: Bundle vm Typ `document`
* erforderliches Verhalten: der Empfänger verarbeitet den Inhalt des Dokumentes (HTML + Ressourcen soweit möglich), das Original muss nicht zwingend persitiert werden. Es besteht keine zwingende Erfordernis, dass dass das Dokument oder seine Inhalte über die API wieder bereitgestellt werden können. 

### Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung
* UseCase: Client übermittelt ein strukturiertes Dokument zur inhaltsagnositsche, dauerhaften, ggf. rechtssicheren Archivierung
* HTTP-verb: POST auf [base]/$submit-document
* Content: Parameters (DocumentReference + Binary mit Base64-codiertem Bundle vom Typ `document`)
* erforderliches Verhalten: das Dokument sowie seine Metadaten werden persistiert und über die API mittels der Interaktionen "Dokumentenabfrage" und "Dokumentenzugriff" bereitgestellt.

### Typische Szenarien mit Koexistenz beider Interaktionen:
Der Empfänger eines Subsystem-Berichtes gem. Modul "Basis" möchte vor der Verarbeitung des Dokumenteninhalts das Original zur Archivierung an einen Dokumentenserver gem. Modul "Dokumentenaustausch" übermitteln und die Herkunft der extrahierten Daten aus dem Dokument nachvollziehbar machen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Extraktion und der verarbeitbaren Ressourcen aus dem Bundle
4. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](http://hl7.org/fhir/provenance.html).

Der Sender eines Subsystem-Berichtes gem. Modul "Basis" möchte parallel zur Übermittlung an z.B. ein KIS zur Weiterverarbeitung der Informationen das Dokument ebenfalls im Original archivieren lassen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Übermittlung des Dokumentes zur Verarbeitung gemäß [Interaktion ISiK Modul Basis Stufe 2: Bericht aus Subsystem](https://simplifier.net/guide/isik-basismodul-stufe2/BerichtausSubsystemenComposition)


Der Empfänger eines Dokumentes gem. Modul "Dokumentenaustausch" möchte neben der Archivierung des Dokumentes auch dessen Inhalte weiterverarbeiten.

Empfohlenes Vorgehen:
1. Entgegennahme und Persistierung des Original-Dokumentes gemäß {{pagelink:AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
1. Extraktion des Bundles aus der Binary-Ressource
2. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
3. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](http://hl7.org/fhir/provenance.html).
