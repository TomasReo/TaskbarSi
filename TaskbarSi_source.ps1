Add-Type -AssemblyName System.Windows.Forms


$Form = New-Object Windows.Forms.Form
$Form.Text = "Nástroj pro změnu velikosti ikon hlavního panelu"
$Form.Width = 500
$Form.Height = 200

$Vert = 80
$bWidth = 100
$bHeight = 50

function Set-TaskbarSize {
    param (
    [string]$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
    [string]$registryName = "TaskbarSi",
    [int]$registryValue
)

Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue

Stop-Process -Name explorer -Force

}


$Nadpis = New-Object Windows.Forms.Label
$Nadpis.Text = "Vyberte požadovanou velikost ikon hlavního panelu:"
$Nadpis.Location = New-Object Drawing.Point(50, 20)
$Nadpis.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$Nadpis.AutoSize = $true


$SetSi0 = New-Object Windows.Forms.Button
$SetSi0.Text = "Malá"
$SetSi0.Location = New-Object Drawing.Point(50, $Vert)
$SetSi0.Width = $bWidth
$SetSi0.Height = $bHeight
$SetSi0.Add_Click({
    Set-TaskbarSize -registryValue 0
})

$SetSi1 = New-Object Windows.Forms.Button
$SetSi1.Text = "Výchozí"
$SetSi1.Location = New-Object Drawing.Point(200, $Vert)
$SetSi1.Width = $bWidth
$SetSi1.Height = $bHeight
$SetSi1.Add_Click({
    Set-TaskbarSize -registryValue 1
})

$SetSi2 = New-Object Windows.Forms.Button
$SetSi2.Text = "Velká"
$SetSi2.Location = New-Object Drawing.Point(350, $Vert)
$SetSi2.Width = $bWidth
$SetSi2.Height = $bHeight
$SetSi2.Add_Click({
    Set-TaskbarSize -registryValue 2
})

$Form.Controls.Add($Nadpis)
$Form.Controls.Add($SetSi0)
$Form.Controls.Add($SetSi1)
$Form.Controls.Add($SetSi2)

$Form.ShowDialog() | Out-Null