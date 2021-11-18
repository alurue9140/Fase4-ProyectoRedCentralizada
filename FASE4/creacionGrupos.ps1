 $gruposCsv=Read-Host "Introduce el fichero csv de Grupos"
                $fichero = import-csv -Path $gruposCsv -delimiter :
                foreach($linea in $fichero)
{
   New-ADGroup -Name:$linea.Name -Path:$linea.Path -Description:$linea.Description -GroupCategory:$linea.Category -GroupScope:$linea.Scope 
}

$gruposCsv=Read-Host "Introduce el fichero csv de Gruposa"
                $fichero = import-csv -Path $gruposCsv -delimiter :
                foreach($linea in $fichero)

{
Add-ADGroupMember -Identity $linea.miembro -Members $linea.lider
}