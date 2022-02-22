
## Kompatibilität zu IHE-Profilen

Die Festlegungen in diesem ISiK-Modul wurden auf Grundlage des [IHE MHD-Profils](http://build.fhir.org/ig/IHE/ITI.MHD/) getroffen.
Wo die Festlegungen seitens IHE zu eng gefasst waren, um die Kompatibilität wahren zu können, ohne die Umsetzung der ISiK-UseCases einzuschränken, wurden [entsprechende Change-Requests bei IHE Int.](https://github.com/IHE/ITI.MHD/issues?q=is%3Aissue+author%3AsimoneOnFhir+) eingereicht, mit dem Ziel, die Kompatibilität in künftigen Releases von IHE-MHD wieder herzustellen.

Die Intention der ISiK-Spezifikation ist es, die IHE-Interaktionen auf das notwendige Minimum für die einrichtungsinterne Kommunikation zu reduzieren, dabei jedoch alle erforderlichen Informationen für eine spätere Weitergabe der Dokumente an z.B. eine ePA oder ein IHE-MHD-basiertes Repository zu erheben. 

Das IHE-MHD Profil ist kompatibel zu IHE-XDS, so dass sich daraus eine indirekte Kompatibilität der Dokumentenmetadaten von ISiK und XDS ergibt. Die Mappings von MHD zu XDS sind seitens IHE definiert. 

Dabei ist jedoch zu beachten, dass bei der Einstellung von Dokumenten in eine IHE-Registry weitere Metadaten über den Vorgang des Einstellens (Abgebildet im IHE-Konzept "SubmissionSet") hinzugefügt werden müssen, die im Kontext dieser Spezifikation keine Berücksichtigung finden.

Als Terminologien kommen bei ISiK - soweit sinnvoll und möglich - die XDS-ValueSets von IHE Deutschland zum Einsatz.

## Kompatibilität zur ePA
To Do
