---
title: Effektstärken 3
author: ''
date: '2021-02-07'
slug: effektstärken-3.en-us
categories: []
tags: []
keywords:
  - tech
---

# Allzweckwaffe Korrelation

Nach dem wir Mittelwertvergleiche bereits durchexerziert haben, fehlt mit **Korrelationen** noch das zweite statistische Lieblingsinstrumentarium der Psychologen. Kurze Vorabinfo: es soll hier eigentlich nur um Pearson's Korrelationskoeffizient r gehen, wenn ich das irgendwo nicht mehr dazu schreibe, meine ich also im Zweifel Pearson's r. Und wenn irgendwo „Validität“ steht, dann kann man das grundsätzlich gleichbedeutend wie „Korrelation“ verstehen. Zurück zum Thema. Im Gegensatz zu den vielen zusätzlichen Kennwerten, über die bestimmte Cohen's *d* Werte Auskunft liefern, also z.B. betreffend die Überlappung der Verteilungen, Anteil der Personen aus Gruppe A, die über/unter Gruppe B liegt etc., konnte ich tatsächlich solche Werte für Korrelationen nur mit bedingtem Erfolg finden. Höchstens mit Ausnahme von Taylor-Russel-Tafeln und dem bekannteren R^2, der aufgeklärten Varianz. 

Wenn man sich über Korrelationen besonders schlau machen will, findet man stattdessen viele wichtige Dinge, die mich hier jetzt gar nicht interessieren: Welche verschiedenen **Korrelationseffizienten** es so gibt; dass **Korrelation nicht Kausalität** impliziert (der wichtigste zu bedenkende Punkt bei der Interpretation, allerdings auch der bekannteste); wie man mit Korrelationen **statistische Hypothesen** testet; dass Pearson's (aber auch andere) Korrelationseffizient r nur **lineare Zusammenhänge** beschreibt; wie Korrelationen und **Regressionen** miteinander zusammenhängen und so weiter und so fort.

Das alles lassen wir beiseite und fragen uns hier und heute: Was bedeuten bestimmte Korrelationen **eigentlich** und in **Normalsprache** übersetzt? Der letzte Blogeintrag hat uns schon gewappnet, die Größe von Korrelationen im medizinischen/psychologischen Forschungsbereich vergleichsweise einzuschätzen, es fehlte nur noch das Pendant zum Blogeintrag über Cohen's *d* darüber, wie bestimmte statistische Werte aussehen und was sie über den reinen Zahlenwert hinaus bedeuten. 

Noch einmal zum allgemeinen Verständnis: **Pearson's r drückt aus, wie stark zwei Variablen linear miteinander zusammenhängen**. Beispiel: Allgemeine Intelligenz und die berufliche Leistung hängen miteinander zusammen, sie korrelieren also miteinander; in etwa mit **r = 0.5** (wenn Korrekturen der Korrelation vorgenommen wurden; Schmidt & Hunter, 1998). Läge r bei 0, bestünde kein linearer Zusammenhang, d.h. die Intelligenz würde uns keine Information darüber liefern, wie erfolgreich eine Person in ihrem Beruf ist. Läge sie unter 0, würde das bedeuten, dass höhere Intelligenz mit schlechteren beruflichen Leistungen einhergeht. Die Korrelation könnte maximal bei 1 bzw. -1 liegen. Dann bestünden perfekt lineare Zusammenhänge, was wir gemeinen Sozialwissenschaftler nie finden (sollte man auch erstmal nicht erwarten). Nun auch ganz kurz zu R^2, der **aufgeklärten Varianz**: die Korrelation von 0.5 bedeutet, dass 25 % (weil 0.5^2 = 0.25) der Varianz, also der Unterschiede der beruflichen Leistung zwischen den verschiedenen Personen, sich durch Unterschiede in deren Intelligenz „erklären“ lassen. Statistisch gesehen ist hier jedoch egal, ob die Varianz der beruflichen Leistung die Varianz der Intelligenz erklärt oder andersherum.

## ShinyApp, Punktewolken und Taschenspielertricks

Aber um nicht direkt bei statistischen Erklärungen stehen zu bleiben, habe ich diesmal wieder mit **ShinyApp** ([**hier ein Link zur App**](https://sbuettner.shinyapps.io/correlations/), die App wird abermals unten nicht ideal dargestellt), die es erlaubt, die Größe von Korrelationskoeffizienten anzupassen und dann einfach anzuschauen, wie dazugehörige bivariate (wir betrachten immer 2 Variablen) Punktewolken aussehen. Darüber hinaus habe ich einige Werte mit angefügt, die inspiriert sind von den statistischen Zusatzinformationen, die man zu Cohen's *d* findet und denen wir uns in Kürze widmen.

Wer nun mit den Reglern spielt, wird feststellen, **dass wir erst bei Korrelationen ab ca. 0.5 wirklich sehen, dass ein Zusammenhang besteht**. Umso trauriger die Erinnerung an den letzten Blogeintrag, der offenbarte, dass Psychologen (u.a. aber eben Mediziner) selten Effekte finden mit r über 0.5.
Der Durchschnitt liegt vielmehr bei ca. 0.2. Solche Korrelationen sieht man in den Punktewolken kaum. Jetzt können wir uach einmal anschauen, was die Korrelation von 0.02 für die Reduktion von Herzinfarkten durch Aspirin bedeutet. Man sieht schnell: man sieht nicht viel. Dennoch ist das ein Effekt, den Mediziner ernst zu nehmen scheinen. Denn es geht um Leben und Tod, außerdem bedeutet ein kleiner Effekt nur, dass erst dann wirklich durchschlägt, wenn man ihn bei einer hinreichend großen Zahl Personen wirken lässt (Skaleneffekte).

## Wie gut sind unsere Entscheidungen?

Jedoch: nicht nur traurig soll uns das stimmen, es sollte vielmehr unsere Neugier wecken: was bedeutet r = 0.2 denn dann? Hierfür müssen wir ein paar Taschenspielertricks anwenden und zwar verlassen wir die Denke „mehr A = mehr B“ und dichotomisieren unsere Welt (so verrucht Schwarz-Weiß-Vergleiche sind, so eindrücklich sind sie unserer kognitiven Maschinerie). Genauer, wir stellen die Korrelationen in den Raum irgendeiner möglichst einfachen Entscheidung: Es soll entschieden werden, ob wir auf Basis von **Variable A**, dem **Prädiktor**, entscheiden können, ob ein **Kriterium** festgesetzt über **Variable B** erreicht wird. Als Wirtschaftspsychologe mache ich das im Rahmen einer fiktiven Personalauswahlentscheidung (heute leider kein Schwabenvergleich à la „höhere Bruddligkeit geht mit einem erhöhten Spätzlekonsum einher“). Die Prädiktorvariable der X-Achse sei dabei irgendein **Intelligenztest** für die Bewerberauswahl. Die Kriteriumsvariable auf der Y-Achse sei die **tatsächliche Eignung**, angenähert durch eine **Vorgesetzteneinschätzung**. Wir machen es uns hier ganz einfach: Wer überdurchschnittlich eingeschätzt wird, den halten wir einfach für geeignet und den stellen wir auch ein.

Jetzt können wir uns konkrete interessante Fragen stellen:
- **Wie gut ist unsere Entscheidung** bei bestimmtem r?
- **Wie viel besser sind die Eingestellten** (nochmal: „Eingestellt“ = Als-Geeignet-Eingeschätzt = überdurchschnittliche Prädiktor- oder X-Variable) tatsächlich?

Die erste Frage bringt uns in die Gefilde von **Spezifität**, **Sensitivität** und **Genauigkeit**, mit denen wir mittlerweile seit Covid-19-Testungen bestens vertraut sein sollten (für Psychologen: Stichwort Taylor-Russel-Tafeln). Trotzdem noch einmal die Erklärung:

- Die **Sensitivität** gibt in diesem Fall an, wie oft wir für die Bewerber korrekterweise auf Basis eines überdurchschnittlichen Prädiktorwerts entscheiden, dass sie geeignet sind.

- Die **Spezifität** gibt an, wie oft wir für korrekterweise entscheiden, dass jemand nicht geeignet ist.

- Die **Genauigkeit** gibt an, wie oft wir insgesamt die richtige Entscheidung über die Eignung treffen

- Die **Erfolgs-zu-Misserfolgs-Rate** gibt das Verhältnis zwischen korrekten und falschen Entscheidungen an. 

Solange unsere Auswahlrate (das ist der Prozentsatz, den wir einstellen) und Basisrate (das sind die, die unabhängig vom Prädiktor geeignet wären) jeweils bei 50% liegen, ist alles schön symmetrisch, sodass Sensitivität, Spezifität und Genauigkeit den gleichen Wert annehmen. Auf diesen Fall beschränken wir uns. Wer entdeckungslustiger ist, darf an den Reglern spielen. Wer die „Sternchen-Hausaufgabe“ machen möchte, der googlet „ROC-Kurve“ und findet heraus, wie diese mit der Grafik hier zusammenhängen könnte.

Wir gehen jetzt einmal vom wirklichen Standardsetting aus, d.h. wir legen eine psychologisch-realistische **Korrelation von r = 0.2** zugrunde, und entscheiden so dichotom, wie oben beschrieben. Dann finden wir, dass wir „nur“ eine **Sensitivität/Spezifität/Genauigkeit** von etwa **56%** erreichen. Das heißt, wir sind gar nicht so viel besser, als wenn wir zur Entscheidung die Münze werfen. Gleichzeitig treffen wir immerhin ca. **1,3  mal so viele korrekte, wie falsche Entscheidungen**. Erst bei einer optimistischen Korrelation von **r = 0.5** knacken wir zwei gedanklich wertvolle Marken: **2/3** der Entscheidungen sind korrekt und wir erreichen doppelt so viele korrekte wie falsche Entscheidungen. Doch um hier hin zu gelangen, ist einiges an Gehirnschmalz und (Forschungs-) Aufwand notwendig. 

Gleichzeitig ist die Korrelation von r = 0.5 für das spezifische Feld der Personalauswahl eine gewissermaßen „magische“ Korrelation, denn sie entspricht der in der vielleicht bedeutendsten Meta-Analyse der Personalauswahl gefundenen **Validität (/Korrelation) von Intelligenzverfahren für die Personalauswahl**. Zu bedenken ist aber, dass diese angegebenen Korrelationen **korrigiert** wurden für die **imperfekte Messgenauigkeit** in Prädiktor und Kriterium (weder der Berufserfolg noch die Intelligenz lassen sich perfekt messen) sowie die **Einschränkung der Varianz** in Prädiktor und Kriterium (im tatsächlichen Beruf wird man nie Personen finden, die ganz unten am Leistungsspektrum angesiedelt sind, ebenso wenig wird man die komplette Range der Intelligenz abbilden - man denke an komplexe Ingenieursberufe). In gewisser Weise gelten diese Korrelationswerte also nur in der Welt perfekt gemessener Variablen, doch diese ist eben nicht von dieser Welt.

Aber wir gehen etwas weiter in der großen Metaanalyse. **Kombiniert man Intelligenzverfahren mit strutkturierten Interviews, Arbeitsproben, oder  Integritätstests, kommt man auf eine Validität von 0.6**. Laut dem neueren Paper von Schmidt und Kollegen (das aber seit 2016 ein „working Paper“ ist – keine Ahnung, wieso) scheinen in den Jahren nach 1998 auch anderen Interviewmethoden (unstrukturierte, strukturiert-telefonisch) mit ähnlichen Validitätssteigerungen verbunden zu sein. Außerdem gingen die Schätzungen für die multiple Korrelation (wir kombinieren mehrere X-Werte, um den Y-Wert vorherzusagen), sodass man scheinbar sogar mit korrigiertem r über 0.7 operiert. Hier bleibt jedoch festzuhalten, dass angesichts von Publication Bias, Questionable Research Practices etc. man gut daran tut, von geringeren Korrelationen auszugehen, außerdem interessieren im echten Leben weniger die korrigierten als die manifesten Korrelationen. 0.2 bis 0.4 dürfte dann die Range sein, auf die wir uns einstellen sollten. 

Als Beispiel: Kramer (2009) hat für Deutschland untersucht, wie die Korrelationen von Arbeitsleistung und Intelligenz ausfällt und gibt hier einen **mittleren korrigierten Wert von r = 0.62** an, unkorrigiert landet man aber bei **.33**. Was dann wieder näher an der Durschnittspsychologenkorrelation von 0.2 ist. **Korrigiert für Publication Bias**, landet Kramer dann bei **.19** – beinahe die Punktlandung auf 0.2.


## Wie viel besser sind die Eingestellten?

Bleibt die zweite Frage von oben zu klären: Wie viel besser sind die Eingestellten (nochmal: „Eingestellt“ = Als-Geeignet-Eingeschätzt = überdurchschnittliche Prädiktor- oder X-Variable) tatsächlich? Dafür schauen wir die untere der beiden Tabellen über der Grafik an. Hier habe ich einige Werte für das Kriterium aufgeführt. 

- **Kriteriumsmittel Ueber-/Unterdurchschnitt-Praediktor**: Dieser Wert gibt den Mittelwert auf einer Z-Skala (Mittelwert 100, Standardabweichung = 10) für das Kriterium an: 1. von denen, die auf dem Prädiktor überdurchschnittlich  abschneiden (überdurchschnittlich intelligent sind), 2. die auf dem Prädiktor unterdurchschnittlich abschneiden (unterdurchschnittlich intelligent sind).

- **% Ueberdurchschnitt-Praediktor > Unterdurchschnitt-Praediktor**: Wie viel Prozent derjenigen, die überdurchschnittlich im Prädiktor abschneiden, sind auch überdurchschnittlich im Kriterium? Also: Wie viel Prozent der überdurchschnittlich intelligenten Personen werden erwartungsweise besser von ihren Vorgesetzten eingeschätzt als die unterdurchschnittlich intelligenten?

- **% Ueberdurchschnitt-Praediktor ueber Kriteriumsmittel**: Der Anteil der Personen, die überdurchschnittlich im Prädiktor abschneiden und über dem Gesamtmittelwert des Kriteriums liegen.

Bei einer **Korrelation von 0.3** finden wir, dass die als **geeignet eingeschätzten Kandidaten** in der Vorgesetzteneinschätzung etwas weniger als eine **halbe Standardabweichung** (gemeinsame Standardabweichung zugrundegelegt) **über** den als **nicht geeignet** eingeschätzten Kandidaten liegen  und gleichzeitig nur in etwa **1/5 Standardabweichung über dem Gesamtmittelwert** von 100 liegt. Wir finden außerdem, dass sie in etwa **63% der Fälle besser abschneiden, als die Kandidaten, die wir *nicht* für geeignet halten**. Bleibt noch zu erwähnen, dass die Eingestellten in ca. **60% der Fälle über dem Gesamtmittel** der Vorgesetzten liegen (wieder: bei Symmetrie aller Raten, entspricht das den Spezifizitäts-/Sensitivitäts-/Genauigkeitswerten). 

Zum besseren Verständnis gehe ich hier auch nochmal das Gleiche mit r = 0.5 durch. Die überdurchschnittlich Intelligenten liegen nun **4 Z-Werte** über dem Gesamtmittel, also schon fast eine halbe Standardabweichung. Gleichzeitig liegen sie **8 Z-Wertpunkte über den unterdurchschnittlich intelligenten** (= Cohen's *d* von 0.8, bei zugrundegelegter gemeinsamer Standardabweichung). Ferner werden sie in fast **75% der Fälle besser** von ihren Vorgesetzten **eingeschätzt** als die unterdurchschnittlich intelligenten, in **2/3 der Fälle** werden sie als **überdurchschnittlich geeignet** von den Vorgesetzten **eingeschätzt**.

## Alle guten Effekte haben eine Ende

Bevor wir zum Ende gelangen, noch ein paar abschließende Bemerkungen. Die vielen Prozentzahlen lassen erahnen, dass damit unsere Korrelationen wirklich durchschlagende Effekte bringen, wir mit größeren Fallzahlen immer in der Welt der absoluten Zahlen schönere Endeffekte erwarten können. Zum Beispiel: Nehmen wir an, unsere Auswahl auf Basis der Korrelation von 0.3 sorgt dafür, dass ein so ausgesuchter Kandidat im Schnitt 2,000€ mehr Umsatz pro Jahr generiert, dann ist dieser Effekt bei 10 Kandidaten eben „nur“ 20,000€ Wert, bei 100 Kandidaten aber schon 200,000€. Wenn die Bewerber dann noch im Schnitt 10 Jahre im Unternehmen bleiben, ist mit schönen Skaleneffekten zu rechnen (unter der sehr vereinfachten Annahme, dass die ursprüngliche Korrelation zwischen Intelligenz und Umsatz bestehen bleibt). Die Kosten für den einmalig durchgeführten Intelligenztest unterscheiden sich aber zwischen 10 und 100 Kandidaten nicht so sehr. Der Intelligenztest wird so gesehen nicht für jeden weiteren durchgeführten Test besonders viel teurer sein, aber ihn erst einmal zu bauen, da steckt schon Aufwand dahinter. Für solche Berechnungen gibt es einige Nutzenmodelle, die ich mir im Voraus zu diesem Blogeintrag auch angeschaut habe, allerdings fand ich das zumeist nicht besonders erquicklich, weshalb ich mich dagegen entschieden habe, diesen Blogeintrag mit Fokus auf diesen Modellen zu schreiben (damit  bin ich glaube ich den Weg der Forschung nachgegangen: Neuere Forschung zu diesen Nutzenmodellen habe ich wenig gefunden.). 

Der Sinn dieser abschließenden Bemerkung ist, dass das letzte Thema bei der Beurteilung von Effekten immer die Einbettung in der realen Welt ist. Das kann die Berechnung des zusätzlich generierten Umsatzes von intelligenteren Personen, die Heilungsrate bei gewissen Krankheiten/Störungen, oder eine subjektiv akzeptable Anzahl korrekter/falsche Entscheidungen sein. Daraus mache ich aber keinen Blogeintrag mehr (der guten Dinge sind nun schon 3), sondern verabschiede mich bis zum nächsten Mal.


<br>
<iframe height="800" width="100%" frameborder="no" src="https://sbuettner.shinyapps.io/correlations/"> </iframe>
<br>
------
--

Quellen:

Kramer, J. (2009). Allgemeine Intelligenz und beruflicher Erfolg in Deutschland: vertiefende und weiterführende Metaanalysen. *Psychologische Rundschau, 60*(2), 82-98.

Schmidt, F. L., & Hunter, J. E. (1998). The validity and utility of selection methods in personnel psychology: Practical and theoretical implications of 85 years of research findings. *Psychological bulletin, 124*(2), 262.

[Schmidt, F. (2016). The Validity and Utility of Selection Methods in Personnel Psychology: Practical and Theoretical Implications of 100 Years of Research Findings. *Working Paper*.](https://home.ubalt.edu/tmitch/645/session%204/Schmidt%20&%20Oh%20validity%20and%20util%20100%20yrs%20of%20research%20Wk%20PPR%202016.pdf)
