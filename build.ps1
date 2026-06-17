$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$LocalTectonic = Resolve-Path -LiteralPath (Join-Path $ProjectRoot '..\tools\tectonic\tectonic.exe') -ErrorAction SilentlyContinue

if ($LocalTectonic) {
  $Tectonic = $LocalTectonic.Path
} else {
  $Tectonic = 'tectonic'
}

Push-Location $ProjectRoot
try {
  & $Tectonic --keep-logs --keep-intermediates main.tex
  if ($LASTEXITCODE -ne 0) {
    throw "Tectonic failed with exit code $LASTEXITCODE"
  }
} finally {
  Pop-Location
}
