# packer-aws-nginx

## Description
Create a nginx EBS AMI on AWS with Packer

## Pre-requirements

* [Packer](https://www.packer.io/downloads)


## How to use this repo

- Clone
- Build

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

### Build the image

```
packer build aws-ubuntu.pkr.hcl
```
