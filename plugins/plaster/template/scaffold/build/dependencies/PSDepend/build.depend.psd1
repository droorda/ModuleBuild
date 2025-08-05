@{
    PSDependOptions = @{
        Target = '$DependencyFolder'
        AddToPath = $True
    }
    PSScriptAnalyzer = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    PlatyPS = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    'Powershell-YAML' = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    PSCodeHealth = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    ModuleBuildTools = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    Pester = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
    # BuildHelpers = @{
    #     version = 'latest'
    #     source = 'PSGalleryModule'
    # }
    pspostman = @{
        version = 'latest'
        source = 'PSGalleryModule'
    }
}