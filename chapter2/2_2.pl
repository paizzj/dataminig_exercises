use v6;

my @age = 13, 15, 16, 16, 19 , 20, 20, 21, 22, 22, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70;

my $count =  @age.elems;
my $sum   = [+] @age;

say "age 's count is "　~ $count;
say "mean is :" ~ $sum / $count;

my $median;
if  $count.lsb {
    # even number of elements
    $median = (@age[$count/2] + @age[$count/2 + 1]) / 2;
} else  {
    # odd number of elements
    $median = @age[($count +1) / 2];
}
say "median is: " ~ $median;

# 
# todo 
# just for unimodal data sets
# need deal with bimodal & trimodal data sets
#
my $mode;
my $f = 0;
for @age.unique -> $i {
    my $t = (@age .grep: $i).elems;
    if ($t > $f) { 
	$f = $t;
	$mode  = $i;
    }
}
say  "mode is: " ~ $mode;


my $midrange = (@age[0] + @age[$count-1]) / 2;
say "midrange is: " ~ $midrange;


