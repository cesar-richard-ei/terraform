terraform { 
    cloud { 
        organization = "CesarRichardEI" 
        workspaces { 
            name = "github" 
        }
    }
}
