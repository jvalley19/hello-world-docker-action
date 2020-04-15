$null = Find-Module -Name Az | Install-Module -Force

$secpasswd = ConvertTo-SecureString $env:SERVICE_PASS -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($env:SERVICE_PRINCIPAL, $secpasswd)

Add-AzAccount -ServicePrincipal -Credential $Credential -Tenant $env:TENANT_ID
