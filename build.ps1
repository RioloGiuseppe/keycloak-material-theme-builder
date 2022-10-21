$folder = 'out'

Remove-Item "dist" -Recurse -ErrorAction Ignore
Remove-Item "tmp" -Recurse -ErrorAction Ignore

npm run build-material

mkdir "tmp\$($folder)"
Copy-Item -Path ".\src\keycloak-template\login" -Destination "tmp\$($folder)\login" -Recurse
Copy-Item -Path ".\dist\favicon\" -Destination "tmp\$($folder)\login\resources\img" -Recurse
Copy-Item -Path ".\src\icons\logo.svg" -Destination "tmp\$($folder)\login\resources\img\logo.svg"
mkdir "tmp\$($folder)\login\resources\css"
Copy-Item -Path ".\dist\material-components-web.min.css" -Destination "tmp\$($folder)\login\resources\css"

mkdir "build"
Compress-Archive -Path "tmp\$($folder)" -DestinationPath "build\$($folder).zip"

Remove-Item "tmp" -Recurse -ErrorAction Ignore
Remove-Item "dist" -Recurse -ErrorAction Ignore