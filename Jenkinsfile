pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts "*/*.txt"
            }
        }

        stage ('Unarchive'){
            unarchive mapping: ["*/*.txt":'.']
        }

        stage('Stash'){
            steps{
                stash name: 'stuff', includes: '*'
            }
        }

        stage('Unstash'){
            unstash 'stuff'
        }
    }
}

