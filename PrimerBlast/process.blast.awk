{
if($1~/f_/){
    fprimer[NR]=$1; fstart[NR]=$3; fend[NR]=$4; fstrand[NR]=$5; facc[NR]=$2
    }
else{
    rprimer[NR]=$1; rstart[NR]=$3; rend[NR]=$4; rstrand[NR]=$5; racc[NR]=$2
    }
}
END{
for(x in fstart){
    for(y in rstart){
        z=fstart[x]-rstart[y]
        if(z<0){z=z*-1}
        if(z<400 && facc[x]==racc[y]){
            bp[1]=fstart[x];bp[2]=fend[x];bp[3]=rstart[y];bp[4]=rend[y]
            asort(bp)
            print substr(fprimer[x],3),facc[x],bp[1],bp[4],fstrand[x]
            }
        }
    }
}