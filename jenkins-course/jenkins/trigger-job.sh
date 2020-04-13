JENKINS_URL="localhost:8080"
crumb=$(curl -u "jenkins:1234" -s 'http://$JENKINS_URL:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "jenkins:1234" -H "$crumb" -X POST http://$JENKINS_URL:8080/job/ENV/build?delay=0sec
curl -u "jenkins:1234" -H "$crumb" -X POST  http://$JENKINS_URL:8080/job/backup-db-to-aws/buildWithParameters?DB_HOST=db_host&DB_NAME=testdb&BUCKET_NAME=bulbo-jenkins-udemy
