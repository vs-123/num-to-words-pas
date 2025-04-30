program NumToWords;

function convert(n: Longint): String; forward;

function convertWithPlaceValue(n: Longint; placeValue: Longint; placeValueName: String): String;
begin
     if (n mod placeValue = 0) then
         convertWithPlaceValue := convert(n div placeValue) + ' ' + placeValueName
     else
         convertWithPlaceValue := convert(n - (n mod placeValue)) + ' ' + convert(n mod placeValue);
end;

function convert(n: Longint): String;
begin
     //writeln(n); // <-- Debugging
     if (n < 0) then
        convert := 'negative ' + convert(-n)
     else
     begin
         case (n) of
              // Digits
              0 : convert := 'zero';
              1 : convert := 'one';
              2 : convert := 'two';
              3 : convert := 'three';
              4 : convert := 'four';
              5 : convert := 'five';
              6 : convert := 'six';
              7 : convert := 'seven';
              8 : convert := 'eight';
              9 : convert := 'nine';

              // Tens
              10 : convert := 'ten';
              20 : convert := 'twenty';
              30 : convert := 'thirty';
              40 : convert := 'forty';
              50 : convert := 'fifty';
              80 : convert := 'eighty';

              // 11 to 19
              11 : convert := 'eleven';
              12 : convert := 'twelve';
              13 : convert := 'thirteen';
              15 : convert := 'fifteen';
              18 : convert := 'eighteen';
         else
             // -ty numbers
             if (((n mod 10) = 10) and (n >= 60) and (n <= 90)) then
                convert := convert(n div 10) + 'ty'
            else if ((n >= 13) and (n <= 19)) then
                convert := convert(n mod 10) + 'teen'
            // Between 21 to 99
            else if ((n >= 21) and (n <= 99)) then
                convert := convert(n - (n mod 10)) + ' ' + convert(n mod 10)
            // Between 100 to 999
            else if ((n >= 100) and (n <= 999)) then
                convert := convertWithPlaceValue(n, 100, 'hundred')
            // Between 1000 to 999_999
            else if ((n >= 1000) and (n <= 999999)) then
                convert := convertWithPlaceValue(n, 1000, 'thousand')
            else
                convert := 'invalid number';
        end;
     end;
end;

begin
     writeln(convert(15));
     writeln(convert(25));
     writeln(convert(251));
     writeln(convert(-251));
     readln();
end.

