job('ansible-dsl') {
  description('Este es un job de ansible con DSL')
  parameters {
    choiceParam('EDAD', ['20 (default)', '21', '22', '23', '24', '25'])
  }
  steps {
    ansiblePlaybook('/var/jenkins_home/ansible/people.yml') {
      inventoryPath('/var/jenkins_home/ansible/hosts')
      extraVars {
        extraVar('EDAD', '$EDAD', false)
      }
    }
  }
}
