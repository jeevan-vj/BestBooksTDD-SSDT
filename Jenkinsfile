pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                 script {
                          def msbuild = tool name: 'MSBuild', type: 'hudson.plugins.msbuild.MsBuildInstallation'
                          bat "${msbuild} MyBestBooks/MyBestBooks.sln"
                         } 
            }
        }
        stage('ps step'){
            steps{
                powershell 'Write-Host "Hello Jeevan from PS"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
