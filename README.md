   ### devops-eksamen-infrastructure

<!--- Travis CI build status banner -->
[![Build Status](https://travis-ci.com/Opkris/devops-eksamen-infrastructure.svg?branch=master)](https://github.com/Opkris/devops-eksamen-infrastructure)

Her har vi Infrastrukturen koden til [devops-eksamen](https://github.com/Opkris/devops-eksamen).
 
 Dette "Repository" inneholder Terraform og Travis-CI kode som går til [Gcloud](https://cloud.google.com)


####Oppsett
'NB!' det er viktig at man har "Enable" _Cloud Run_ og _Container Registry_.     
For å setter opp infrastruktiren må vi lage en ny Service Account for Terraform som skal behandle 
prosjektet.

* Gi Service Acounten Rollene: 
    - _Google Storage Admin._
    - _Container Reistry Service Agent._ 
    - _Cloud Run Service Agent._
 
* Last med nøkkelfil for service account(en) og denne skal legges under/i root filen i prosjektet og 
    gi filen navnet:
     
          
    GCP-key.json
    
* Kryptering av filen
    - `NB! Detter krevet at du er logget på Travis-CI` 
    - Windows OS: finn prosjektet i "terminalen" skriv: 
    
    
    docker run -v $(pwd): --rm skandyla/travis-cli encrypt-file GCP-key.json --add 
    
    
(for noen kan dette være problematisk, slik det var for meg, anbefaler et annet OS eg. Linux i VM)
 
   - Mac/Linux ("Unix") OS: der kan man skrive i terminalen:
   
    travis encrypt-file --pro GCP-key.json --add
    
* Andre hemmeligheter som vi også trenger:

    
    travis encrypt --pro LOGZ_TOKEN=<Logz.io token til bruker> --add              
    travis encrypt --pro LOGZ_URL=<Logz.io URL for Logz.io> --add
    
Verdiene for `LOGZ_TOKEN` OG `LOGZ_URL` kan du finne inne på: 
`Logz.io` -> `Send your data` -> `Libraries` -> `Java - logback appender`

* Lag en "bucket" inne på Gcloud Dashbord ( under/i Storage browser) navnet skal skal legges 
til filen `bucket_id`

* Hvis alt har blitt gjort ordentlig skal projektet vare konfigurert med riktige hemmeligeter,
    Da trenger man kun å gjøre en push til master branch. og koden vil oppdatere infrastrukturen 
    
