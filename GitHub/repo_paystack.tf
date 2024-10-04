resource "github_repository" "paystack" {
    name        = "paystack"
    description = "Pastèque mais dit a l'envers"
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

    topics = ["app", "django", "python", "react", "hacktoberfest"]
}

resource "github_issue_labels" "hacktoberfest-accepted" {
    repository  = github_repository.paystack.id

    label {
        name        = "hacktoberfest-accepted"
        description = "Hacktoberfest acceptance label"
        color       = "029F92"
    }
}
