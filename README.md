# dotfiles

> My personal DotFiles

## Installation

To install the DotFiles, first a `GITHUB_TOKEN` is required. Then execute the following commands:

```sh
GITHUB_TOKEN="ghp_token_hash"
/bin/bash -c "$(curl -fsSL https://$GITHUB_TOKEN@raw.githubusercontent.com/cirocfc/.dotfiles/master/mac.install.sh)"
```

## About secrets

Secrets must be kept out of Source Code Registry. So, just use any vault solution.
