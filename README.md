# packer-aws-nginx

## Description
Create a nginx EBS AMI on AWS with Packer

## Pre-requirements

* [Packer](https://www.packer.io/downloads)


## How to use this repo

- Clone
- Build
- Clean up

---

### Clone the repo

```
git clone https://github.com/viv-garot/packer-aws-nginx
```

### Change directory

```
cd packer-aws-nging
```

### Validate the template

```
packer validate aws-ubuntu.pkr.hcl
```

### AWS login

Either export AWS credentials
```
export AWS_ACCESS_KEY_ID="aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="aws_secret_access_key"
export AWS_SESSION_TOKEN="aws_session_token"
```

or

login to AWS via doormat CLI

```
unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; doormat --smoke-test || doormat -r && doormat aws -m -a support_eng_dev
```

### Build the image

```
packer build aws-ubuntu.pkr.hcl
```

### Clean up

- Go to AWS Console (Okta > Doormat App) in a webbrowser
- Go to EC2 > AMI 
- Select the learn-packer-aws-nginx AMI > Actions > Deregister

![image](https://user-images.githubusercontent.com/85481359/124734909-d8d3d280-df15-11eb-80f3-2cf6278cde01.png)


OR

via awscli

- Describe the image and note the snasphot-id (image-id is provided in 

```
aws ec2 describe-images --image-ids <ami-id> --region=eu-central-1
```

- Then deregister the image and delete the snapshot:

```
aws ec2 deregister-image --image-id <ami-id> --region=eu-central-1
aws ec2 delete-snapshot --snapshot-id <snap-id> --region=eu-central-1
```
