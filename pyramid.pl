@array = (‘A’ .. ‘Z’);
$in = <>;
chomp($in);
if($in < 0)
{
print “Can’t proceed”;
}
else{
for($i = 0 ; $i < $in ; $i++)
{
@tmp = (”);
for($k = scalar(@array); $k > $i; $k–)
{
print ” “;
}
for($j = 0 ; $j < $i; $j++)
{
push(@tmp,@array[$j]);
print “@array[$j]”;
}
pop(@tmp);
@revtmp = reverse(@tmp);
foreach(@revtmp)
{ print “$_” ;}
print “\n”;
}
}
exit;