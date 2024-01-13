@bases=('A','T','G','C');
$base1 = shift@bases;
push(@bases , $base1);
print "@bases\n";
exit;