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
                unarchive mapping: ['artifacts/' : '.']
            }
        }

        stage('Stash'){
                try{
                    stash name: 'stuff', includes: 'EC2-instance-jenkins-host/*'
                }
                catch (error){
                    echo "error stashing: ${error}"
                }
        }

        stage('UnStash'){
                try{
                    unstash name: "stuff"
                }
                catch (error){
                    echo "error unstashing ${error}"
                }
        }
    }
}

