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

### Interaktionen
#### Dokumentenabfrage
Ein (webbasierter/mobiler) Client möchte Dokumente anhand definierter Kriterien abfragen.

#### Dokumentenbereitstellung
Ein (webbasierter/mobiler) Client möchte neu erstellte, geänderte oder erweiterte Dokumente an einen Dokumentenserver übermitteln.


### erweiterte Interaktionen
#### Dokumentenaustausch mit der ePA

#### Dokumentenaustausch vie KIM

### Dokumentenaustausch mit einem externen IHE-XDS/MHD Repository
