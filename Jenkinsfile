pipeline{
    agent any

    stages {
        stage('Archive') {
            steps{
                archiveArtifacts "*/*.txt"
            }
        }
        /*
        stage('UnArchive'){
            steps{
                unarchive mapping: ['artifacts/' : '.']
            }
        }
        */

        stage('Stash'){
            steps{
                stash name: 'stuff', includes: '*', allowEmpty:true
            }
        }
        /*
        stage('UnStash'){
            steps{
                unstash name: "stuff"
            }
        }
        */
    }
}

