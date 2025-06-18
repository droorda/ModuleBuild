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
}