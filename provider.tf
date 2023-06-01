provider "google" {
  region      = "europe-west1"
  credentials = file("../sa/sa.json") # gcp service account json key config for terraform
}

provider "google-beta" {
  credentials = file("../sa/sa.json") # gcp service account json key config for terraform
}

