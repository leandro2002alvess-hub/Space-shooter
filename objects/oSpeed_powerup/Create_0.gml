/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//Criando um metodo pra destruir o objeto powerup
powerup_destroi = function()
{
    //Criando um sistema de colisao para destruir o power up
    if(instance_place(x, y, oPlayer))
    {
        //Se meu power up colidir com o player
        instance_destroy()
        //então ele será destruido
        //Ao colidir tambem irei fazer meu player ganhar um powerup pra velocidade
        oPlayer.ganha_speed()
        //Toda vez que eu colidir ele vai criar a particula do powerup
        //ou seja será criado um efeito 
        instance_create_layer(x, y, "Powerups", oParticula)
    }
    
}

velh = 5

//movendo o powerup vida
move_powerup = function()
{
    x += velh
    if(x > room_width)
    {
        //destruindo ele se sair da room
        instance_destroy()
        //show_debug_message("vida destruida")
    }
}