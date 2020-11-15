pipeline {
    agent { dockerfile true }
    environment {
        work_dir='/home/jenkins/work'
        bundle='/home/jenkins/bin/bundle'
        deploy_dir='/home/jenkins/deploy'
    }
    stages { // 私の場合、特にステージごとの環境変数は必要なかったです。
        stage('Check Environment') {
            environment { 
                LOCAL_VAR='/home/jenkins/target_dir' 
            }
            steps {
                sh 'printenv'
            }
        }
        stage('Build') {

            steps{
                script {
                    dockerImage = docker.build()
                }
            }
        }
        stage('Upload container to Docker Registry') {
            steps {
                script {
                    docker.withRegistry( '', 'dockerhub' ) {
                        dockerImage.push("bamuse/udacity_devops_capstone")
                        dockerImage.push("latest")
                    }
                }

            }
            }
    }
}