@bases=('A','T','G','C');
$base1 = pop@bases;
unshift(@bases , $base1);
print " Unshifted array =@bases\n";
exit;