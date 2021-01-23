kubectl apply -f jenkins_instance.yaml -n jenkins

 k get secret

 jenkins-operator-credentials-jenkins-server-v100

 kubectl get secret jenkins-operator-credentials-jenkins-server-v100 -o 'jsonpath={.data.user}' | base64 -d
kubectl get secret jenkins-operator-credentials-jenkins-server-v100 -o 'jsonpath={.data.password}' | base64 -d

#jenkins-operator
#nVIZwxua6LPZHFJr8Llv