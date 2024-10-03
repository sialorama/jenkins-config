pipeline {
    agent any
    
    stages {
        stage('Install dependencies') {
            steps {
                // Installer les dépendances Node.js
                sh 'npm install'
            }
        }
        
        stage('Run Tests') {
            steps {
                // Exécuter les tests avec Mocha
                sh 'npm test'
            }
        }
    }

    post {
        always {
            // Archiver les résultats de test et les logs, si nécessaire
            junit '**/test-results.xml'
        }

        failure {
            // Notifier en cas d'échec
            echo "Tests failed. Check Jenkins for details."
        }

        success {
            // Notifier en cas de succès
            echo "All tests passed!"
        }
    }
}
