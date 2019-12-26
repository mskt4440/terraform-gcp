# terraform-gcp
This repoitory contains Terraform scripts which build k8s cluster on GCP.

## Summary
- Create VPC
- Create Firewall
- Create a private k8s cluster on GKE

## Usage
- Create a bucket to store a tfstate file
```bash
gsutil mb -p <PROJECT-ID> -c regional -l <REGION> gs://<BUCKET-NAME>
gsutil versioning set on gs://<BUCKET-NAME>
```
- (Otional) Create a service account for a CI tool
```bash
gcloud iam service-accounts create <SERVICE-ACCOUNT> --display-name "[SERVICE-ACCOUNT-DESCRIPTION]"
gcloud iam service-accounts keys create key.json \
  --iam-account <SERVICE-ACCOUNT>@<PROJECT-ID>.iam.gserviceaccount.com
gcloud projects add-iam-policy-binding <PROJECT-ID> \
  --member serviceAccount:<SERVICE-ACCOUNT>@<PROJECT-ID>.iam.gserviceaccount.com \
  --role roles/editor
echo "export GOOGLE_CREDENTIALS=serviceaccount.json" >> .envrc && direnv allow
```
- init Terraform
```bash
terraform init 
```
- exex Terrafrom
```bash
terraform [plan|apply|destroy] -var-file=<VARFILE>
```