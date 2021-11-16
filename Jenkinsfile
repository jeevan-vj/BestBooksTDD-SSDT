pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bat 'nuget restore BMyBestBooks/MyBestBooks.sln'
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
