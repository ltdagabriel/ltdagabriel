	.data	
pergunta:	.asciiz "Digite o Numero da Sequencia:"	#Pergunta
resposta1:	.asciiz "O "						# \\
resposta2:	.asciiz "° numero da Sequencia Fibonacci é: "		#  Resposta
n: .word 0
i: .word 1
f: .word 0
k: .word 1
	.text
fibonacci:	
		# Printf Pergunta
		li $v0, 4
		la $a0, pergunta
		syscall
		
		# scanf N
		li $v0, 5
		syscall
		sw $v0,n
			
for:	# FOR
		#Load Address
		la $t0,f
		lw $s0, ($t0)
		
		la $t0,k
		lw $s1, ($t0)
		
		la $t0,i
		lw $s2, ($t0)
		
		la $t0,n
		lw $s3, ($t0)
		
		# CONDIÇÂO !(N<K)  	 	N>=K
		slt $t0, $s3, $s1
		bne $t0,$0,end_for
		# FALHA NA CONDIÇÂO 	Jump end_for
		
		add $s0,$s2,$s0
		sub $s2,$s0,$s2
		
		
		addi $s1,$s1,1			#K++
		
		# Save Address
		sw $s0,f
		sw $s1,k
		sw $s2,i
		sw $s3,n
		
		j for
		#END For
end_for:	
		
		# Print resposta
		li $v0, 4
		la $a0, resposta1
		syscall
		
		li $v0, 1
		la $t0, n
		lw $a0, ($t0)
		syscall
		
		li $v0, 4
		la $a0, resposta2
		syscall
		
		li $v0,	1				# carrega o valor da syscall para imprimir um int. 
		la $t0,f
		lw $a0, ($t0)
		syscall	
