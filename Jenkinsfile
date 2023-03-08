pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('332c0c4b-0ea3-46c7-815a-52c0b9b2e56e')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dockeformine/hello-java:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo  | docker login -u  --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push dockeformine/hello-java:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
