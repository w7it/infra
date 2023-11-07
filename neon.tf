resource "neon_project" "main" {
  name      = "w7it"
  region_id = "aws-us-east-2"

  lifecycle {
    ignore_changes = [ pg_version, branch ]
  }
}

resource "neon_role" "root" {
  name       = "root"
  branch_id  = neon_project.main.branch.id
  project_id = neon_project.main.id
}
