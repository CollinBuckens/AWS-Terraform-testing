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
        stage('Archive'){
            archiveArtifacts "pegus-artifact-storage/artifacts/*"
            }
        }
    }
}
