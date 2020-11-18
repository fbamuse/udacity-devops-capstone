pipeline {
    agent any
    stages { 
        stage('Check Environment') {
            steps {
                sh 'printenv'
                sh 'pwd'
            }
        }
        stage('lint Dockerfile') {
            steps {
                echo 'Lint dockerfile...'
                script  {
                    sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
                }
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
                //withAWS(region: 'ap-northeast-1', credentials: 'awscli') {     
                sh 'aws sts get-caller-identity'        
                sh 'aws eks --region ap-northeast-1 update-kubeconfig --name bamuse'
                //}
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to EKS cluster'
                //withAWS(region: 'ap-northeast-1', credentials: 'awscli') {
                echo 'Deploying to EKS cluster'
                sh 'aws eks --region  ap-northeast-1  update-kubeconfig --name bamuse'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl get pods'
                sh 'kubectl get services'
                //}
            }    
        }
    }   
}
