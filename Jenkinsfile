pipeline {

  agent any
stages {
  
  stage('Checkout') {
    environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
    
  }
  
      steps {
        //checkout scm
        sh 'mkdir -p /var/lib/jenkins/creds'
        sh "echo ' the is var $SVC_ACCOUNT_KEY'" 
        def var1= 'echo $SVC_ACCOUNT_KEY'
        sh 'echo $var1'
        sh 'base64decode(var1) > /var/lib/jenkins/creds/serviceaccount.json'
        //sh 'echo $SVC_ACCOUNT_KEY | base64decode > /var/lib/jenkins/creds/serviceaccount.json'
       // sh 'echo $SVC_ACCOUNT_KEY  > base64decode "/var/lib/jenkins/creds/serviceaccount.json" '
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

  /*

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY  > base64 -w0  ./creds/serviceaccount.json'
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
            
        }*/
        

   // } 

}
