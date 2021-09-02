variable "pa-ami" {
  description = "Palo Alto AMI:"
  type        = string
  default     = "ami-0b01723d8cde04e4a"
}
variable "web-server-ami" {
  description = "Web Server AMI:"
  type        = string
  default     = "ami-0742b4e673072066f"
}

variable "AWS_KEY" {
  description = "AWS Key"
  type        = string
}
variable "AWS_SECRET" {
  description = "AWS Secret"
  type        = string
}