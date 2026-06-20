/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando o sistema de movimentos do player 
var left = keyboard_check(ord("A")) || keyboard_check(vk_left)
var right = keyboard_check(ord("D")) || keyboard_check(vk_right)
var up = keyboard_check(ord("W"))  || keyboard_check(vk_up)
var down = keyboard_check(ord("S")) || keyboard_check(vk_down)

//Criando a tecla que iremos usar para atirar
var space  = keyboard_check_pressed(vk_space)


//Criando a movimentação do nosso jogador 
if(up || down)
{
    //O que está sendo feito? 
    //se eu pressionar o botão de cima ou baixo
    //ele rodará o seguinte calculo
    //(down - up) define a DIREÇÃO: Baixo dá 1, Cima dá -1, parados dá 0.
    //Multiplica pela VELOCIDADE (velv) para saber quantos pixels andar
    //O "+=" aplica o resultado final direto na posição Y atual da nave
    //Se apertar CIMA, a conta dá negativo (-1). 
    //No GameMaker, Y += (-velocidade) vira SUBTRAÇÃO (Mais com Menos dá Menos), fazendo a nave subir!
    //Se apertar BAIXO, a conta dá positivo (1), somando no Y e fazendo a nave descer.
    y += (down - up) * velv
}

//Criando o if para eixo X
if(right || left)
{
    
    x += (right - left) * velh
}

//Criando um if para mudar meus tipos de tiro
//Se eu apertar uma vez a letra Q
//if(keyboard_check_pressed(ord("Q")))
//{
    ////Então ele vai informar que level tiro e igual a 1 ou seja estamos no nivel do tiro
    //level_tiro = 1
    //
//} 
////senao se, eu apertar a letra E 
//else if(keyboard_check_pressed(ord("E")))
//{
    //
    ////Ele vai entender que meu level tiro e = 2
    //level_tiro = 2
    ////Então ele mudará para o segundo nivel do level
   //
//}
////senao se, eu apertar a letra E 
//else if(keyboard_check_pressed(ord("R")))
//{
    //
    ////Ele vai entender que meu level tiro e = 2
    //level_tiro = 3
    ////Então ele mudará para o segundo nivel do level
   //
//}
//Se meu level_tiro for igual a 1
if(level_tiro == 1)
{
    //Então ele rodara o primeiro tiro 
    tiro_1(space)
}
//senao se, level tiro for igual a 2
else if(level_tiro == 2)
{
    cooldown_tiro_maximo = 15
    //então ele rodará meu segundo tipo de tiro
    tiro_2(space)
}
else if(level_tiro == 3)
{
    cooldown_tiro_maximo = 5
    //então ele rodará meu segundo tipo de tiro
    tiro_3(space)
}

//Criando um sistema para o player ir de um lado para o outro na room
if(x > room_width + 32)
{
    //Se meu X da room for maior que minha largura da room
    x = 0
    //então irei passar e ir pro outro lado da room que corresponde ao valor zero
    //Ou seja irei aparecer na esquerda
}
//senao se 
else if(x < -32)
{
    //se meu X da room for menor que -32 pixels da room
    x = room_width
    //Então meu X será igual ao meu largura da room que equivale ao lado direito dela
}

//Criando um sistema de colisão para nave não sair por cima ou baixo
y = clamp(y, 20, 500)


if (player_invencivel == true)
{
    invencivel++ // Sobe o cronômetro frame por frame
    
    // Se o cronômetro estourar o tempo máximo de proteção...
    if(invencivel >= invencivel_max)
    {
        invencivel = 0;             // Zera o relógio para o próximo hit
        player_invencivel = false;  // DESLIGA a proteção! O player volta a ser mortal.
    }
}

//if(keyboard_check_pressed(vk_enter))
//{
    //// SÓ entra se o player estiver vulnerável (invencibilidade desligada)
    //if(player_invencivel == false)
    //{
        //perde_vida();              // Tira 1 ponto de vida
        //player_invencivel = true;  // LIGA a proteção imediatamente após o hit!
        //invencivel = 0;            // Garante que o relógio comece do zero absoluto
    //}
//}  
//


//Criando um pequeno sistema para debugar
if(keyboard_check_pressed(vk_tab))
{
    global.debug = !global.debug
}

////Criando um if para verificar se apertei alt
//if(keyboard_check_pressed(vk_alt))
//{
    ////se eu apertei alt então ele vai verificar se meu escudo e maior que 0
    //if(escudo > 0)
    //{ 
      ////ele vai ver se o escudo ja existe na tela 
      //if(instance_exists(oEscudo))
      //{
          ////se existir então ele será destruido para criar um novo escudo
          //instance_destroy(oEscudo);
      //}
      ////criando um novo escudo para nosso player  
      //instance_create_layer(x, y, "Player", oEscudo)
      //perde_escudo()
      ////chamando a função para perder os escudos
      ////tudo isso usando como base a variavel escudo e seu if escudo > 0  
    //}
//}


