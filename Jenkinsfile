pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World Pipeline begins...'
         }
      }
      stage('Checkout') {
          steps {
              checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, userRemoteConfigs: [[url: 'https://github.com/suhasdevops/hello-world.git']]])
              //change GitRepo URL if you want
          }
      }
      stage('Clean') {
          steps {
              sh "mvn clean"
              //clean the previous artifacts
          }   
      }
      stage('Package') {
          steps {
              sh "mvn package"
              //package the source code
          }
      }
      stage('Deploy') {
          steps {
              //deploy to tomcat container
              deploy adapters: [tomcat9(credentialsId: 'tomcat_id', path: '', url: 'http://192.168.32.11:8084')], contextPath: null, war: '**/*.war'
              echo "I done it..."
          }
      }
   }
}
