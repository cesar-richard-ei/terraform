resource "github_team" "developers" {
    name        = "Developers"
    description = "Developers team"
}

resource "github_team_members" "developers" {
    team_id  = github_team.developers.id

    members {
        username = "cesar-richard"
        role     = "maintainer"
    }

}

resource "github_team" "devops" {
    name        = "DevOps"
    description = "DevOps team"
}

resource "github_team_members" "devops" {
    team_id  = github_team.devops.id
    members {
        username = "cesar-richard"
        role     = "maintainer"
    }
}

resource "github_team" "security" {
    name        = "Security"
    description = "Security team"
}

resource "github_team_members" "security" {
    team_id  = github_team.security.id
    members {
        username = "cesar-richard"
        role     = "maintainer"
    }
}

resource "github_team" "management" {
    name        = "Management"
    description = "Management team"
}

resource "github_team_members" "management" {
    team_id  = github_team.management.id
    members {
        username = "cesar-richard"
        role     = "maintainer"
    }
}
