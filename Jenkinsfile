pipeline {
    agent {
        label 'Jenkins-Agent'
    }
    
    tools {
        jdk 'Java17'
        maven 'Maven-3.8.5'
    }

    stages {
        
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }    
        
        // Print Environment Variables
        stage('Print Environment Variables') {
            steps {
                script {
                    echo "The Job name is: ${env.JOB_NAME}"
                    echo "The Node name is: ${env.NODE_NAME}"
                    echo "The Build Number is: ${env.BUILD_NUMBER}"
                    echo "The Jenkins Home directory is: ${env.JENKINS_HOME}"
                    currentBuild.displayName = "#${env.BUILD_NUMBER} - My Build Name"
                }
            }
        }
        
        //Checkout Code
        
        stage('Checkout Code from Github') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/msdeepak052/registration-app.git'
            }
        }
        
        //Maven Build
        
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        // Test Application
        
        stage('Test Application') {
            steps {
                sh "mvn test"
            }
        }
        
        
        
    }
}
