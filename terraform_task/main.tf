module "mumbai" {
  source = "./modules/ec2_web"
  region = "ap-south-1"
}

module "virginia" {
  source = "./modules/ec2_web"
  region = "us-east-1"
}

output "public_ips" {
  value = {
    mumbai   = module.mumbai.public_ip
    virginia = module.virginia.public_ip
  }
}

output "website_urls" {
  value = {
    mumbai   = module.mumbai.website_url
    virginia = module.virginia.website_url
  }
}