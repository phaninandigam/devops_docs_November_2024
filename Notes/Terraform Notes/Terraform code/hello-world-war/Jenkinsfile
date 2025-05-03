pipeline {
    agent { label 'slave1' }
    stages {
        stage('checkout') {
            steps {
                echo "Fetching the repo"
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('deploy') {
            steps {
                sh 'cp /opt/jenkins_slave/workspace/Assignment_2_Jan_hello_world/target/hello-world-war-1.0.0.war /opt/apache-tomcat-10.1.34/webapps/'
            }
        }
    }
    post {
    success {
        mail to: "phani.nandigam@moengage.com",
             subject: "Jenkins Job Successful",
             body: "The Jenkins job completed successfully."
    }
    failure {
        mail to: "phani.nandigam@moengage.com",
             subject: "Jenkins Job Failed",
             body: "The Jenkins job failed."
    }
}


}
