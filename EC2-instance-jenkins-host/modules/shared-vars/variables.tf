locals {
  env = terraform.workspace
  env_suffix_env = {
    default       = "default"
    "development" = "dev" # TODO: check if quotes are needed
    staging       = "stag"
    production    = "prod"
  }

  # uses the lookup function to get the current working environment.
  env_suffix = lookup(local.env_suffix_env, local.env)
}
