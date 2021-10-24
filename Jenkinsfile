pipeline {

  agent any

  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY  > base64 -w0  .\creds\serviceaccount.json'
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
