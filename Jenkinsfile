pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts "*/*.txt"
            }
        }
        
        stage('UnArchive'){
            steps{
                unarchive mapping: ['*/*.txt' : '.']
            }
        }

        stage('Stash'){
            steps{
                stash name: 'first-stash', includes: '*/*.txt'
            }
        }
        
        stage('UnStash'){
            steps{
                unstash name: "first-stash"
            }
        }
    }
}

