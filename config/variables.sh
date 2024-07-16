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
export LESS=-FRX

# ? +-----------------------------------------------------------+
# ? | ECR Stack                                                 |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in docker commands.      |
# ? +-----------------------------------------------------------+
export DEFAULT_AWS_ECR_PROFILE="ip-cicd-prod-cicd"
export DEFAULT_AWS_ECR_URL="439291037095.dkr.ecr.us-east-2.amazonaws.com"

# ? +-----------------------------------------------------------+
# ? | Sonar Scanner                                             |
# ? +-----------------------------------------------------------+
# ? | Used to run SonarQube analysis with the custom            |
# ? | `sonar.master` or `sonar.pr` function.                    |
# ? +-----------------------------------------------------------+
export DEFAULT_SONARQUBE_URL="https://sonarqube.contaazul.com/"
export DEFAULT_SONARQUBE_CACHE="$HOME/.config/sonar/cache"

# ? +-----------------------------------------------------------+
# ? | Vault                                                     |
# ? +-----------------------------------------------------------+
# ? | Used to log into Vault with the custom `vault.dev` or     |
# ? | `vault.prod` function.                                    |
# ? +-----------------------------------------------------------+
export DEFAULT_VAULT_DEV="https://vault.dev.contaazul.com"
export DEFAULT_VAULT_PROD="https://vault.prod.contaazul.com"
