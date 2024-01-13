$DNA="CTAGTGACTGAGCTACGAT";
$RNA=$DNA;
$RNA=~ s/T/U/g;
print "$RNA";
exit;