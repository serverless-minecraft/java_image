#!/bin/sh
echo "creating archive"
cd /data
zip -r /tmp/$BACKUP_NAME.zip world
echo "uploading archive to S3"
aws s3 cp /tmp/*.zip $S3_BUCKET_URL
echo "removing local archive"
rm /tmp/*.
echo "Invalidate CloudFront"
DISTRIBUTIONID=`aws cloudfront list-distributions --query 'DistributionList.Items[0].Id' --output text`
aws cloudfront create-invalidation --distribution-id $DISTRIBUTIONID --paths /index.html
echo "done"

echo "Checking for logged in users..."
players=$(rcon-cli list | head -1 | cut -d' ' -f3)
[ $players == '0' ] && rcon-cli stop