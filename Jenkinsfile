pipeline {
    agent any
    environment {
        work_dir='/home/jenkins/work'
        bundle='/home/jenkins/bin/bundle'
        deploy_dir='/home/jenkins/deploy'
        // KUBECONFIG = credentials('kubeconfig')
    }
    stages { // 私の場合、特にステージごとの環境変数は必要なかったです。
        stage('Check Environment') {
            environment { 
                LOCAL_VAR='/home/jenkins/target_dir' 
            }
            steps {
                sh 'printenv'
                sh 'pwd'
            }
        }

        stage('Build Docker image') {
            steps {
                echo 'Building the Docker container...'
                script {
                dockerImage = docker.build("bamuse/udacity_devops_capstone")
                }
            }
        }
        stage('Upload container to Docker Registry') {
            steps {
                script {
                    docker.withRegistry( '', 'dockerhub' ) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Create kube config file') {
            steps {
                echo 'Deploying to EKS cluster'
                withAWS(region: 'ap-northeast-1', credentials: 'awscli') {     
                sh 'aws sts get-caller-identity'        
                sh 'aws eks --region ap-northeast-1 update-kubeconfig --name bamuse'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to EKS cluster'
                withAWS(region: 'ap-northeast-1', credentials: 'awscli') {
                echo 'Deploying to EKS cluster'
                sh 'aws eks --region  ap-northeast-1  update-kubeconfig --name bamuse'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl get pods'
                sh 'kubectl get services'
                }
            }    
        }
    }   
}
