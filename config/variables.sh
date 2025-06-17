#!/bin/bash

# ? +===========================================================+
# ? | VARIABLES                                                 |
# ? +===========================================================+


# ? +-----------------------------------------------------------+
# ? | ZSH                                                       |
# ? +-----------------------------------------------------------+
# ? | Less configuration                                        |
# ? +-----------------------------------------------------------+
# ? | -F: Exit immediately if the entire file can be displayed  |
# ? |     on one screen without scrolling. It is useful when    |
# ? |     viewing short files.                                  |
# ? | -R: Display raw control characters instead of interpreting|
# ? |     them. It is commonly used when viewing files that     |
# ? |     contain special formatting or color codes, such as log|
# ? |     files.                                                |
# ? | -X: Do not clear the screen when exiting.  It is useful   |
# ? |     when you want to keep the output visible after        |
# ? |     quitting less.                                        |
# ? +-----------------------------------------------------------+
export LESS='-FRX --mouse'

# ? +-----------------------------------------------------------+
# ? | Docker                                                    |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in docker commands.      |
# ? +-----------------------------------------------------------+
export DOCKER_USERNAME="${COMPANY_DOCKER_USERNAME:-PERSONAL_DOCKER_USERNAME}"
export DOCKER_TOKEN="${COMPANY_DOCKER_TOKEN:-PERSONAL_DOCKER_TOKEN}"

# ? +-----------------------------------------------------------+
# ? | ECR Stack                                                 |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in docker commands.      |
# ? +-----------------------------------------------------------+
export DEFAULT_AWS_ECR_PROFILE="${COMPANY_AWS_ECR_PROFILE}"
export DEFAULT_AWS_ECR_URL="${COMPANY_AWS_ECR_URL}"

# ? +-----------------------------------------------------------+
# ? | GitHub                                                    |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in GitHub commands.      |
# ? +-----------------------------------------------------------+
export GITHUB_TOKEN="${COMPANY_GITHUB_TOKEN:-PERSONAL_GITHUB_TOKEN}"

# ? +-----------------------------------------------------------+
# ? | npmjs                                                     |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in npm commands.         |
# ? +-----------------------------------------------------------+
export NPM_TOKEN="${COMPANY_NPM_TOKEN:-PERSONAL_NPM_TOKEN}"

# ? +-----------------------------------------------------------+
# ? | Sonar Scanner                                             |
# ? +-----------------------------------------------------------+
# ? | Used to run SonarQube analysis with the custom            |
# ? | `sonar.master` or `sonar.pr` function.                    |
# ? +-----------------------------------------------------------+
export DEFAULT_SONARQUBE_URL="${COMPANY_SONARQUBE_URL}"
export DEFAULT_SONARQUBE_CACHE="$HOME/.config/sonar/cache"

# ? +-----------------------------------------------------------+
# ? | Vault                                                     |
# ? +-----------------------------------------------------------+
# ? | Used to log into Vault with the custom `vault.dev` or     |
# ? | `vault.hml` or `vault.prod` function.                     |
# ? +-----------------------------------------------------------+
export DEFAULT_VAULT_DEV="${COMPANY_VAULT_DEV}"
export DEFAULT_VAULT_HML="${COMPANY_VAULT_HML}"
export DEFAULT_VAULT_PROD="${COMPANY_VAULT_PROD}"
