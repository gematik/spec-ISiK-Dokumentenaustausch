
## Kompatibilität zu IHE-Profilen

Die Festlegungen in diesem ISiK-Modul wurden auf Grundlage des [IHE-MHD-Profils](http://build.fhir.org/ig/IHE/ITI.MHD/) getroffen.
Wo die Festlegungen seitens IHE zu eng gefasst waren, um die Kompatibilität wahren zu können, ohne die Umsetzung der ISiK-UseCases einzuschränken, wurden [entsprechende Change-Requests bei IHE Int.](https://github.com/IHE/ITI.MHD/issues?q=is%3Aissue+author%3AsimoneOnFhir+) eingereicht, mit dem Ziel, die Kompatibilität in künftigen Releases von IHE-MHD wieder herzustellen.

Die Intention der ISiK-Spezifikation ist es, die IHE-Interaktionen auf das notwendige Minimum für die einrichtungsinterne Kommunikation zu reduzieren, dabei jedoch alle erforderlichen Dokumenten-Metadaten für eine spätere Weitergabe der Dokumente an z.B. eine ePA oder ein IHE-MHD-basiertes Repository zu erheben. 

Das IHE-MHD Profil ist kompatibel zu IHE-XDS. Die Mappings von MHD zu XDS sind seitens IHE definiert. 

Dabei ist jedoch zu beachten, dass bei der Einstellung von Dokumenten in eine IHE-Registry weitere Metadaten über den Vorgang des Einstellens (Abgebildet im IHE-Konzept "SubmissionSet") hinzugefügt werden müssen, die im Kontext der ISiK Spezifikation keine Berücksichtigung finden.

Als Terminologien kommen bei ISiK - soweit sinnvoll und möglich - die XDS-ValueSets von IHE Deutschland zum Einsatz.

### Abweichungen zwischen ISiK und IHE-MHD

#### Fallkontext
In IHE-MHD bzw. XDS ist kein Fallkontext für Dokumente vorgesehen. Bestenfalls kann die Fallnummer (ein Identifier!) als zusätzlicher Code in der EventCodeList verwahrt werden. In der FHIR-Architektur (und in allen weiteren ISiK-Modulen) wird ein Fallkontext jedoch durch die Verlinkung auf einen Encounter etabliert.
In dieser ISiK-Spezifikation kommt ebenfalls die Verlinkung zum Einsatz, da der Wunsch nach einer Harmonisierung mit der FHIR-Kernspezifikation und allen anderen ISiK-Modulen dem Wunsch nach Harmonisierung mit IHE-XDS überwiegt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/88), den Constraint, der die Encounter-Verlinkung verbietet, zu lockern.

#### Dokumentenstatus
Vor dem Hintergrund des einrichtungsübergreifenden Dokumentenaustausches geht IHE-MHD davon aus, dass alle kommunizierten Dokumente einen finalen Status haben.
Dies ist jedoch bei der einrichtungs*internen* Kommunikation, wie sie von ISiK spezifiziert wird, nicht gegeben. Im Gegenteil: die Suche und Filterung von Dokumenten anhand des Fertigstellungsstatus war ein häufig geäußerter Wunsch bei der Sammlung potentieller UseCases.
Daher ist die Verwendung des Feldes `docStatus` in ISiK explizit erlaubt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/96), den Constraint, der die Verwendung von `docStatus` verbietet, zu lockern.

#### Patientenübergreifende Suche
Im Kontext von IHE-MHD sind Clients verpflichtet, bei allen Suchen mindestens die Parameter `patient` oder `patient.identifier` sowie `status` zu verwenden. Typische UsesCases für die Dokumentensuche in einem Krankenhaus beinhalten jedoch auch die patientenübergreifende Suche, z.B. nach allen nicht abgeschlossenen Arztbriefen einer Station oder allen Spirometrie-Befunden der letzten Woche.
Diese Einschränkung wurde im ISiK-Profil daher aufgehoben.
