pipeline {
    agent any

    stages {
        stage('Build') {
             steps{ tool name: 'MsBuild', type: 'msbuild' bat ""${tool 'MsBuild'}"MyBestBooks/MyBestBooks.sln /t:Rebuild /p:Configuration=Release" }
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
