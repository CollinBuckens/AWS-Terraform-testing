pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts "*/*.txt"
            }
        }

        stage ('Unarchive'){
            steps{
                unarchive mapping: ["*/*.txt":'.']
            }
        }

        stage('Stash'){
            steps{
                stash name: 'stuff', includes: '/private-bastion-with-nat-gateway/*'
            }
        }
    }
}

