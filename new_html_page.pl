open (B,"C:\\Users\\shiva\\Documents\\Baking\\Copy\\".$cat.".txt") or die "File not found";
open (C,">".$name.".html");
while (chomp($b=<B>))
{
if ($b =~ /^<br><br><br><br><br>&/)
{ last; }
else
{ print C "$b\n"; }
}
print C "<br><br><br><br><br>\n\n";
print C '<h1 style="text-align:center;font-style:normal;font-weight:bold;font:variant:small-caps;"> $name </h1>\n\n';
while (chomp($a=<A>))
{
if ($a =~ /^DATE: (.*)$/)
{ print C '<pre>\n<small>Date of submission: $1</small>\n\n<br><br>\n\n'; }
if ($a =~ /^IMAGE: (.*)$/)
{ print C ''; }
if ($a =~ /INGREDIENTS: $/)
{
while (chomp($a=<A>))
{
if ($a eq '')
{ last; }
else
{
while (chomp($a=<A>))
{
if ($a =~ /AMOUNTS: $/)
{
$x= $a;
print C "($i) $a  =>  $x\n";
}
}
}
}
}
}