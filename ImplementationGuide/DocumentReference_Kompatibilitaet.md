### Kompatibilität

Dieses Profil basiert auf dem [Profil "MHD DocumentReference Comprehensive UnContained References Option" (Version 4.0.2 ci-build) von IHE International](http://build.fhir.org/ig/IHE/ITI.MHD/StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html).

### Abweichungen vom IHE-Profil

* Die Verwendung von `context.encounter` ist im ISiK-Kontext gestattet.
CR zur Harmonisierung mit IHE: https://github.com/IHE/ITI.MHD/issues/88
* Die Verpflichtung zur Verwendung von `date` wurde im ISiK-Kontext aufgehoben
CR zur Harmonisierung mit IHE: https://github.com/IHE/ITI.MHD/issues/88
https://github.com/IHE/ITI.MHD/issues/94
* Die Verwendung von `docStatus` ist im ISiK-Kontext gestattet.


### Einschränkungen des IHE-Profils
Elemente mit ValueSet-Bindings ohne verbindliche Vorgabe seitens IHE wurden auf die in Deutschland gebräuchlichen Terminologien eingeschränkt.


