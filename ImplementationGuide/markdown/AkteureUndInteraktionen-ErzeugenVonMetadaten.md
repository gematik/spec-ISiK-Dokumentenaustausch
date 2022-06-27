## Erzeugen von Dokumentenmetadaten

### Abgrenzung zu ISiK Stufe 2 (Basis) bei der Kommunikation *strukturierter* Dokumente (FHIR-Document-Bundle)

#### Interaktion ISiK Modul Basis Stufe 2: Bericht aus Subsystem
* UseCase: Client übermittelt diverse strukturierte Informationen in Form eines Dokumentes an einen Empfänger. Der Empfänger (oder ggf. dessen Benutzer) kann selbst entscheiden, welche Informationen übernommen und ggf. weiterverarbeitet werden können/sollen. Als Minimum muss die Narrative (die HTML-Repräsentation des gesamten Dokumentes) übernommen werden.
* HTTP-verb: POST auf [base]
* Content: Bundle vom Typ `document`
* erforderliches Verhalten: der Empfänger verarbeitet den Inhalt des Dokumentes (HTML + Ressourcen soweit möglich), das Original muss nicht zwingend persistiert werden. Es besteht kein zwingendes Erfordernis, dass das Dokument oder seine Inhalte über die API wieder bereitgestellt werden können. 

#### Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung
* UseCase: Client übermittelt ein strukturiertes Dokument zur inhaltsagnositschen, dauerhaften, ggf. rechtssicheren Archivierung
* HTTP-verb: POST auf [base]/$submit-document
* Content: Parameters (DocumentReference + Binary mit Base64-codiertem Bundle vom Typ `document`)
* erforderliches Verhalten: das Dokument sowie seine Metadaten werden persistiert und über die API mittels der Interaktionen "Dokumentenabfrage" und "Dokumentenzugriff" bereitgestellt.

#### Typische Szenarien mit Koexistenz beider Interaktionen:
Der Empfänger eines Subsystem-Berichtes gem. Modul "Basis" möchte vor der Verarbeitung des Dokumenteninhalts das Original zur Archivierung an einen Dokumentenserver gem. Modul "Dokumentenaustausch" übermitteln und die Herkunft der extrahierten Daten aus dem Dokument nachvollziehbar machen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:ImplementationGuide/markdown/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Extraktion und der verarbeitbaren Ressourcen aus dem Bundle
4. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](http://hl7.org/fhir/provenance.html).

Der Sender eines Subsystem-Berichtes gem. Modul "Basis" möchte parallel zur Übermittlung an z.B. ein KIS zur Weiterverarbeitung der Informationen das Dokument ebenfalls im Original archivieren lassen.

Empfohlenes Vorgehen:
1. Erzeugen einer DocumentReference-Ressource (siehe dazu $generate-metadata) 
2. Übermittlung der DocumentReference sowie des Base64-codierten Bundles gemäß {{pagelink:ImplementationGuide/markdown/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
3. Übermittlung des Dokumentes zur Verarbeitung gemäß [Interaktion ISiK Modul Basis Stufe 2: Bericht aus Subsystem](https://simplifier.net/guide/implementierungsleitfadenisik-basismodul/ImplementationGuide-markdown-Datenobjekte-Datenobjekte-BerichtSubsystem?version=current)


Der Empfänger eines Dokumentes gem. Modul "Dokumentenaustausch" möchte neben der Archivierung des Dokumentes auch dessen Inhalte weiterverarbeiten.

Empfohlenes Vorgehen:
1. Entgegennahme und Persistierung des Original-Dokumentes gemäß {{pagelink:ImplementationGuide/markdown/AkteureUndInteraktionen-Interaktion-Dokumentenbereitstellung.md, text:Interaktion ISiK Modul Dokumentenaustausch Stufe 2: Dokumentenbereitstellung}}
1. Extraktion des Bundles aus der Binary-Ressource
2. Extraktion der verarbeitbaren Ressourcen aus dem Bundle
3. Verlinkung zwischen den extrahierten Ressourcen und dem Original-Dokument mittels einer [`Provenance`-Ressource](http://hl7.org/fhir/provenance.html).

### Operation $generate-metadata

Die Operation `$generate-metadata` wurde spezifiziert in Anlehnung an die Operation [`$generate` im current build der FHIR-Kernspezifikation](http://build.fhir.org/documentreference-operation-generate.html), die jedoch noch nicht in implementierbarem Zustand ist. Die hier getroffenen Änderungen werden parallel als Feedback zur Verbesserung der Kernspezifikation als [ChangeRequest](https://jira.hl7.org/browse/FHIR-34043) eingereicht.
Um die Diskussion mit der internationalen Community zu erleichtern, erfolgt die Spezifikation der Operation in Englisch.

| Hinweis | Work in Progress!|
|---------|---------------------|
| {{render:ImplementationGuide-Images-ig-bilder-Warning}} | Die hier vorliegende Definition der Operation dient als Vorschlag, der auf Basis von Implementierungserfahrungen weiterentwickelt werden soll. Kritik, Feedback und Verbesserungsvorschläge bitte im [ISiK-Community-Chat](https://chat.fhir.org/#narrow/stream/287581-german.2Fisik) diskutieren! |


{{render:resources-input-fsh-operationgeneratemetadata}}

#### In-Parameters Definition (ISiK)

{{render:resources-input-fsh-operationgeneratemetadatainput}}

#### Out-Parameters Definition (ISiK)

{{render:generatemetadataoutput}}

### ISiK-Spezifisches Mapping Composition -> DocumentReference
 @```
      from StructureDefinition
      where url = 'https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/ISiKDokumentenMetadaten'
      for differential.element
      select
        Path: id,
        join mapping.where(identity = 'CompositionDocumentReferenceMapping') { map, comment }
      ```

