#!/usr/bin/env perl6
use v6;


my @age_fat;
for "data/age_fat.txt".IO.lines -> $line {
    #say $line;
    @age_fat.append: split(',', $line, :skip_empty);
}
#say @age_fat;


my @age;
my $age_count;
my $age_sum;
my @fat;
my $fat_count;
my $fat_sum;
for @age_fat -> $item {
    #say split(':', $item);
    @age.push(split(':', $item)[0]);
    @fat.push(split(':', $item)[1]);
}

$age_count = @age.elems;
$age_sum = [+] @age;

$fat_count = @fat.elems;
$fat_sum   = [+] @fat;


my $age_mean =  $age_sum / $age_count;
my $age_median;
my $fat_mean = $fat_sum / $fat_count;
my $fat_median;

if ($age_count.lsb) {
    # even number
    $age_median = (@age[$age_count/2] + @age[$age_count/2 + 1]) / 2;
    $fat_median = (@fat[$fat_count/2] + @fat[$fat_count/2 + 1]) / 2;
} else {
    # odd number
    $age_median  = @age[($age_count+1)/2];
    $fat_median  = @fat[(($fat_count+1)/2)];
}



# compute σ(standard deviation)
my $age_sd;
my @age_square;
for @age -> $a {
    @age_square.push(($a - $age_mean) * ($a - $age_mean));
}
$age_sd = sqrt(([+] @age_square) / $age_count);

my $fat_sd;
my @fat_square;
for @fat -> $f {
    @fat_square.push(($f/100 - $fat_mean/100) * ($f/100 - $fat_mean/100));
}
$fat_sd = sqrt(([+] @fat_square) / $fat_count);



say "a) age's mean " ~ $age_mean ~ "\t median: " ~ $age_median ~ "\t standard deviation: " ~ $age_sd;
say "a) fat's mean " ~ $fat_mean/100 ~ "\t median: " ~ $fat_median/100 ~ "\t standard deviation: " ~ $fat_sd;;
