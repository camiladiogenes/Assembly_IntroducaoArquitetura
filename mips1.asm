.data

	vet1: .space 40 #declara o primeiro vetor

	vet2: .space 40 #declara o segundo vetor

	vet3: .space 40 #declara o vetor que recebera a soma dos dois anteriores



	print1: .asciiz "Informe o vetor 1: "

	print2: .asciiz "Informe o vetor 2: "

	print3: .asciiz "Soma: "



	quebra: .asciiz "\n" 
	
	divide: .asciiz "  "



.text

	la $t1, vet1 # O registrador t1 recebe o vetor 1

	la $t2, vet2 # O registrador t2 recebe o vetor 2
	
	la $t4, vet3 # carrega o endereço do vetsoma para t4


	li $t3, 10 # Auxiliar, funcionará como contador



while1:

	li $v0,4 # Imprimir

	la $a0, print1 # Imprime a mensagem desejada

	syscall  # Chamada do sistema

	li $v0,5 # Recebe o valor do usuário

	syscall

	sw $v0, 0($t1) # Zero pega o primeiro endereço da memeoria #adiciona os valores ao array



	addi $t1, $t1,4 # Adiciona (valores imediatos)
 
	addiu $t3, $t3,-1 # Decrementa



	bne $t3, 0, while1 # Funciona como do while enquanto for diferente de 0



	li $t3, 10 # Atribui 10 ao auxiliar



while2:

	li $v0,4 # Imprimir

	la $a0, print2 # Imprime a mensagem

	syscall  # Chamada do sistema

	li $v0,5 # Receber
	
	syscall

	sw $v0, 0($t2) # Zero pega o primeiro endereço da memoria #Adiciona os valores ao array



	addi $t2, $t2,4 # Adiciona (valores imediatos)

	addiu $t3, $t3,-1 # Decrementa



	bne $t3, 0, while2 # Funciona como do while enquanto for diferente de 0



	la $t4,vet3 # Carrega o endereço do vetsoma para t4


	li $v0,4 # Imprimir

	la $a0, print3 # Imprime a mensagem

	syscall



	la $a0, quebra

	li $v0,4 # Imprimir

	syscall



	li $t3, 10 # Atribui 10 ao auxiliar
	
	
while3:
	lw $t5, 0($t1) 

	lw $t6, 0($t2)

	add $t0,$t5,$t6 # Soma t5 e t6 em t0

	sw $t0,0($t4) # Direciona o conteudo de t0 para o espaço de memoria de t4
	
	addi $t1,$t1,-4 # Decrementa o espaço de memoria de t1
	
	addi $t2,$t2,-4 # Decrementa o espaço de memoria de t2
	
	addi $t4,$t4,4 # Incrementa o espaço de memoria de t4

	addiu $t3,$t3,-1 # Decrementa o espaço de memoria de t4
	
	bne $t3, -1, while3 # Funciona como dowhile

	li $t3, 10 # Atribui 10 ao auxiliar

while4:

	lw $a0, -4($t4) # Carrega o primeiro elemento do vetor pra syscall

	li $v0, 1

	syscall
	

	la $a0, divide # Coloca os espaços entre os numeros
	
	li $v0, 4
	
	syscall
	

	addi $t4,$t4,-4 # Decrementa o valos de memoria de t4
	
	addiu $t3,$t3,-1 # Decrementa o valor de t3

	bne $t3, 0, while4
