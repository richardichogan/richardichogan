Clear-Host

#Check to see if connection has already been established.
$Context = Get-AzContext
if(-Not $Context)
{
    #If no context currently exists log on to the tenant.
    try 
    {
        #Connect to Tenant
        Connect-AzAccount
        Write-Host "Succesfully Logged In" -ForegroundColor Green
    }
    catch {
        Write-Host "Something went wrong." -ForegroundColor Red
    }
}

try {
    #Deploy Resources
    Write-Host "Deploying Resources." -ForegroundColor Green
    #This assumes that there is a resource group already created, if this is not the case you will need to create a resoruce group first.
    New-AzResourceGroupDeployment -ResourceGroupName '<ResourceGroupName>' -TemplateFile ./DeployVMs.bicep -VMName 'NewVM01' 
    Write-Host "Resources Successfully Deployed." -ForegroundColor Green
}
catch {
    Write-Host "Something went wrong." -ForegroundColor Red
}




