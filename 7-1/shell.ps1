$podname = kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | select-string 'mysql'
kubectl cp ./create_database_quotesdb.sql ${podname}:/tmp/create_database_quotesdb.sql
kubectl cp ./create_database.sh ${podname}:/tmp/create_database.sh
kubectl exec deploy/mysql -- /bin/bash ./tmp/create_database.sh