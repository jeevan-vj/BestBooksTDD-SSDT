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
                pwsh(script: './BuildSolution.ps1')
            }
        }
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
