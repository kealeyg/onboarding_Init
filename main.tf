variable "globals" {}

output "output" {
    value = {
        globals = var.globals
    }
}