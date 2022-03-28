url_access="access_token=YWRiNzQxODctY2E5ZC00Y2FjLThkODgtZmUzY2Q0NWM4MjJjOmE1NTVmMTJhZTJhNjQyZmVhZDI1MzU4NTY0MTlkZDRk&authenticationMethod=Basic&timestamp=2022-03-28T11:47:01.476Z"

curl -X POST "https://hits.test.nsip.edu.au/SIF3InfraREST/hits/requests/SchoolInfos?$url_access" -H "Content-Type: application/xml" -H "Accept: application/xml" -d @SchoolInfos.xml

curl -X POST "https://hits.test.nsip.edu.au/SIF3InfraREST/hits/requests/CollectionRounds?$url_access" -H "Content-Type: application/xml" -H "Accept: application/xml" -d @CollectionRounds.xml

curl -X POST "https://hits.test.nsip.edu.au/SIF3InfraREST/hits/requests/CollectionStatuss?$url_access" -H "Content-Type: application/xml" -H "Accept: application/xml" -d @CollectionStatuss.xml
