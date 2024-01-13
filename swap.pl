print(a b: in out Integer)
    temp : Integer;
begin
    temp := a;
    a := b;
    b := temp;
end swap;