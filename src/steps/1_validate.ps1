$ValidTargets = @("packages","testgallery","gallery")
if ($ValidTargets -notcontains $ENV:INPUT_TARGET) {
    throw "Invalid value provided for 'target' input."
}