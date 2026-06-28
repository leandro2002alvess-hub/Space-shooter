/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando variaveis de tempo para fazer o tiro do drone
drone_tiro_tempo = 0
drone_tiro_tempo_limite = 90

//Criando o sistema de vida do drone 
drone_vida = 3

//Verificandoa  quantidade de instancia drone que tenho
meu_numero = instance_number(oDrone);

segue_player = function()
{
    //Se eu for o primeiro drone a nascer, eu vou para CIMA
    if (meu_numero == 1)
    {
        x = oPlayer.x;
        y = oPlayer.y - 40;
    }
    
    //Se eu for o segundo drone, eu vou para BAIXO (o outro lado!)
    if (meu_numero == 2)
    {
        x = oPlayer.x;
        y = oPlayer.y + 40;
    }
    
    //Se eu for o terceiro drone, eu fico na ESQUERDA
    if (meu_numero == 3)
    {
        x = oPlayer.x - 40;
        y = oPlayer.y;
    }
    
    //Se eu for o quarto drone, eu fico na DIREITA
    if (meu_numero == 4)
    {
        x = oPlayer.x + 40;
        y = oPlayer.y;
    }
}

//Criando o metodo do tiro do drone
drone_tiro = function()
{
    //ele vai ganhar tempo do tiro
    drone_tiro_tempo++
    if(drone_tiro_tempo >= drone_tiro_tempo_limite)
    {
        //se for maior ou igual ao limite
        //então o tiro será criado 
        instance_create_layer(x, y, "Tiro", oTiro)
        drone_tiro_tempo = 0
        //resetando a variavel
    }
}

//Criando um metodo de morte do drone
morte_drone = function()
{
    //meu drone perde vida
    drone_vida--
    if(drone_vida <= 0)
    {
        //se ele chegar a zero ou menos que isso
        //então ele será destruido e gera um efeito de explosão
        instance_create_layer(x, y, "Detalhes", oParticula)
        instance_destroy()
    }
}