pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                script{
                    sh "dd if=/dev/urandom of=.txt bs=5MB count=1"
                }
                 archiveArtifacts "*/*.txt", fingerprint: true
            }
    }
}
}

