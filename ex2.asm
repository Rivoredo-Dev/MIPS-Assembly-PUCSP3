# Integrantes: João Lucas de Lima Souza (RA:00360044) / Pedro Chagas (RA:00359511) / Guilherme Rivoredo (RA:00359303)

.data                                   # Inicia a area de dados do programa
msgEntrada: .asciiz "Digite um numero inteiro maior que 1: " # Mensagem pedindo o numero ao usuario
msgPrimo: .asciiz "Primo\n"             # Mensagem que sera exibida se o numero for primo
msgNaoPrimo: .asciiz "Nao e Primo\n"    # Mensagem que sera exibida se o numero nao for primo

.text                                   # Inicia a area de codigo do programa
.globl main                             # Define o rotulo main como global

main:                                   # Inicio do programa principal
li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgEntrada                      # Carrega em a0 o endereco da mensagem de entrada
syscall                                 # Executa a syscall para mostrar a mensagem ao usuario

li $v0, 5                               # Carrega em v0 o codigo da syscall de ler inteiro
syscall                                 # Executa a leitura do numero digitado
move $t0, $v0                           # Copia o numero digitado para o registrador t0

addi $t1, $zero, 2                      # Inicializa em t1 o primeiro divisor que sera testado

loopTeste:                              # Inicio do laco de verificacao dos divisores
mul $t2, $t1, $t1                       # Calcula divisor vezes divisor e guarda o resultado em t2
bgt $t2, $t0, ehPrimo                   # Se divisor ao quadrado for maior que o numero, o numero e primo

rem $t3, $t0, $t1                       # Calcula o resto da divisao entre o numero e o divisor testado
beq $t3, $zero, naoEhPrimo              # Se o resto for zero, o numero nao e primo

addi $t1, $t1, 1                        # Incrementa o divisor em 1 para testar o proximo valor
j loopTeste                             # Volta para o inicio do laco de verificacao

ehPrimo:                                # Rotulo do caso em que o numero e primo
li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgPrimo                        # Carrega em a0 o endereco da mensagem "Primo"
syscall                                 # Executa a syscall para exibir "Primo"
j fim                                   # Desvia para o final do programa

naoEhPrimo:                             # Rotulo do caso em que o numero nao e primo
li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgNaoPrimo                     # Carrega em a0 o endereco da mensagem "Nao e Primo"
syscall                                 # Executa a syscall para exibir "Nao e Primo"
j fim                                   # Desvia para o final do programa

fim:                                    # Rotulo do encerramento do programa
li $v0, 10                              # Carrega em v0 o codigo da syscall de encerrar o programa
syscall                                 # Executa a syscall para finalizar a execucao
