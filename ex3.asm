# Integrantes: João Lucas de Lima Souza (RA:00360044) / Pedro Chagas (RA:00359511) / Guilherme Rivoredo (RA:00359303)

.data                                   # Inicia a area de dados do programa
msgA: .asciiz "Digite o valor de A: "   # Mensagem pedindo o primeiro numero ao usuario
msgB: .asciiz "Digite o valor de B: "   # Mensagem pedindo o segundo numero ao usuario

.text                                   # Inicia a area de codigo do programa
.globl main                             # Define o rotulo main como global

main:                                   # Inicio do programa principal
li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgA                            # Carrega em a0 o endereco da mensagem de A
syscall                                 # Executa a syscall para mostrar a mensagem de A

li $v0, 5                               # Carrega em v0 o codigo da syscall de ler inteiro
syscall                                 # Executa a leitura do valor de A
move $t0, $v0                           # Copia o valor de A para o registrador t0

li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgB                            # Carrega em a0 o endereco da mensagem de B
syscall                                 # Executa a syscall para mostrar a mensagem de B

li $v0, 5                               # Carrega em v0 o codigo da syscall de ler inteiro
syscall                                 # Executa a leitura do valor de B
move $t1, $v0                           # Copia o valor de B para o registrador t1

loopMDC:                                # Inicio do laco do algoritmo de Euclides
beq $t1, $zero, fimMDC                  # Se B for igual a zero, o MDC ja foi encontrado

rem $t2, $t0, $t1                       # Calcula o resto da divisao entre A e B e guarda em t2
move $t0, $t1                           # Atualiza A com o valor atual de B
move $t1, $t2                           # Atualiza B com o resto calculado
j loopMDC                               # Volta para repetir o processo do algoritmo

fimMDC:                                 # Rotulo do fim do calculo do MDC
move $t5, $t0                           # Copia o MDC encontrado para o registrador t5

li $v0, 10                              # Carrega em v0 o codigo da syscall de encerrar o programa
syscall                                 # Executa a syscall para finalizar a execucao
