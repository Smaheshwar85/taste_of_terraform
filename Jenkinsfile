pipeline {

  agent any

  environment {
    SVC_ACCOUNT_KEY = credentials('terra-secret')
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY  > ./creds/serviceaccount.json'
      }
      
    }
    
    stage('terraform init'){
            steps{
               sh 'terraform init' 
            }
            
        }
         stage('terraform apply'){
            steps{
               sh 'terraform apply --auto-approve' 
            }
            
        }
        

    } 

}
