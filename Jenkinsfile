pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dockeformine/hello-java:latest .'
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
