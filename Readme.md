# Dokumentation Docker LB3

## Docker Swarm
Docker Swarm ist die Inhouse Cluster funktion von Docker. Dies wird gebraucht um Docker Conainter simpel zu skalieren und anzupassen. 
Mit Docker Swarm hat man ausserdem die möglich keit sehr einfach ein Failover einzurichten. 
High Availability ist mit docker Swarm auch ein klaks. 

### Docker Swarm Installation 
Um den Docker Swarm zu konfigurieren muss mann zuerst mehrere Server haben. Unter diesen Servern definiert mann dann einen Manager. Dieser deligiert dann denn Nodes die Container (im Docker umfeld "Worker" gennant.)

### Manager Konfiguration
Zuerst muss mann die IP des Manager Server herausfinden. diese ist sehr wichtig bei der Konfig, da diese im Command mitgegeben werden muss um den Workern zu zeigen wo der Manager ist. 

Folgender Command wird gebraucht um den Swarm zu erstellen: 

**docker swarm init --advertise-addr 192.168.122.14** <---- IP des Manager Servers. Diese wird dann im Token für die Workers gespeichert.

Nun wurde ein Swarm erstellt mit dem Server mit der IP 192.168.122.14 als manager.

### Worker Konfig 
Die Worker Konfiguration ist ziemlich simple, da mann auf dem Manager Node einen Token bekommt, welcher mann dann beim Worker eingetragen muss. 
Der Befehl ist wie folgt: 

**docker swarm join --token SWMTKN-1-01y8ba4esviwwllq26eu9ijtb1fweksugum1aovi7285ze2ezt-evwywmh5rqnbtd7oyho42ni6g 192.168.36.100:2377**

Der Port 2377 muss für die Kommunikation Offen sein. 





## Portainer

# was ist Protainer 
Portainer ist ein GUI für Docker, was die Verwaltung von Appliances vereinfacht. Die Steuerung erfolgt über ein intuitives Web-GUI mit dem alle notwendigen Einstellungen getroffen werden können, und auch neue Docker-Instanzen erstellt werden können. Mittels weniger Befehle in der Kommandozeile kann man unter anderem einen anderen Server zum Portainer-Cluster hinzufügen um die Leistungsfähigkeit des gesamten Clusters zu erhöhen und z.B. Ausfallsicherheit zu garantieren.

## Installation 

### Voraussetzungen 

- Server mit beliebiger Linux-Distribution 
- Root-Rechte 

### Docker installation 

Bevor Sie Docker-Pakete installieren, aktualisieren Sie bitte das Repository auf Ihrem System und aktualisieren Sie die Pakete.

**Sudo apt update**

**Sudo apt upgrade**

Installieren Sie nun Docker mit dem untenstehenden apt-Befehl:



**sudo apt install docker.io -y**

Nachdem die Installation abgeschlossen ist, starten Sie den Docker-Dienst und ermöglichen es ihm, jederzeit beim Systemstart zu starten:

**Systemctl start docker**

**Systemctl enable docker**


Ob Docker auf dem Server installiert ist, überprüfen Sie mit dem folgenden Befehl:
Docker version

## Installation und Konfig Portainer

Der Portainer kann als Docker-Container und als Standalone-Version ohne Docker-Container installiert werden. 
In diesem Tutorial werden wir Portainer als Docker-Container installieren. Die Installation ist  einfach zu meistern, weil wir nur die Systemunterstützung für Docker sicherstellen müssen. Bevor Sie Portainer installieren, laden Sie das Portainer-Image vom DockerHub herunter, indem Sie den nachstehenden Befehl zum Ziehen des Dockers verwenden.

**docker stack deploy --compose-file=portainer-agent-stack.yml portainer**


Portainer läuft jetzt als Container, überprüfen Sie dies mit dem Befehl docker ps:

**Docker stack**

oder aber auch mit 

**Docker ps**

Nun  konnten wir auf das GUI Zugreifen. dort mussten wir dann noch das Admin Passwort anpassen. (Achtung wenn dies nicht innert 10 min passiert wird der Container wieder destroyed und mann darf von anfang anfangen)

mann kann nun in der TBZ Cloud über folgende IP Darauf zugreifen:
**http://192.168.122.14:9000/**

### Bereitstellen eines Service

Nach der Installation kann mann aus verschiedenen Templates auswählen, aber auch seine Eigenen Scripts ausführen. 
wichtig ist, dass man bei unsere Konfig einen Service deployen sollte, da mann sonst die funktionalität des Swarms nicht nutzten kann. 

### Service Verwalten
Portainer bietet eine einfache und leicht zu bedienende Möglichkeit zur Verwaltung von Docker-Containern als Service.

Von dieser Portainer-Verwaltung aus können wir starten, stoppen, neu starten, einen neuen Service erstellen, auf die Shell des Containers zugreifen, das Container-Protokoll und die Statistiken des Containers-Service einsehen.

## Software übersicht

### Dashboard
Nach der Anmeldung an Portainer wird das Dashboard angezeigt, das bereits einen guten Überblick über den Docker-Host liefert. Auf einen Blick sind Hardwareinformationen wie die Anzahl der Prozessoren und die Größe des Arbeitsspeichers, sowie Docker spezifische Informationen (Anzahl der Container, Images, Volumes und Networks) ersichtlich

### Verwalten von Containern und Images
Die Container-Ansicht bietet verschiedene Möglichkeiten die Container in einer Umgebung zu verwalten. Wie in Abbildung 2 ersichtlich, werden im ersten Schritt Basisinformationen zu den vorhandenen Containern angezeigt. Welche Container angezeigt werden, lässt sich über Filter einschränken.Mit einem Klick auf einen der Container können detaillierte Informationen zu dem jeweiligen Container abgerufen werden. Zudem können z. B. eine Konsolen-Session zu dem Container geöffnet oder ein Image von dem Container erstellet werden. Diese Funktionen sind zum Teil auch über „quick actions" direkt aus der Container-Übersicht erreichbar. Die Basisansicht ermöglicht des Weiteren den Status der einzelnen Container zu verändern, also die Container u. a. zu stoppen, starten oder löschen, sowie neue Container zu erstellen. Der Dialog zum Erstellen eines Containers ist letztlich eine Abbildung der Optionen des docker run Kommandos. Diese sind thematisch sortiert in einzelnen Reitern gruppiert und werden stellenweise durch Tooltips erläutert. Dabei kann ausgewählt werden von welcher der konfigurierten Registry das Image bezogen werden soll.

Portainer stellt alle grundlegenden Funktionen zur Verwaltung von Images bereit. Es können Images aus einer Registry heruntergeladen, gelöscht und erstellt werden. Das für das Erstellen eines Images benötigte Dockerfile kann über drei Wege zur Verfügung gestellt werden.

- Mit einen Webeditor kann das File direkt im Browser geschrieben werden. 
- Über ein Upload-Formular kann entweder direkt ein Dockerfile oder ein tar-Archiv, 
- Dem ähnlich kann die URL zu einem Dockerfile, einem tar-Archiv oder einem öffentlichen Git-Repository angegeben werden. Im Falle des tar-Archivs bzw. des Repositories müssen diese den gesamten Build-Kontext enthalten.

### Stacks und Templates

Neben einzelnen Containern bietet Portainer auch die Möglichkeit ganze Stacks von Containern zu definieren. Dabei wird für die Definition des Stacks das Docker-Compose-Format (aktuell wird Version 2 unterstützt) genutzt. Die Docker-Compose-Datei kann, analog wie für das Dockerfile beschrieben, zur Verfügung gestellt werden. Wurde ein Stack außerhalb von Portainer erstellt, wird dieser zwar angezeigt und man erhält einen guten Überblick über die zusammenhängenden Container aber die Verwaltung eines Stacks ist nur möglich, wenn dieser auch in Portainer erstellt wurde. 
Application Templates sind ein Feature von Portainer, das so direkt in Docker nicht verfügbar ist.Dabei handelt es sich um vordefinierte Container, für die einige Optionen, wie z. B. das zu verwendende Image, Port-Mappings und Volumes, bereits vordefiniert sind. Standardmäßig können nur die von Portainer bereitgestellten App Templates genutzt werden. Es ist aber möglich eigene Templates in Form einer JSON-Datei zu erstellen und diese unter Einstellungen, mit dem Verwies auf die URL zur Template-Datei, der Portainer Instanz bekannt zu machen. Diese eigenen Templates können dann wie die vordefinierten Templates eingesetzt werden.

### User Management 

Neben den technischen Funktionen für Docker besitzt Portainer auch eine umfangreiche Benutzerverwaltung. Diese biete die Möglichkeit Benutzer und Teams anzulegen. Dabei kann einem Benutzer zusätzlich die Admin Rolle und die Teamleiter Rolle zugewiesen werden. Ein Administrator hat den vollen Zugriff auf die Portainer Umgebung und alle Docker Engines. Ein Teamleiter kann die Benutzer seines Teams verwalten (neue Benutzer hinzufügen und bestehende Benutzer entfernen). Ein Team wird einem oder mehreren Docker-Instanzen zugewiesen, um den Mitgliedern des Teams dessen Verwaltung zu ermöglichen. Dabei lassen sich die Funktionen allerdings nicht einschränken, sodass jeder Benutzer des Teams den vollen Funktionsumfang der jeweiligen Instanz nutzen kann. Ein umfassendes Rechtemanagement, das die dedizierte Zuweisung von einzelnen Rechten (z. B. Erstellen von Containern) an Benutzer oder Teams ermöglicht, fehlt allerdings noch.


### Fazit 

Portainer kann durch eine gut durchdachte Implementierung der Standard-Docker-Funktionen, wie die Verwaltung von Containern, Images und Stacks überzeugen. Zudem bietet es mit den Application Templates und dem User Management weitere Möglichkeiten, die mit Docker alleine nicht zur Verfügung stehen und einen großen Mehrwert bieten. Insbesondere das User Management birgt großes Potenzial, wenn es in Zukunft um ein umfassendes Rechtemanagement erweitert werden würde. Gerade die Übersichtlichkeit der Weboberfläche erleichtert die Arbeit mit einer Docker Engine ungemein und durch die einfache Bereitstellung und Konfiguration von Portainer ist es auch für kleinere Docker-Projekte hervorragend geeignet.





