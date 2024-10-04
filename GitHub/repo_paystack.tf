resource "github_repository" "paystack" {
    name        = "paystack"
    description = "Pastèque mais dit a l'envers"
    visibility  = "private"

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

resource "github_issue_labels" "paystack_labels" {
    repository = github_repository.paystack.id

    label {
        name        = "documentation"
        description = "Improvements or additions to documentation"
        color       = "0075ca"
    }

    label {
        name        = "help wanted"
        description = "Extra attention is needed"
        color       = "008672"
    }

    label {
        name        = "good first issue"
        description = "Good for newcomers"
        color       = "7057ff"
    }

    label {
        name        = "enhancement"
        description = "New feature or request"
        color       = "a2eeef"
    }

    label {
        name        = "duplicate"
        description = "This issue or pull request already exists"
        color       = "cfd3d7"
    }

    label {
        name        = "bug"
        description = "Something isn't working"
        color       = "d73a4a"
    }

    label {
        name        = "question"
        description = "Further information is requested"
        color       = "d876e3"
    }

    label {
        name        = "invalid"
        description = "This doesn't seem right"
        color       = "e4e669"
    }

    label {
        name        = "wontfix"
        description = "This will not be worked on"
        color       = "ffffff"
    }

    label {
        name        = "hacktoberfest-accepted"
        description = "Hacktoberfest acceptance label"
        color       = "029F92"
    }
}

resource "github_team_repository" "paystack_developers" {
    team_id    = github_team.developers.id
    repository = github_repository.paystack.name
    permission = "push"
}

resource "github_team_repository" "paystack_devops" {
    team_id    = github_team.devops.id
    repository = github_repository.paystack.name
    permission = "maintain"
}

resource "github_team_repository" "paystack_security" {
    team_id    = github_team.security.id
    repository = github_repository.paystack.name
    permission = "push"
}

resource "github_team_repository" "paystack_management" {
    team_id    = github_team.management.id
    repository = github_repository.paystack.name
    permission = "admin"
}
