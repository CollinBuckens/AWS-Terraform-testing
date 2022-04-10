pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts "*/*.txt"
            }
        }
        stage('Stash'){
            steps{
                stash name: 'stuff', includes: '*'
            }
        }
    }
}

