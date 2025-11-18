variable "external_port" {
  description = "The external port to expose the Nginx container on."
  type        = number
  default     = 8080 # Set a standard default
}
