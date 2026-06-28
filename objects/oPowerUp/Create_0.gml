/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando um sistema de movimentos para o powerup
vel = 5
//por padrão ele receberá a velocidade 5
direcao = irandom(359)
//criando uma direção para nosso objeto ir 
tempo_vida = 0
//Criando um sistema de tempo de vida do nosso objeto 
tempo_vida_max = 1000
//Criando um tempo limite para ele 

//Criando um metodo pra destruir o objeto powerup
powerup_destroi = function()
{
    //Criando um sistema de colisao para destruir o power up
    if(instance_place(x, y, oPlayer))
    {
        //Se meu power up colidir com o player
        instance_destroy()
        //então ele será destruido
        //Ao colidir tambem irei fazer meu player ganhar um powerup pro tiro
        oPlayer.ganha_level_tiro()
        //Toda vez que eu colidir ele vai criar a particula do powerup
        //ou seja será criado um efeito 
        instance_create_layer(x, y, "Powerups", oParticula)
    }
    tempo_vida++
    //ganhando tempo de vida
    if(tempo_vida >= tempo_vida_max)
    {
        //se meu tempo de vida for maior que meu tempo de vida max
        instance_destroy()
        //então meu objeto e destruido
        tempo_vida = 0
        //a variavel tempo de vida e resetada
    }
    else if(tempo_vida % 10 < 5)
    {
        
        image_alpha = 0 
    }
    else
    {
        image_alpha = 1
    }
}

muda_rota = 0

//Criando um metodo para movimentar o powerup na tela
move_power_up = function()
{
    muda_rota++
    if(muda_rota >= 60)
    {
        direction = direcao
        speed = vel
        muda_rota = 0
    }
    if (y > room_height)
    {
        direction = 90
    }
    if(y < 0)
    {
        direction = 270
    }
    if(x < 0)
    {
        direction = 0
    }
    if(x > room_width ) 
    {
        direction = 180
    }
    
}