pipeline{
    agent any

    stages {
        stage('build'){
            steps{
                echo 'building..'
            }
        }
        stage('Test'){
            steps{
                echo 'Testing..'
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploying..'
            }
        }
        stage('Archive') {
            steps{
                 archiveArtifacts "private-bastion-with-nat-gateway/*"
            }
    }
}
}

