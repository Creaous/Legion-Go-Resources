# Ensure ThreadJob module is available
if (-not (Get-Module -ListAvailable -Name ThreadJob)) {
    Install-Module -Name ThreadJob -Scope CurrentUser -Force
}

Import-Module ThreadJob

# Get user input for date format, starting year, and month
$dateFormat = Read-Host "Enter the date format (YY.DD.MM or YY.MM.DD)"
$startYear = Read-Host "Enter the starting year (e.g., 24 for 2024)"
$startMonth = Read-Host "Enter the starting month (01-12)"

$baseUrl = "https://s3.service.lenovo.com/legion/cms/v"
$endDigits = 1..10
$outputFile = "working_urls.txt"

# Clear the output file if it exists
if (Test-Path $outputFile) {
    Clear-Content -Path $outputFile
}

$jobs = @()

for ($month = [int]$startMonth; $month -le 12; $month++) {
    for ($day = 1; $day -le 31; $day++) {
        foreach ($endDigit in $endDigits) {
            $formattedDay = "{0:D2}" -f $day
            $formattedMonth = "{0:D2}" -f $month
            $formattedEndDigit = "{0:D2}" -f $endDigit

            if ($dateFormat -eq "YY.DD.MM") {
                $url1 = "$baseUrl$startYear.$formattedDay.$formattedMonth.$formattedEndDigit/legionspace.exe"
                $url2 = "$baseUrl$startYear.$formattedDay.$formattedMonth.$endDigit/legionspace.exe"
            } elseif ($dateFormat -eq "YY.MM.DD") {
                $url1 = "$baseUrl$startYear.$formattedMonth.$formattedDay.$formattedEndDigit/legionspace.exe"
                $url2 = "$baseUrl$startYear.$formattedMonth.$formattedDay.$endDigit/legionspace.exe"
            } else {
                Write-Output "Invalid date format. Please enter either 'YY.DD.MM' or 'YY.MM.DD'."
                exit
            }

            Write-Output "Starting job for URL: $url1"
            $jobs += Start-ThreadJob -ScriptBlock {
                param ($url, $outputFile)

                function Check-Url {
                    param (
                        [string]$url,
                        [string]$outputFile
                    )
                    Write-Output "Checking URL: $url"
                    try {
                        $request = [System.Net.WebRequest]::Create($url)
                        $request.Method = "HEAD"
                        $request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
                        $response = $request.GetResponse()
                        if ($response.StatusCode -eq 200) {
                            Write-Output "File exists: $url"
                            Add-Content -Path $outputFile -Value $url
                        } else {
                            Write-Output "File does not exist: $url"
                        }
                    } catch [System.Net.WebException] {
                        if ($_.Exception.Response.StatusCode -eq 404) {
                            Write-Output "File does not exist: $url"
                        } else {
                            Write-Output "Error checking file: $url - $($_.Exception.Message)"
                        }
                    }
                }

                Check-Url -url $url -outputFile $outputFile
            } -ArgumentList $url1, $outputFile

            Write-Output "Starting job for URL: $url2"
            $jobs += Start-ThreadJob -ScriptBlock {
                param ($url, $outputFile)

                function Check-Url {
                    param (
                        [string]$url,
                        [string]$outputFile
                    )
                    Write-Output "Checking URL: $url"
                    try {
                        $request = [System.Net.WebRequest]::Create($url)
                        $request.Method = "HEAD"
                        $request.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
                        $response = $request.GetResponse()
                        if ($response.StatusCode -eq 200) {
                            Write-Output "File exists: $url"
                            Add-Content -Path $outputFile -Value $url
                        } else {
                            Write-Output "File does not exist: $url"
                        }
                    } catch [System.Net.WebException] {
                        if ($_.Exception.Response.StatusCode -eq 404) {
                            Write-Output "File does not exist: $url"
                        } else {
                            Write-Output "Error checking file: $url - $($_.Exception.Message)"
                        }
                    }
                }

                Check-Url -url $url -outputFile $outputFile
            } -ArgumentList $url2, $outputFile
        }
    }
}

# Periodically check and display job output
while ($jobs.Count -gt 0) {
    foreach ($job in $jobs) {
        if ($job.State -eq 'Completed') {
            $output = Receive-Job -Job $job
            Write-Output $output
            Remove-Job -Job $job
            $jobs = $jobs | Where-Object { $_.Id -ne $job.Id }
        }
    }
    Start-Sleep -Seconds 1
}