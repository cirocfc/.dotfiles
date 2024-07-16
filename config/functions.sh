#!/bin/bash

# ? +===========================================================+
# ? | FUNCTIONS                                                 |
# ? +===========================================================+


# ? +-----------------------------------------------------------+
# ? | docker.login                                              |
# ? +-----------------------------------------------------------+
# ? | Utility to login to a Docker Registry.                    |
# ? +-----------------------------------------------------------+
docker.login.ip() {
  aws ecr get-login-password --profile $DEFAULT_AWS_ECR_PROFILE | \
    docker login --username AWS --password-stdin ${DEFAULT_AWS_ECR_URL}
}

docker.login.erp() {
  docker login -u caadmin -p "${DOCKER_TOKEN}"
}

# ? +-----------------------------------------------------------+
# ? | docker.amd                                                |
# ? +-----------------------------------------------------------+
# ? | Force using amd64 architecture in Mac OS                  |
# ? +-----------------------------------------------------------+
docker.amd() {
if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
    /usr/local/bin/docker "$@"
  fi
}

# ? +-----------------------------------------------------------+
# ? | docker.arm                                                |
# ? +-----------------------------------------------------------+
# ? | Force using arm64 architecture in Mac OS                  |
# ? +-----------------------------------------------------------+
docker.arm() {
if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/arm64 "${@:2}"
  else
    /usr/local/bin/docker "$@"
  fi
}

# ? +-----------------------------------------------------------+
# ? | aws.login                                                 |
# ? +-----------------------------------------------------------+
# ? | Login to AWS using SSO.                                   |
# ? +-----------------------------------------------------------+
aws.login() {
  aws.profile $1
  aws sso login --profile $1
}

aws.profile() {
  export AWS_PROFILE=${1:?Please provide a profile name}
  export AWS_REGION=$(aws configure get region --profile $AWS_PROFILE)

  echo "AWS_PROFILE: ${AWS_PROFILE}"
  echo "AWS_REGION: ${AWS_REGION}"
}

#compdef aws.profile aws.login
_aws.profile() {
  local cur=${words[CURRENT]}
  _arguments "1:profile name:($(aws configure list-profiles | grep -- "$cur" | xargs))"
}
compdef _aws.profile aws.profile aws.login

# ? +-----------------------------------------------------------+
# ? | kc                                                        |
# ? +-----------------------------------------------------------+
# ? | Change and display the selected Kubernetes context        |
# ? +-----------------------------------------------------------+
kc() {
  local context=${1:?"Please provide a context name"}
  kubectl config use-context $context
}

#compdef kc
_kc() {
  local cur=${words[CURRENT]}
  _arguments "1:context:($(kubectl config get-contexts | awk 'NR>1 {print $2}' | grep -- "$cur" | xargs))"
}
compdef _kc kc

# ? +-----------------------------------------------------------+
# ? | kn                                                        |
# ? +-----------------------------------------------------------+
# ? | Change and display the selected namespace and context.    |
# ? +-----------------------------------------------------------+
kn() {
  local namespace=$1
  k config set-context --current --namespace=${namespace} > /dev/null
  k config get-contexts | awk '$1=="*" {print $2"/"$5}'
}

#compdef kn
_kn() {
  local cur=${words[CURRENT]}
  _arguments "1:namespace:($(kubectl get namespaces | awk 'NR>1 {print $1}' | grep -- "$cur" | xargs))"
  # compadd $(kubectl get namespaces | awk 'NR>1 {print $1}' | xargs)
}
compdef _kn kn

# ? +-----------------------------------------------------------+
# ? | run_agent                                                 |
# ? +-----------------------------------------------------------+
# ? | Start a docker container.                                 |
# ? +-----------------------------------------------------------+
run_agent() {
  local image=$1
  local shell=${2:-"bash"}

  docker run -it --rm \
  --user root \
  -v $PWD:$PWD -w $PWD \
  -v $HOME/.aws:/root/.aws \
  -v $HOME/.kube:/root/.kube \
  -v $HOME/.m2/settings.xml:/root/.m2/settings.xml \
  -v $HOME/.m2/repository:/root/.m2/repository \
  -v $HOME/.npm/:/root/.npm/ \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --network host \
  --entrypoint /usr/bin/env \
  ${image} \
  ${shell}
}

# ? +-----------------------------------------------------------+
# ? | sonar.master                                              |
# ? +-----------------------------------------------------------+
# ? | Start a docker container.                                 |
# ? +-----------------------------------------------------------+
sonar.master() {
  docker run \
  --rm \
  --memory="1.5G" \
  --memory-swap="1.5G" \
  -v $DEFAULT_SONARQUBE_CACHE:/opt/sonar-scanner/.sonar/cache \
  -v $(pwd):/usr/src \
  -e SONAR_HOST_URL="$DEFAULT_SONARQUBE_URL" \
  -e SONAR_LOGIN="$SONARQUBE_TOKEN" \
  sonarsource/sonar-scanner-cli \
  -Dsonar.qualitygate.wait=true
  # -Dsonar.branch.name=master'
}

# ? +-----------------------------------------------------------+
# ? | sonar.pr                                                  |
# ? +-----------------------------------------------------------+
# ? | Start a docker container.                                 |
# ? +-----------------------------------------------------------+
sonar.pr() {
  docker run \
  --rm \
  --memory="1.5G" \
  --memory-swap="1.5G" \
  -v $DEFAULT_SONARQUBE_CACHE:/opt/sonar-scanner/.sonar/cache \
  -v $(pwd):/usr/src \
  -e SONAR_HOST_URL="$DEFAULT_SONARQUBE_URL" \
  -e SONAR_LOGIN="$SONARQUBE_TOKEN" \
  sonarsource/sonar-scanner-cli \
  -Dsonar.qualitygate.wait=true \
  -Dsonar.pullrequest.key="$PR_NUMBER" \
  -Dsonar.pullrequest.branch="origin/$(git branch --show-current)" \
  -Dsonar.pullrequest.base=master
}

# ? +-----------------------------------------------------------+
# ? | vault.dev                                                 |
# ? +-----------------------------------------------------------+
vault.dev() {
  export VAULT_ADDR="$DEFAULT_VAULT_DEV"
  vault login --method=github -no-print token=$GITHUB_TOKEN
  echo "Connected to DEV vault"
}

# ? +-----------------------------------------------------------+
# ? | vault.prod                                                |
# ? +-----------------------------------------------------------+
vault.prod() {
  export VAULT_ADDR="$DEFAULT_VAULT_PROD"
  vault login --method=github token=$GITHUB_TOKEN
  echo "Connected to PROD vault"
}
