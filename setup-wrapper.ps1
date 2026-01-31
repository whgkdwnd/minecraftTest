# Gradle Wrapper "가상 설치" 스크립트
# Gradle을 전역 설치하지 않고, 이 프로젝트에서만 사용할 수 있도록
# gradle-wrapper.jar 만 다운로드합니다.
# 한 번만 실행하면 됩니다.

$ErrorActionPreference = 'Stop'
$gradleVersion = "8.5"
$zipUrl = "https://services.gradle.org/distributions/gradle-$gradleVersion-bin.zip"
$zipPath = "$PSScriptRoot\gradle-$gradleVersion-bin.zip"
$wrapperDir = "$PSScriptRoot\gradle\wrapper"
$jarPath = "$wrapperDir\gradle-wrapper.jar"

if (Test-Path $jarPath) {
    Write-Host "gradle-wrapper.jar 가 이미 있습니다. 건너뜁니다." -ForegroundColor Green
    exit 0
}

Write-Host "Gradle Wrapper JAR 다운로드 중... (Gradle 전역 설치 불필요)" -ForegroundColor Cyan
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing

Write-Host "압축에서 wrapper JAR 추출 중..." -ForegroundColor Cyan
# Zip에서 gradle/wrapper/gradle-wrapper.jar 만 추출
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
$entry = $zip.Entries | Where-Object { $_.FullName -eq "gradle/wrapper/gradle-wrapper.jar" }
if ($entry) {
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $jarPath, $true)
}
$zip.Dispose()
Remove-Item $zipPath -Force

Write-Host "완료. 이제 'gradlew.bat build' 로 빌드할 수 있습니다." -ForegroundColor Green
