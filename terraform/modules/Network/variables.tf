variable "APP_NAME" {
  type = string

}

variable "REGION" {
  type = string

}
variable "VPC_CIRD_BLOCK" {
  type = string
}

variable "SUBNET_CONFIG" {
  default = {
    public_1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "a"
      public            = "yes"
    }
    public_2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "b"
      public            = "YeS"
    }
    private_1 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "a"
      public            = "No"

    }
    private_2 = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "b"
      public            = "NO"

    }
  }
}