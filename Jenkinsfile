pipeline {
    agent any

    stages {
        stage('Verify Branch') {
         steps {
            echo "$GIT_BRANCH"
         }
        }
        stage('Build using PS'){
            steps{
                 powershell 'Write-Host "Hello Jeevan from PS"'
                 powershell ' $ ./BuildSolution.ps1'
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
