#!/bin/bash

set -e

CURRENT_DIR=$(realpath $(dirname $0))
TERRAFORM_DIR="${CURRENT_DIR}/../terraform"


# Authentication
echo "export TF_VAR_AWS_SECRET_KEY=BPbl/VFAWRTKfM7YV2B5p0uwDyAFnVXhU09ZcfNj"
echo "export TF_VAR_AWS_ACCESS_KEY=AKIARBUWI3SOK3CO5VIJ"


# Resource Location
echo "export TF_VAR_AWS_REGION=us-east-2"

# CodeCommit
echo "export TF_VAR_AWS_REPOSITORY_NAME=tf-test"
echo "export TF_VAR_BUILDSPEC_PATH=buildspec.yml"
echo "export TF_VAR_AWS_REPOSITORY_Branch_NAME=main"
echo "export TF_VAR_AWS_REPOSITORY_ApproverARN=arn:aws:iam::072255855772:user/approver"
echo "export TF_VAR_AWS_REPOSITORY_Numberofapprovals=1"

