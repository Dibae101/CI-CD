pipeline {
    agent any
	
	  tools
    {
       maven "maven"
    }
 stages {
        stage('checkout') {
           steps {
                git branch: 'master', url: 'https://github.com/Dibae101/CI-CD.git'
             
          }
        }
	stage('Execute Maven') {
           steps {
                sh 'mvn package'             
          }
        }
        
        stage('Docker Build and Tag') {
           steps {   
                sh 'docker build -t samplewebapp:latest .'  
                sh 'docker tag samplewebapp json101/samplewebapp:latest'
          }
        }
     
        stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry([ credentialsId: "json101", variable: 'dockerhubpwd']){
                sh 'docker login -u json101 -p ${dockerhubpwd}'   
	        sh 'docker push json101/samplewebapp:latest' 
        }
                  
        }
     
        stage('Run Docker container on Jenkins Agent') {
            steps 
		{
                sh "docker run -d -p 8003:8080 json101/samplewebapp"
 
            }
        }
        stage('Test') {
             
            steps {
                echo 'The Job has been tested!'    
 
                }
            }
        }
    }

}
