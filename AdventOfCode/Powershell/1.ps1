$inputString = "R1, R3, L2, L5, L2, L1, R3, L4, R2, L2, L4, R2, L1, R1, L2, R3, L1, L4, R2, L5, R3, R4, L1, R2, L1, R3, L4, R5, L4, L5, R5, L3, R2, L3, L3, R1, R3, L4, R2, R5, L4, R1, L1, L1, R5, L2, R1, L2, R188, L5, L3, R5, R1, L2, L4, R3, R5, L3, R3, R45, L4, R4, R72, R2, R3, L1, R1, L1, L1, R192, L1, L1, L1, L4, R1, L2, L5, L3, R5, L3, R3, L4, L3, R1, R4, L2, R2, R3, L5, R3, L1, R1, R4, L2, L3, R1, R3, L4, L3, L4, L2, L2, R1, R3, L5, L1, R4, R2, L4, L1, R3, R3, R1, L5, L2, R4, R4, R2, R1, R5, R5, L4, L1, R5, R3, R4, R5, R3, L1, L2, L4, R1, R4, R5, L2, L3, R4, L4, R2, L2, L4, L2, R5, R1, R4, R3, R5, L4, L4, L5, L5, R3, R4, L1, L3, R2, L2, R1, L3, L5, R5, R5, R3, L4, L2, R4, R5, R1, R4, L3"
#$inputString = "R8, R4, R4, R8"

$N = 0
$S = 0
$E = 0
$W = 0

$direction = "N"

$haj = @{"N" = 0; "S" = 0; "E" = 0; "W" = 0;}
$visited = @{"X" = 0; "Y" = 0;}
$myArray = New-Object System.Collections.ArrayList

foreach($str in $inputString.Split(",").Trim()){

    $goingRight = $str.Contains("R")
    $goingLeft = $str.Contains("L")
    $value = [convert]::ToInt32($str.Substring(1, $str.Length -1))

    if($direction -eq "N" -and $goingRight){
        $E = $E + $value
        $direction = "E"
    }
    elseif($direction -eq "N" -and $goingLeft){
        $W = $W + $value
        $direction = "W"
    }
    elseif($direction -eq "S" -and $goingRight){
        $W = $W + $value
        $direction = "W"
    }
    elseif($direction -eq "S" -and $goingLeft){
        $E = $E + $value
        $direction = "E"
    }
    elseif($direction -eq "W" -and $goingRight){
        $N = $N + $value
        $direction = "N"
    }
    elseif($direction -eq "W" -and $goingLeft){
        $S = $S + $value
        $direction = "S"
    }
    elseif($direction -eq "E" -and $goingRight){
        $S = $S + $value
        $direction = "S"
    }
    elseif($direction -eq "E" -and $goingLeft){
        $N = $N + $value
        $direction = "N"
    }
    
    $currentValue = [convert]::ToInt32($haj.Get_Item($direction))

    for($i = 1;$i -lt $value+1;$i++){
        $indValue = ($currentValue + $i)
        $haj.Set_Item($direction, $indValue)
        $X = [convert]::ToInt32($haj.Get_Item("N")) - [convert]::ToInt32($haj.Get_Item("S"))
        $Y = [convert]::ToInt32($haj.Get_Item("E")) - [convert]::ToInt32($haj.Get_Item("W"))
        $xy = "$X | $Y"
        if($myArray.Contains($xy)){
            $answer = ($X-$Y)
            write-host "answer = $answer"
            read-host
        }
        $myArray.Add($xy)
    }
    
}

$answer = ($N - $S) + ($E - $W)
write-host "answer = $answer"