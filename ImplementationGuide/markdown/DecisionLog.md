# Decision Log

----
Version: 3.0.1

Datum 15.12.2023

* Problem: Die DMS müssen keine Patienten- und Encounterabfragen unterstützen können, 
  * Lösung: Es werden entsprechende Interaktionen aus dem CapabilityStatement entfernt

Datum: 11.12.2023

* Problem: Für das Modul Dokumentenaustausch sind die Abhängigkeit der Referenzierten Ressourcen Encounter und Patient zum ISIK Basismodul nicht klar herausgearbeitet.
  * Option A (ggf. mit Nennung der Risiken): Anforderungen zur Nutzung der Ressourcen aus ISIK Basismodul präzisieren
  * Option B (ggf. mit Nennung der Risiken): Keine Änderung, damit bleiben offene Fragen zur Nutzung von Basismodul Ressourcen unklar
  * Entscheidung: Option A - umgesetzt hier: Anforderungen zur Nutzung der Ressourcen aus ISIK Basismodul präzisiert