# save as fun_1.awk
BEGIN{
 a="alpha";  b="beta"
 print "a:", a; print "b:", b
 fun("new")
 print "a:", a; print "b:", b
}
function fun(a,b) {
 print "fun a:", a; print "fun b:", b
 b="BETA"
}