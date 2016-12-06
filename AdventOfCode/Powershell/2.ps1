$inputString = "RRLLRLLRULLRUUUDRDLDDLLLDDDDDUUURRRRUUDLRULURRRDRUDRUUDDRUDLLLRLDDDUDRDDRRLLLLRLRLULUURDRURRUULDRRDUDURRUURURDLURULLDUDRDLUUUUDDURRLLLUDLDLRDRRRDULLDLDULLDRLDLDURDLRRULLDDLDRLLLUDDLLRDURULLDDDDDUURURLRLRRDUURUULRLLLULLRLULLUUDRRLLDURLDDDDULUUDLUDDDULRLDURDDRUUDRRUUURLLLULURUDRULDRDUDUDRRDDULRURLLRRLRRLLDLULURDRDRULDRDRURUDLLRRDUUULDDDUURDLULDLRLLURRURLLUDURDDRUDRDLLLLDLRLDLDDRDRRDUUULLUULRRDLURLDULLDLDUUUULLLDRURLRULLULRLULUURLLRDDRULDULRLDRRURLURUDLRRRLUDLDUULULLURLDDUDDLLUDRUDRLDUDURRRRLRUUURLUDDUDURDUDDDLLRLRDDURDRUUDUDRULURLRLDRULDRRLRLDDDRDDDRLDUDRLULDLUDLRLRRRLRDULDDLRRDDLDDULDLLDU,RULLUDDUDLULRRDLLDRUDLLLDURLLLURDURLRDRRDLRDRDLLURRULUULUDUDDLLRRULLURDRLDURDLDDUURLUURLDLDLRLDRLRUULDRLRLDRLRLUDULURDULLLDRUDULDURURRRUDURDUDLRDRRURULRRLRLRRRRRRDRUDLDRULDRUDLRDLRRUDULDLRLURRRLLDRULULRUDULRLULLRLULDRUDUULLRUULDULDUDDUUULLLDRDDRRDLURUUDRRLRRRDLRRLULLLLDLRUULDLLULURUURURDRURLLDUDRRURRURRUUDDRRDDRRRRUDULULRLUULRRDDRDDLLUDLDLULLRLDRLLUULDURLDRULDDUDRUUUURRLDDUDRUURUDLLDLDLURDLULDRLLLULLLUDLLDLD,RDLDULURDLULRRDLRLLLULRUULURULLLDLLDDRLLURUUUURDRLURLLRLRLLLULRDLURDURULULDDUDDUDRLRLDLULLURRRUULUDRDURRRUDDDLUDLDLRLRRLLLRUULLLLURRDDDRRRUURULRLDRRRLRLUDDRRULDDDRUUDDRLLDULRLUDUDLDLDDDUDDLLDDRDRDUDULDRRUDRDRRDRLUURDLRDDDULLDRRRRRUDRLURDUURRDDRLUDLURRRLRDDDLRRLUULRLURDUUURRDLDDULLLRURRRUDRLUDLLDDDDDUDDRDULLUUDDURRLULLUDULUUDRLDRRRLLURLRRLLDLLLLUDRUUUDDULLRDLLDUDUDUURRUUUDRUURDRDLLDLDDULLDDRRULDLDDUUURLDLULLLRRLLRDDULLDLDLDDLDLDULURRDURURDRDRRDLR,RDRLRRUUDRLDUDLLDLUDLUUDUDLRRUUDRDDDLDDLLLRRRUDULLRRRRRURRRLUDDDLRRRRUUULDURDRULLDLRURRUULUDRURRRRLRURLRDUUDUDUDRDDURRURUDLLLLLRURUULRUURLLURDRUURLUDDDRLDDURDLDUDRURDRLRRRRUURDDRRRRURDLUUDRLDRDUULURUDDULLURRDUDLUULLDURRURLUDUUDRDDDUUDDUUUULDLDUDDLUDUUDRURLLULRUUULLRRDDUDDLULDDUUUDLUDDLDDLLRUUDRULLRRDRLLDLLRRLULLRRDDRLRDUULLLUULLDLLUDUDDLRDULUDLDLUDDRRRRDUDLUULLULDLRRDLULRLRRRULRURRDRLULDDUDLDLDULLURLLRDLURRULURDLURLUDRDRRUUDRLLUDDRLRDDUURLRRDUDLDRURDUUUDRRLLRDLDLLDRRURLUDURUULDUDLDDDDRUULLDDRLRURRDURLURRLDDRRRRLRLRDRURUDDRDLDRURLULDDL,RULRDLDDLRURDDDDDDRURLLLDDDUUULLRRDLDLURUURLUDLURRLUDUURDULDRUULDDURULDUULDDULLLUDLRULDRLDLRDDRRDLDDLLDRRUDDUDRDUULUDLLLDDLUUULDDUUULRRDULLURLULDLRLLLRLURLLRLRLDRDURRDUUDDURRULDDURRULRDRDUDLRRDRLDULULDRDURDURLLLDRDRLULRDUURRUUDURRDRLUDDRRLDLDLULRLLRRUUUDDULURRDRLLDLRRLDRLLLLRRDRRDDLDUULRLRRULURLDRLRDULUDRDLRUUDDDURUDLRLDRRUDURDDLLLUDLRLURDUDUDULRURRDLLURLLRRRUDLRRRLUDURDDDDRRDLDDLLDLRDRDDRLLLURDDRDRLRULDDRRLUURDURDLLDRRRDDURUDLDRRDRUUDDDLUDULRUUUUDRLDDD"
#$inputString = "ULL,RRDDD,LURDL,UUUUD"
$startPoint = 5
foreach($firstLine in $inputString.Split(",").Trim()){
    foreach($str in $firstLine.ToCharArray()){
        if($startPoint -eq 1){
            if($str -eq "D"){
                $startPoint = 3;
                continue;
            }
        }
        if($startPoint -eq 2){
            if($str -eq "R"){
                $startPoint = 3;
                continue;
            }
            if($str -eq "D"){
                $startPoint = 6;
                continue;
            }
        }
        if($startPoint -eq 3){
            if($str -eq "R"){
                $startPoint = 4;
                continue;
            }
            if($str -eq "L"){
                $startPoint = 2;
                continue;
            }
            if($str -eq "D"){
                $startPoint = 7;
                continue;
            }
            if($str -eq "U"){
                $startPoint = 1;
                continue;
            }
        }
        if($startPoint -eq 4){
            if($str -eq "L"){
                $startPoint = 3;
                continue;
            }
            if($str -eq "D"){
                $startPoint = 8;
                continue;
            }
        }
        if($startPoint -eq 5){
            if($str -eq "R"){
                $startPoint = 6;
                continue;
            }
        }
        if($startPoint -eq 6){
            if($str -eq "L"){
                $startPoint = 5;
            }
            if($str -eq "R"){
                $startPoint = 7;
                continue;
            }
            if($str -eq "D"){
                $startPoint = "A";
                continue;
            }
            if($str -eq "U"){
                $startPoint = 2;
                continue;
            }
        }
        if($startPoint -eq 7){
            if($str -eq "R"){
                $startPoint = 8;
                continue;
            }
            if($str -eq "U"){
                $startPoint = 3;
                continue;
            }
            if($str -eq "D"){
                $startPoint = "B";
                continue;
            }
            if($str -eq "L"){
                $startPoint = 6;
                continue;
            }
        }
        if($startPoint -eq 8){
            if($str -eq "R"){
                $startPoint = 9;
                continue;
            }
            if($str -eq "U"){
                $startPoint = 4;
                continue;
            }
            if($str -eq "L"){
                $startPoint = 6;
                continue;
            }
            if($str -eq "D"){
                $startPoint = "C";
                continue;
            }
        }
        if($startPoint -eq 9){
            if($str -eq "L"){
                $startPoint = 8;
                continue;
            }
        }
        if($startPoint -eq "A"){
            if($str -eq "R"){
                $startPoint = "B";
                continue;
            }
            if($str -eq "U"){
                $startPoint = 6;
                continue;
            }
        }
        if($startPoint -eq "B"){
            if($str -eq "L"){
                $startPoint = "A";
                continue;
            }
            if($str -eq "U"){
                $startPoint = 7;
                continue;
            }
            if($str -eq "R"){
                $startPoint = "C";
                continue;
            }
            if($str -eq "D"){
                $startPoint = "D";
                continue;
            }
        }
        if($startPoint -eq "C"){
            if($str -eq "L"){
                $startPoint = "B";
                continue;
            }
            if($str -eq "U"){
                $startPoint = 8;
                continue;
            }
        }
        if($startPoint -eq "D"){
            if($str -eq "U"){
                $startPoint = "B";
                continue;
            }
        }
    }
    write-host $startPoint
}