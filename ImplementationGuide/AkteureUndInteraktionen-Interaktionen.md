### Interaktionen
#### Dokumentenabfrage
**UseCase:** Ein (webbasierter/mobiler) Client möchte Dokumente anhand definierter Kriterien abfragen.
Zur Dokumenten(-Metadaten)abfrage nutzt diese Spezifikation die SEARCH-Interaktionen auf der DocumentReferenc-Ressource gemäß der FHIR-Spezifikation.
Dabei müssen ausgewählte Suchparameter von Dokumentenservern verpflichtend unterstützt werden. Die Selektion erfolgt anhand der Relevanz der Parameter für die identifizierten UseCases.
Der Zugriff auf die von den DocumentReferences verlinkten Dokumente (z.B. im PDF-Format), erfolgt per READ-Interaktion auf der Binary-Ressource gemäß FHIR-Spezifikation.

#### Dokumentenbereitstellung
**UseCase:** Ein (webbasierter/mobiler) Client möchte neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln.
