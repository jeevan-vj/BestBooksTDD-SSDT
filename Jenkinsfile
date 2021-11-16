pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                 def msbuild = tool name: 'DefaultMSBuild', type: 'hudson.plugins.msbuild.MsBuildInstallation'
                 bat "${msbuild} BMyBestBooks/MyBestBooks.sln.sln"
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
