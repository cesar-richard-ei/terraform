resource "github_repository" "terraform" {
    name        = "terraform"
    description = "IaC Cesar Richard EI"
    visibility  = "public"

    has_issues    = true
    has_wiki      = false
    has_downloads = false
    has_projects  = true

    delete_branch_on_merge = true

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

resource "github_team_repository" "terraform_developers" {
    team_id    = github_team.developers.id
    repository = github_repository.terraform.name
    permission = "push"
}

resource "github_team_repository" "terraform_devops" {
    team_id    = github_team.devops.id
    repository = github_repository.terraform.name
    permission = "maintain"
}

resource "github_team_repository" "terraform_security" {
    team_id    = github_team.security.id
    repository = github_repository.terraform.name
    permission = "push"
}

resource "github_team_repository" "terraform_management" {
    team_id    = github_team.management.id
    repository = github_repository.terraform.name
    permission = "admin"
}

resource "github_repository_ruleset" "terraform_ruleset" {
    repository = github_repository.terraform.id
    name        = "Main Branch Protection"
    target      = "branch"
    enforcement = "active"

    bypass_actors {
        actor_id    = 1
        actor_type  = "OrganizationAdmin"
        bypass_mode = "always"
    }

    conditions {
        ref_name {
            exclude = []
            include = [
                "~DEFAULT_BRANCH",
            ]
        }
    }

    rules {
        non_fast_forward = true
        creation         = true
        update           = true
        deletion         = true

        pull_request {
            dismiss_stale_reviews_on_push     = true
            require_code_owner_review         = false
            require_last_push_approval        = true
            required_approving_review_count   = 1
            required_review_thread_resolution = true
        }
    }
}