pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts: "*/*.txt", fingerprint: true
            }
    }
}
}

