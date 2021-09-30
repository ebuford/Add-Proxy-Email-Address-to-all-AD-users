<#
This script will Add a Proxy address to all the users in the domain. 
You can limit this by setting a scope using the -searchbase to only find users in a certain OU Using something like this on the set-aduser line
-SearchBase 'OU=HumanResources,OU=UserAccounts,DC=FABRIKAM,DC=COM' 
Change the proxy address to reflect the Domain Name you want to add

Written by Ed Buford ~  ed@methodcomputing.com
#>


Import-module ActiveDirectory

$users = Get-Aduser -Filter * -ResultSetSize $null

foreach ($user in $users) 
{
    $ProxyAddress = "smtp:" + $user.'SamAccountName' + 'Corp.ExchangeNerd.com'
    Set-ADUser -identity $User.'sAMAccountName' -Add @{ProxyAddresses = $ProxyAddress}

}

