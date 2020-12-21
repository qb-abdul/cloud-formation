# Step 1 Use the CLI to grab your OrgId
aws organizations describe-organization | grep '"Id"'

# Step 2 Run CFT below(provide orag id value from step1
https://github.com/abdulrahimanat/cloud-formation/blob/main/org-taril.bucket.yaml


# Step 3 Gather the S3 bucket name that we created earlier using https://github.com/abdulrahimanat/cloud-formation/blob/main/org-taril.bucket.yaml.

aws cloudformation describe-stack-resources --stack-name CloudTrailS3Bucket <span class="pl-k">|</span> \
  grep Physical | \
  grep s3bucket
  
 # step 4 we have to enable all organizational features
  aws organizations enable-all-features
  
 # step 5 enable service access for cloudtrail.
 aws organizations enable-aws-service-access \
  --service-principal cloudtrail.amazonaws.com
  
  # step 6 we create the actual trai 
  
  aws cloudtrail create-trail \
  --name org-trail \
  --s3-bucket-name cloudtrails3bucket-s3bucket-78is3f3s2eqj \
  --is-organization-trail \
  --is-multi-region-trail
  
  
  
  
