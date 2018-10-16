# java_image
Docker image for the java server

[![CodeBuild](https://codebuild.ap-southeast-2.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiMlhmRFBFd2drSTl0bFBjV2ZqdGxxTm1RRDhMY05uV0hkdlpJMm9ucVVxTzBHckp6WjJQazcrKytEVG05NXNDRXJhMk1sVGRhS0xTTlZja3ZaVEJ0M1VJPSIsIml2UGFyYW1ldGVyU3BlYyI6IkFKcEIrSHJYZDRZSnNqOWIiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)](https://github.com/serverless-minecraft/java_image)

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
