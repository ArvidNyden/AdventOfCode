#528
$file = get-content "input-4.txt"

$yes = 0
$sum = 0

foreach($first in $file){

    #$first = "aczupnetwp-dnlgpyrpc-sfye-dstaatyr-561[patyc]"

    $index = $first.IndexOf("[")
    $hash = $first.Substring($index,$first.Length - $index).Replace("[", "").Replace("]", "")
    $str = $first.Substring(0, $first.Length - ($hash.Length+5)).Replace("-", "").Trim()
    $sectorId = $first.Substring($first.Length - ($hash.Length+5), 3)

    $myHash = $str -split "" | sort | group | sort @{e={$_.count}; Ascending=$false }, Name | ?{-not ($_.Name -eq "" )} | select Name -first 5

    $mystrHash = ""

    foreach($h in $myHash){
       $mystrHash += $h.Name
    }

    if($mystrHash -eq $hash) {
        $yes++
        $sum += $sectorId
    }
}

write-host $yes
write-host $sum