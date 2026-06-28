/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando um metodo pra destruir o objeto powerup
powerup_destroi = function()
{
    //Criando um sistema de colisao para destruir o power up
    if(instance_place(x, y, oPlayer))
    {
        //Se meu power up colidir com o player
        instance_destroy()
        //então ele será destruido
        //Ao colidir tambem irei fazer meu player ganhar um powerup pro escudo
        oPlayer.ganha_escudo()
        //Toda vez que eu colidir ele vai criar a particula do powerup
        //ou seja será criado um efeito 
        instance_create_layer(x, y, "Powerups", oParticula)
    }
    
}

//definindo a velv do powerup escudo
velv = 3

//movendo o powerup escudo
move_powerup = function()
{
    //ele vai pegar o Y da room e mover para baixo com base na velv 
    y += velv
    if(y > room_height)
    {
        //destruindo ele se sair da room
        instance_destroy()
        //show_debug_message("vida destruida")
    }
}