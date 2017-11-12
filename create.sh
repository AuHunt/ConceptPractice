#!/bin/sh

makeTree()
{
    local depth=$1
    local breadth=$2
    local directory=$3
    open=()
    temp=($directory)
    for ((d=0;d<$depth;d++)); do
	open=("${temp[@]}")
	temp=()
	for x in ${open[@]}; do
	    for ((b=0;b<$breadth;b++)); do
		y=`expr $b + 1`
                meow=$x/$y
                #echo $meow
		`mkdir -p $meow` 
		temp+=($x/$y)
	    done
	done
    done
}

main()
{
    makeTree $1 $2 $3
}

main $1 $2 $3
