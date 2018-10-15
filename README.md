# java_image
Docker image for the java server

This repository is very heavily based on the itzg minecraft server - I've added
a few very small tweaks to support self-registration of Route53 and some
CloudWatch metrics.

This repository does one simple thing: build and upload to ECR the docker
image for the rest of the project to use.

Environment Variables
=====================

The docker image expects a few environment variables.

* BACKUP_NAME - name of the backup
* S3_BUCKET_URL - S3 bucket to upload backups to
* CRON_SCHEDULE - the period at which to do backups
* baseTaskName - name of the server
* domainName - domain name this is operating under

In addition, there are the environment variables required by the itzg
image:

* EULA - needs to be set to "TRUE"
