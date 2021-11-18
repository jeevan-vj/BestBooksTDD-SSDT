def GetNextFreePort() {
    def port = sh(returnStdout: true, script: 'ruby -e \'require \"socket\"; puts Addrinfo.tcp(\"\", 0).bind {|s| s.local_address.ip_port }\'')
    return port.trim()
}

 environment {
        PORT_NUMBER            = 0
        SCM_PROJECT            = "BestBook"
        CONTAINER_NAME         = "SQLLinux${env.BRANCH_NAME}"
        VOLUME_NAME            = "${SCM_PROJECT}_${env.BRANCH_NAME}_${env.BUILD_NUMBER}"
    }

def StartContainer() {    
    PORT_NUMBER = GetNextFreePort()
    sh "docker run -v ${VOLUME_NAME}:/var/opt/mssql -e \"ACCEPT_EULA=Y\" -e \"SA_PASSWORD=P@ssword1\" --name ${CONTAINER_NAME} -d -i -p ${PORT_NUMBER}:1433 microsoft/mssql-server-linux:2017-GA && sleep 10"    
    sh "/opt/mssql-tools/bin/sqlcmd -S localhost,${PORT_NUMBER} -U sa -P P@ssword1 -Q \"EXEC sp_configure 'show advanced option', '1';RECONFIGURE\""
    sh "/opt/mssql-tools/bin/sqlcmd -S localhost,${PORT_NUMBER} -U sa -P P@ssword1 -Q \"EXEC sp_configure 'clr enabled', 1;RECONFIGURE\""
    sh "/opt/mssql-tools/bin/sqlcmd -S localhost,${PORT_NUMBER} -U sa -P P@ssword1 -Q \"EXEC sp_configure 'clr strict security', 0;RECONFIGURE\""
}


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
                 powershell(script: "./BuildSolution.ps1")
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
