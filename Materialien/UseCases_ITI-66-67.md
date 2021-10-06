### Use Case 1
Für Bearbeitung von Dokumenten im Rahmen eines Untersuchungsprozesses sollten alle Dokumente zu einer Leistung, 
Bewegung oder Fall abgefragt und in chronologischer Reihenfolge sortiert angezeigt werden können.
#### Umsetzbar im Rahmen von MHD:
* Selektion nach Patient, chronologische Sortierung: `/DocumentReference?patient.identifier=1234&_sort=creation`
#### Umsetzbar im Rahmen von ISiK Stufe 2
* Selektion anhand der Fallnummer: `/DocumentReference?encounter.account.identifier=56789`  oder `/DocumentReference?encounter.partOf.identifier=56789` 
  * "Fall" i.S.v. "DRG-Abrechnungsfall" 
  * abhängig vom Ergebnis der Encounter-Modellierung für Stufe 2
* Selektion nach Bewegung: `/DocumentReference?encounter=x` 
  * "Bewegung" i. S. v. vor-/nachstat. Besuch, stat. Aufenthalt auf Fachabteilungsebene)
  * Setzt verbindliche Modellung von Encounter gem. MI-I Modell "Ebene 2" voraus

### Use Case 2
Für meine tägliche Befundabarbeitung möchte ich alle Dokumente angezeigt bekommen, die z.B. in den letzten 24h neu hinzugekommen sind.
#### Umsetzbar im Rahmen von MHD:
* Sortierung nach Zeitraum des Dokumentendatums, patientenbezogen `/DocumentReference?patient.identifier=1234&creation=gt2021-10-06T00:00:00Z-02:00`
#### Umsetzbar im Rahmen von ISiK Stufe 2
* Sortierung nach Zeitraum des Dokumentendatums, stationsbezogen `/DocumentReference?encounter.location=IN2&creation=gt2021-10-06T00:00:00Z-02:00`
  * setzt verbindliche Abbildung von Encounter.location in Stufe 2 voraus

### Use Case 3
Als verantwortlicher Arzt der Endoskopie möchte ich alle Untersuchungsbefunde meines Funktionsbereichs sortiert nach Dokumentenstatus angezeigt bekommen, 
um die Befundfreigabe vorantreiben zu können.
#### Umsetzbar im Rahmen von MHD:
* nicht umsetzbar
  * Dokumentklasse und -typ sind in XDS-Terminologie nicht hinreichend spezifisch um gezielt "Endoskopie-Befunde" auszuwählen (`type` = BILD (Ergebnisse bildgebender Diagnostik), `class` = BEF (Befundbericht))
  * practiceSetting und facilityType enthalten keine geeigneten Codes, um gezielt "Endoskopie" zu selektieren
#### Umsetzbar im Rahmen von ISiK Stufe 2
* Selektion nach Dokumenttyp "Endoskopiebefund" und Dokumentationsstatus (`docStatus`) `/DocumentReference?type=DG02010|http://dvmd.de/fhir/CodeSystem/kdl&doc-status=preliminary
  * CAVE: `doc-status` ist kein im FHIR core definierter Suchparameter, nur als custom Parameter abbildbar!
  * Setzt Nutzung von KDL-Codes zur Dokumentenklassifikation voraus. 
