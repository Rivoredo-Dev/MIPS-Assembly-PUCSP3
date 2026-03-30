# Integrantes: João Lucas de Lima Souza (RA:00360044) / Pedro Chagas (RA:00359511) / Guilherme Rivoredo (RA:00359303)

.data                                   # Inicia a area de dados do programa
msgEntrada: .asciiz "Digite o valor da radiacao: " # Mensagem que sera exibida ao usuario

.text                                   # Inicia a area de codigo do programa
.globl main                             # Define o rotulo main como global

main:                                   # Inicio do programa principal
li $v0, 4                               # Carrega em v0 o codigo da syscall de imprimir string
la $a0, msgEntrada                      # Carrega em a0 o endereco da mensagem de entrada
syscall                                 # Executa a syscall para mostrar a mensagem na tela

li $v0, 5                               # Carrega em v0 o codigo da syscall de ler inteiro
syscall                                 # Executa a syscall para ler o valor digitado pelo usuario
move $t0, $v0                           # Copia o valor digitado para o registrador t0

addi $t1, $zero, 30                     # Armazena o valor 30 em t1 para comparar com o limite do Tipo 1
ble $t0, $t1, tipo1                     # Se o valor digitado for menor ou igual a 30, desvia para tipo1

addi $t1, $zero, 79                     # Armazena o valor 79 em t1 para comparar com o limite do Tipo 2
ble $t0, $t1, tipo2                     # Se o valor digitado for menor ou igual a 79, desvia para tipo2

j tipo3                                 # Se nao entrou nos casos anteriores, desvia para tipo3

tipo1:                                  # Rotulo do caso em que a radiacao e do Tipo 1
addi $t5, $zero, 1                      # Armazena o numero 1 em t5 para indicar classificacao Tipo 1
j fim                                   # Desvia para o final do programa

tipo2:                                  # Rotulo do caso em que a radiacao e do Tipo 2
addi $t5, $zero, 2                      # Armazena o numero 2 em t5 para indicar classificacao Tipo 2
j fim                                   # Desvia para o final do programa

tipo3:                                  # Rotulo do caso em que a radiacao e do Tipo 3
addi $t5, $zero, 3                      # Armazena o numero 3 em t5 para indicar classificacao Tipo 3
j fim                                   # Desvia para o final do programa

fim:                                    # Rotulo do encerramento do programa
li $v0, 10                              # Carrega em v0 o codigo da syscall de encerrar o programa
syscall                                 # Executa a syscall para finalizar a execucao
