# Servicemanagement in Netzen WS18/19 - Docker Lab

## Übersicht

Dieses Git-Repository enthält mehrere Ansible-Rollen und Programme, die im Laufe des Kurses "Servicemanagement in Netzen" erstellt wurden. Außerdem wird ein Vagrantfile zur Verfügung gestellt, dass es ermöglicht, eine Teilmenge dieser Rollen auf mehrere virtuelle Maschinen zu installieren.

## Rollen
Folgende Rollen sind enthalten:

- `activitywebserver`: Startet zwei Webserver. Ein Webserver ist PHP-fähig und liefert sowohl statischen Content, als auch ein PHPInfo-Skript aus. Es ist außerdem ein Docker Compose-File enthalten, das zusätzlich einen "toolbox"-Container startet, der diverse Netzwerkanwendungen zur Verfügung stellt.
- `ansible`: Installiert eine aktuelle Version von Ansible auf der Zielmaschine.
- `apparmor`: Installiert das Mandatory Access Control-Framework [AppArmor](https://wiki.ubuntu.com/AppArmor) auf der Zielmaschine, das zusätzliche Möglichkeiten bereitstellt, Anwendungen einzuschränken und abzusichern.
- `docker`: Installiert Docker, Docker Compose und Abhängigkeiten, die benötigt werden, um Docker über Ansible zu steuern.
- `login`: Richtet das Zielsystem so ein, dass Projektnutzer erstellt werden. Außerdem wird der SSH-Daemon gehärtet, sodass nur noch sichere Algorithmen verwendet werden, kein Root-Login mehr möglich ist und ein Login nur noch über Public Key Authentication stattfinden kann.
- `other_packages`: Installiert einige nützliche Tools und startet Services wie z.B. Docker automatisch.
- `phpwebserver`: Der PHP-Anteil von `activitywebserver` in statischer und dynamischer Ausführung.
- `swarm`: Erstellt einen Swarm Cluster aus den per Vagrant hochgezogenen VMs und installiert mehrere Services: Portainer, Visualizer und den [Activitylog-Stack](https://github.com/svcmgmt1819-mhdw/activitylog) samt Datenbank und `nginx`-Loadbalancer
- `vagrant`: Installiert eine aktuelle Version von Vagrant auf der Zielmaschine.
- `vbox`: Installiert eine aktuelle Version von VirtualBox auf der Zielmaschine.

## Vagrantfile
Die Testumgebung kann über die Ausführung von
```
vagrant up
```
hochgefahren werden. Es wird eine aktuelle Version von Vagrant und Virtualbox benötigt. Das `Vagrantfile` definiert folgende Maschinen:

- Eine variable Anzahl an Swarmhosts, standardmäßig drei Stück: `dockhost0`, `dockhost1` und `dockhost2`. **Es werden maximal neun Hosts unterstützt.**
- Die Maschinen werden in einem Swarm zusammengeschlossen.
- Es werden zwei Stacks gestartet:
    - Management: Portainer & Visualizer
    - Activitylog: Nginx-Loadbalancer, Datenbank und mehrere `Activitylog`-Frontend-Instanzen mit verschiedenen, voreingestellten Farben.
- Außerdem werden die Rollen `apparmor`, `login` und `other_packages` installiert.