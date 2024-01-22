# Decision Log

----
Version: 3.0.1

Datum 15.12.2023

* Problem: Die DMS müssen keine Patienten- und Encounterabfragen unterstützen können. 
  * Lösung: Es werden entsprechende Interaktionen aus dem CapabilityStatement entfernt und ein generischer Text zur Klärung der Verwendung von Profilen und Interaktionen aus der Basis in diesem Modul wird hinzugefügt.
  * Hintergrund: Die Festlegung zur Nutzung der Basisprofile in den Referenzen, könnte auch über eine explizite Referenz zu den ISIk-Profilen im referenzierenden Profil selbst gelöst werden - z.B. Reference(ISiKPatient).Dies ist aber aus folgendem Grund nicht gewollt: Die Profile sollen im Sinne der Interoperabilität außerhalb des unmittelbaren Krankenhaus und ISiK-Umfeldes nutzbar sein; dort wird z.B. womöglich ein vom ISIK-Profil abweichendes Patienten-Profil genutzt und dies soll weiterhin möglich sein. Bei der Form der Vorgabe handelt es sich also um eine bewusste Entscheidung zur Gestaltung.

Datum: 11.12.2023

* Problem: Für das Modul Dokumentenaustausch sind die Abhängigkeit der Referenzierten Ressourcen Encounter und Patient zum ISIK Basismodul nicht klar herausgearbeitet.
  * Option A (ggf. mit Nennung der Risiken): Anforderungen zur Nutzung der Ressourcen aus ISIK Basismodul präzisieren
  * Option B (ggf. mit Nennung der Risiken): Keine Änderung, damit bleiben offene Fragen zur Nutzung von Basismodul Ressourcen unklar
  * Entscheidung: Option A - umgesetzt hier: Anforderungen zur Nutzung der Ressourcen aus ISIK Basismodul präzisiert