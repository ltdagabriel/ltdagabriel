	.data	
pergunta:	.asciiz "Digite o Numero da Sequencia:"	#Pergunta
resposta1:	.asciiz "O "						# \\
resposta2:	.asciiz "° numero da Sequencia Fibonacci é: "		#  Resposta
n: .word 
i: .word 0
f: .word 1
k: .word 0
	.text
fibonacci:	
		# Printf Pergunta
		li $v0, 4
		la $a0, pergunta
		syscall
		
		# scanf N
		li $v0, 5
		syscall
		move $s3,$v0
		
		add $s0,$0,$0 		#F 	Armazena o Resultado
		addi $s1,$0,1		#K
		addi $s2,$0,1		#I
		#addi $s3,$0,6		#N 	Encontra o numero da sequencia de N
			
for:	# FOR
		# CONDIÇÂO !(N<K)  	 	N>=K
		slt $t0, $s3, $s1
		bne $t0,$0,end_for
		# FALHA NA CONDIÇÂO 	Jump end_for
		
		add $s0,$s2,$s0
		sub $s2,$s0,$s2
		
		
		addi $s1,$s1,1			#K++
		j for
		#END For
end_for:	
		# Print resposta
		li $v0, 4
		la $a0, resposta1
		syscall
		
		li $v0, 1
		move $a0,$s3
		syscall
		
		li $v0, 4
		la $a0, resposta2
		syscall
		
		li $v0,	1				# carrega o valor da syscall para imprimir um int. 
		add $a0, $0,$s0			# força impreção do F
		syscall	
