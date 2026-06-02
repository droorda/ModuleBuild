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
    # pspostman: removed. It was abandoned (last release 2017) and the build only ever used its
    # vendored nuget.exe 4.1.0, which predates the `sign` command (added in nuget 4.6.0).
    # PublishPSGallery now signs/pushes via `dotnet nuget` from the .NET SDK instead.
}