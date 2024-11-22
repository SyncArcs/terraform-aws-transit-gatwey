provider "aws" {
  region = "us-east-1"

}

module "transit_gatwey" {
  source          = ".././."
  managedby       = "SyncArcs"
  environment     = "test"
  name            = "dev"
  label_order     = ["name", "environment"]
  vpc-1           = "vpc-00fa9b18ea8a1aa4d"
  vpc1_subnet_ids = ["subnet-0a2ee2526a6799d57"]
  vpc-2           = "vpc-07e6faf30b2a9774f"
  vpc2_subnet_ids = ["subnet-0207e702164947473"]
  vpc-3           = "vpc-0481a13d5a63f6c11"
  vpc3_subnet_ids = ["subnet-02b61a3e93cdf9dde"]

}