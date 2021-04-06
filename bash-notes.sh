az login
az account set \
    --subscription e742f0ac-a073-4dbb-8f74-238ce10a9d1e

qs_rg=chrkin210401
az group create \
    --name $qs_rg \
    --location "Central US"

qs_templateFile=./arm-template.json
az deployment group create \
    --name deploy3 \
    --resource-group $qs_rg \
    --template-file $qs_templateFile \
    --parameters \
        storageSKU=Standard_GRS \
        storageName=storechrkin3210401

az deployment group create \
    --name addoutput \
    --resource-group $qs_rg \
    --template-file $qs_templateFile \
    --parameters \
        storageSKU=Standard_GRS \
        storagePrefix="chrkin56"