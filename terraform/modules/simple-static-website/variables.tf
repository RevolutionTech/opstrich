variable "github_org" {
  type    = string
  default = "RevolutionTech"
}
variable "github_repo" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "error_page" {
  type    = string
  default = "index.html"
}

variable "tags" {
  type    = map(string)
  default = {}
}
