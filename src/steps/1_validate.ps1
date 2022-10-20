$ValidTargets = @("packages","nuget","gallery")
if ($ValidTargets -notcontains $ENV:INPUT_TARGET) {
    throw "Invalid value provided for 'target' input."
}

if ((($ENV:INPUT_TARGET -eq "packages") -or ($ENV:INPUT_TARGET -eq "gallery")) -and $ENV:INPUT_NUGETURL) {
    throw "'nugetUrl' can only be used with target 'nuget'."
}

if (($ENV:INPUT_TARGET -eq "nuget") -and !$ENV:INPUT_NUGETURL) {
    throw "Target 'nuget' requires 'nugetUrl'."
}