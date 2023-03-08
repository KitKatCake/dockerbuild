pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    '''DOCKERHUB_CREDENTIALS_USR="dockeformine"'''
    '''DOCKERHUB_CREDENTIALS_PSW="dckr_pat_kHpPH7bwUvceAw-K690r1EnhkpQ"'''
    DOCKERHUB_CREDENTIALS=credentials('332c0c4b-0ea3-46c7-815a-52c0b9b2e56e')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dockeformine/hello-java:latests .'
      }
    }
     stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push dockeformine/hello-java:latests'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
