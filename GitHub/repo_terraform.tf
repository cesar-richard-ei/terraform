resource "github_repository" "terraform" {
    name        = "terraform"
    description = "IaC Cesar Richard EI"
    visibility  = "public"

    has_issues    = true
    has_wiki      = false
    has_downloads = false
    has_projects  = true

    allow_merge_commit = false
    allow_squash_merge = false
    allow_rebase_merge = true

    auto_init = false
    vulnerability_alerts = true

    topics = ["terraform", "iac", "hacktoberfest"]
}

resource "github_issue_label" "hacktoberfest-accepted" {
    repository  = github_repository.terraform.id
    name        = "hacktoberfest-accepted"
    description = "Hacktoberfest acceptance label"
    color       = "029F92"
}
