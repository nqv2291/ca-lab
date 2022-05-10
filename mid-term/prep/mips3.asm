.text
	# get float input
	li	$v0, 6
	syscall
	mtc1	$zero, $f2
	mfc1	$f2, $f0