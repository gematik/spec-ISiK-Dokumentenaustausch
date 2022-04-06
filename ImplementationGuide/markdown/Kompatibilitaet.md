
## Kompatibilität zu IHE-Profilen

Die Festlegungen in diesem ISiK-Modul wurden auf Grundlage des [IHE-MHD-Profils](http://build.fhir.org/ig/IHE/ITI.MHD/) getroffen.
Wo die Festlegungen seitens IHE zu eng gefasst waren, um die Kompatibilität wahren zu können ohne die Umsetzung der ISiK-UseCases einzuschränken, wurden [entsprechende Change-Requests bei IHE Int.](https://github.com/IHE/ITI.MHD/issues?q=is%3Aissue+author%3AsimoneOnFhir+) eingereicht, mit dem Ziel, die Kompatibilität in künftigen Releases von IHE-MHD wieder herzustellen.

Die Intention der ISiK-Spezifikation ist es, die IHE-Interaktionen auf das notwendige Minimum für die einrichtungsinterne Kommunikation zu reduzieren, dabei jedoch alle erforderlichen Dokumenten-Metadaten für eine spätere Weitergabe der Dokumente an z.B. eine ePA oder ein IHE-MHD-basiertes Repository zu erheben. 

Das IHE-MHD Profil ist kompatibel zu IHE-XDS. Die Mappings von MHD zu XDS sind seitens IHE definiert. 

Dabei ist jedoch zu beachten, dass bei der Einstellung von Dokumenten in eine IHE-Registry weitere Metadaten über den Vorgang des Einstellens (Abgebildet im IHE-Konzept "SubmissionSet") hinzugefügt werden müssen, die im Kontext der ISiK Spezifikation keine Berücksichtigung finden.

Als Terminologien kommen bei ISiK - soweit sinnvoll und möglich - die XDS-ValueSets von IHE Deutschland zum Einsatz.

### Abweichungen zwischen ISiK und IHE-MHD

#### Dokumentenbereitstellung
Die Bereitstellung von Dokumenten (Übermittlung von Client an den Server) ist in IHE-MHD als [Transaction](https://hl7.org/fhir/http.html#transaction) definiert.

Dabei ist jedoch zu beachten, dass eine Transaction in FHIR definiert ist als die Ausführung mehrerer einzelner REST-Interaktionen in einem transaktionalen Kontext. Eine Transaction hat keinen Namen und außer der Verarbeitung nach dem "Ganz oder gar nicht"-Prinzip keine andere Logik als die äquivalente Sequenz der einzelnen REST-Interaktionen.

Innerhalb einer Transaktion sind folglich sämtliche Permutationen von REST-Interaktionen zulässig, die ein Server laut seinem Capability-Statment bereitstellt. Die Implementierung erfolgt generisch, als transaktionale Ausführung der einzelnen Interaktionen. Es gibt keine Transaktionen mit "besonderer Bedeutung".

Gegen dieses Prinzip verstößt die Festlegung in IHE-MHD.
Erstens ist die Ausführung der in der Transaktion definierten Interaktionen als atomare REST-Interaktionen in IHE-MHD nicht definiert, zweitens soll bei der Ausfühung der Transaktion in MHD erweiterte Business-Logik ausgeführt werden, die fest mit *dieser* Transaktion verknüpft ist.
Die Implementierung von IHE-MHD ist unproblematisch, so lange sie die einzige Transaktion ist und bleibt, die auf diesem Server bereitgestellt wird und Client und Server ein implizites Einverständnis darüber haben, dass *ausschließlich* diese eine Transaktion in der von IHE definierten Form mit der von IHE definierten Logik ausgeführt werden kann. 

Sobald ein Server jedoch weitere Transaktionen implementieren möchte, kommt es zu Problemen, da der generische Ansatz nicht mehr möglich ist. Die verschiedenen Transaktionen sind für Client sowie Server nicht mehr unterscheidbar/identifizierbar. 

Die Problematik wird in der internationalen FHIR-Community diskutiert und [IHE prüft derzeit](https://github.com/IHE/ITI.MHD/issues/100), ob eine Anpassung der Spezifikation verfolgt werden soll.

Für dieses ISiK-Modul kommt aufgrund der beschriebenen Problematik anstelle der Transaktion eine Operation zum Einsatz. Dies bietet folgende Vorteile:
1. Operations sind *benannte* Interaktionen. Jede Operation kann eindeutig mit einer Definition der erlaubten/benötigten Parameter und der zu implementierenden Business-Logik in Verbindung gebracht werden.
2. Die Business-Logik einer Operation kann über die transaktionale Verarbeitung einzelner REST-Interaktionen hinaus gehen.
3. Für Clients ist aus dem Capability-Statment des Servers klar ersichtlich, *welche* Operations unterstützt werden, und welche Parameter diese jeweils benötigen.
4. Die API eines Servers kann in Zukunft problemlos um zusätzliche Operations erweitert werden. 
5. Die Transaction bleibt *frei* um für die generische transaktionale Verarbeitung einzelner REST-Interaktionen genutzt werden zu können.

#### Fallkontext
In IHE-MHD bzw. XDS ist kein Fallkontext für Dokumente vorgesehen. Bestenfalls kann die Fallnummer (ein Identifier!) als zusätzlicher Code in der EventCodeList verwahrt werden. In der FHIR-Architektur (und in allen weiteren ISiK-Modulen) wird ein Fallkontext jedoch durch die Verlinkung auf einen Encounter etabliert.
In dieser ISiK-Spezifikation kommt ebenfalls die Verlinkung zum Einsatz, da der Wunsch nach einer Harmonisierung mit der FHIR-Kernspezifikation und allen anderen ISiK-Modulen dem Wunsch nach Harmonisierung mit IHE-XDS überwiegt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/88), den Constraint, der die Encounter-Verlinkung verbietet, zu lockern.

#### Dokumentenstatus
Vor dem Hintergrund des einrichtungsübergreifenden Dokumentenaustausches geht IHE-MHD davon aus, dass alle kommunizierten Dokumente einen finalen Status haben.
Dies ist jedoch bei der einrichtungs*internen* Kommunikation, wie sie von ISiK spezifiziert wird, nicht gegeben. Im Gegenteil: die Suche und Filterung von Dokumenten anhand des Fertigstellungsstatus war ein häufig geäußerter Wunsch bei der Sammlung potentieller UseCases.
Daher ist die Verwendung des Feldes `docStatus` in ISiK explizit erlaubt.
Um die technische Kompatibilität mit dem DocumentReference-Profil von IHE-MHD zu wahren [wurde der Änderungswunsch an IHE herangetragen](https://github.com/IHE/ITI.MHD/issues/96), den Constraint, der die Verwendung von `docStatus` verbietet, zu lockern.
