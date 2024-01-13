print"DNA sequnce:\n";
open(MYFILE,'Seq.txt');
while(<MYFILE>)
{

chomp;
print"$_\n";
}
close(MYFILE);
exit;