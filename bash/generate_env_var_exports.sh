#!/bin/bash

set -e

CURRENT_DIR=$(realpath $(dirname $0))
TERRAFORM_DIR="${CURRENT_DIR}/../terraform"


# Authentication
echo "export TF_VAR_AWS_SECRET_KEY=pMglRC4geRnNNZpC9SYqlLvse4BHKKzh7Vi0+H3x"
echo "export TF_VAR_AWS_ACCESS_KEY=AKIARBUWI3SOP4KEKN4Q"

# Resource Location
echo "export TF_VAR_AWS_REGION=us-east-2"

# CodeCommit
echo "export TF_VAR_AWS_REPOSITORY_NAME=tf-test"
echo "export TF_VAR_BUILDSPEC_PATH=buildspec.yml"


