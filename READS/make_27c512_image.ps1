$sourcePath = Join-Path $PSScriptRoot 'ROMs\spangbl2\sp2-19.ic2'
$outputPath = Join-Path $PSScriptRoot 'ROMs\spangbl2\sp2-19_27c512_doubled.bin'

$sourceBytes = [System.IO.File]::ReadAllBytes($sourcePath)
if ($sourceBytes.Length -ne 32768) {
    throw "Expected a 32768-byte source image, got $($sourceBytes.Length) bytes."
}

$outputBytes = [byte[]]::new(65536)
[System.Array]::Copy($sourceBytes, 0, $outputBytes, 0, 32768)
[System.Array]::Copy($sourceBytes, 0, $outputBytes, 32768, 32768)
[System.IO.File]::WriteAllBytes($outputPath, $outputBytes)

Write-Output $outputPath
