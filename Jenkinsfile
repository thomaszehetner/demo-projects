pipeline {
  agent any

  triggers {
    cron '@midnight'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '60', artifactNumToKeepStr: '2'))
  }

  stages {
    stage('build') {
      steps {
        script {          
            docker.build('maven-selenium').inside {
              def workspace = pwd()
              def phase = env.BRANCH_NAME == 'master' ? 'deploy' : 'verify'
              maven cmd: "clean ${phase} -Dmaven.test.failure.ignore=true  " + 
                        "-Dengine.directory=${workspace}/html-dialog-demos/html-dialog-demos/target/ivyEngine " +
                        "-Dtest.environemnt=dev-axonivy " +
                        "-DaltDeploymentRepository=repo.axonivy.com::https://repo.axonivy.com/artifactory/libs-snapshot-local"
              checkVersions()
              archiveArtifacts '**/target/*.iar,**/target/*.zip'
              archiveArtifacts artifacts: '**/target/selenide/reports/**/*', allowEmptyArchive: true
              recordIssues tools: [eclipse()], unstableTotalAll: 1
              recordIssues tools: [mavenConsole()], unstableNewAll: 1, qualityGates: [[threshold: 1, type: 'NEW', unstable: true]]
              junit testDataPublishers: [[$class: 'StabilityTestDataPublisher']], testResults: '**/target/*-reports/**/*.xml'          
            }          
        }
      }
    }
    stage('check editorconfig') {
      steps {
        script {          
            docker.image('mstruebing/editorconfig-checker').inside {
              sh 'ec -no-color'
            }          
        }
      }
    }
  }
}
