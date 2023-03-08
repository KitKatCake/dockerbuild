pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS_USR="dockeformine"
    DOCKERHUB_CREDENTIALS_PSW="dckr_pat_kHpPH7bwUvceAw-K690r1EnhkpQ"
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dockeformine/hello-java:latest .'
      }
    }
     stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
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
