pipeline {
    agent {
        label 'Jenkins-Agent'
    }
    
    tools {
        jdk 'Java17'
        maven 'Maven-3.8.5'
    }

    environment {
          APP_NAME = "register-app-pipeline"
          RELEASE = "1.0.0"
          DOCKER_USER = "devopsdktraining"
          DOCKER_PASS = "Docker"
          IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
          IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
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
                    currentBuild.displayName = "#${env.BUILD_NUMBER} - deepak"
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

         // SonarQube Quality Check
        
        stage('SonarQube Quality Check') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'Sonar') {
                        sh "mvn sonar:sonar"
                    }
                }    
            
            }
        }

        // PWD and ls
        stage('SonarQube Quality Check') {
            steps {
                script {
                    sh "pwd"
                    sh "ls -lrt"
                }    
            
            }
        }

        // Build and Push Docker Image 
        stage('Build and Push Docker Image') {
            steps {
                script {
                   docker.withRegistry('' ,DOCKER_PASS) {
                       docker_image = docker.build "${IMAGE_NAME}"
                    }

                    docker.withRegistry('' ,DOCKER_PASS) {
                       docker_image.push("${IMAGE_TAG}")
                       docker_image.push('latest')
                    }
                    
                }    
            }
        }
    
        
    }
}
