#PS1
# Impoter module AD
Import-Module ActiveDirectory

# Emplacement utilisateurs
$Ou = "OU=LabUtilisateurs,DC=ekoloclast,DC=fr"

# groupe s�curit� mdp
$GroupSec = "GrpSecuriteMdp"

# Recup�rer les utilisateurs
$Users = Get-ADUser -Filter * -SearchBase $Ou

# Ajouterles utilisateurs au groupe
foreach ($User in $Users) {
    Add-ADGroupMember -Identity $GroupSec -Members $User
}

Write-Host "Tous les utilisateurs de l'OU Labutilisateurs ont �t� ajout�s au groupe $Groupsec"