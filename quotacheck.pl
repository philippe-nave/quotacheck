#!/usr/bin/perl -w
# 
# half-assed script to look at disk quota
# warn if usage is at or over 90%

$quota_string = `quota`; # works for me - lazy? yes.

@quota_array = split("\n",$quota_string); # split on newline
$numbers = $quota_array[2]; # only interested in the numbers 

@numbers_array = split(" ",$numbers);

$blocks = $numbers_array[1];
$quota = $numbers_array[2];
# $limit = $numbers_array[3];

$percentage = int(($blocks/$quota) * 100);

# print "blocks: $blocks quota: $quota limit: $limit percentage: $percentage\n";

if ($percentage >= 90) {
   print "WARNING: Disk space used is at $percentage% of quota ($blocks blocks of $quota)\n";
}
