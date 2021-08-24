
#***********************************************************************
# Script           : DeploySingleVM.ps1
# Author           : Richard Hogan
# Created          : 06-08-2021
# ***********************************************************************
# <copyright file="DeploySingleVM.ps1" company="N/A">
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
# KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE.
# </copyright>
# <summary></summary>
# <auto-generated/>
# ***********************************************************************

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
    New-AzResourceGroupDeployment -ResourceGroupName '<ResourceGroupName>' -TemplateFile ./VirtualMachine-Deployment.bicep -VMName '<VM Name>' 
    Write-Host "Resources Successfully Deployed." -ForegroundColor Green
}
catch {
    Write-Host "Something went wrong." -ForegroundColor Red
}