#PS1
# Impoter module AD
Import-Module ActiveDirectory

# Emplacement utilisateurs
$Ou = "OU=LabUtilisateurs,DC=ekoloclast,DC=fr"

# groupe sécurité mdp
$GroupSec = "GrpSecuriteMdp"

# Recupérer les utilisateurs
$Users = Get-ADUser -Filter * -SearchBase $Ou

# Ajouterles utilisateurs au groupe
foreach ($User in $Users) {
    Add-ADGroupMember -Identity $GroupSec -Members $User
}

Write-Host "Tous les utilisateurs de l'OU Labutilisateurs ont été ajoutés au groupe $Groupsec"