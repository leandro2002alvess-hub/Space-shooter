/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando o sistema de vida e escudo do player
vida = 3
escudo = 3

//Criando um sistema invencibilidade para o player
//deixando o player com o status de invencivel desligado ou seja false
player_invencivel = false
invencivel = 0
invencivel_max = 60


//Criando o sistema de movimentos do player
velh = 3
velv = 3

//Criando um sistema de cooldown do tiro
cooldown_tiro = 0
cooldown_tiro_maximo = 20


//Criando um sistema de leveis para meu tiro mudar conforme o andar do jogo
level_tiro = 1;
//Criando um limitador para o level do tiro
level_tiro_max = 3;

//Criando um metodo pro tiro
tiro_1 = function(_botao)
{
    //Criando o sistema de tiro da nave
    //Aumenta o cooldown do meu tiro
    cooldown_tiro++
    //Se eu apertar espaço e ao mesmo tempo meu cooldown_tiro
    //for maior que meu cooldown maximo
    if(_botao && cooldown_tiro >= cooldown_tiro_maximo)
    {
        //Então ele criara uma nova instancia do meu tiro
        instance_create_layer(x, y - 15, "Tiro", oTiro);
        //Rodando o codigo de criação do som
        audio_play_sound(snd_tiro, 1, 0)
        //Zerando a variavel do cooldown do tiro para poder atirar novamente
        cooldown_tiro = 0
    }
}

//Criando um metodo pro tiro
tiro_2 = function(_botao)
{
    //Criando o sistema de tiro da nave
    //Aumenta o cooldown do meu tiro
    cooldown_tiro++
    //Se eu apertar espaço e ao mesmo tempo meu cooldown_tiro
    //for maior que meu cooldown maximo
    show_debug_message(cooldown_tiro)
    if(_botao && cooldown_tiro >= cooldown_tiro_maximo)
    {
        //Então ele criara uma nova instancia do meu tiro
        var _tiro = instance_create_layer(x - 10, y - 15, "Tiro", oTiro) && instance_create_layer(x + 10, y - 15, "Tiro", oTiro);
        //Rodando o codigo de criação do som
        audio_play_sound(snd_tiro, 1, 0)
        //Zerando a variavel do cooldown do tiro para poder atirar novamente
        cooldown_tiro = 0
    }
}

//Criando um metodo pro tiro
tiro_3 = function(_botao)
{
    //Criando o sistema de tiro da nave
    //Aumenta o cooldown do meu tiro
    cooldown_tiro++
    //Se eu apertar espaço e ao mesmo tempo meu cooldown_tiro
    //for maior que meu cooldown maximo
    if(_botao && cooldown_tiro >= cooldown_tiro_maximo)
    {
        //Então ele criara uma nova instancia do meu tiro
        var _tiro = instance_create_layer(x - 10, y - 15, "Tiro", oTiro) && 
        instance_create_layer(x + 10, y - 15, "Tiro", oTiro) && instance_create_layer(x, y - 15, "Tiro", oTiro)
        //Rodando o codigo de criação do som
        audio_play_sound(snd_tiro, 1, 0)
        //Zerando a variavel do cooldown do tiro para poder atirar novamente
        cooldown_tiro = 0
    }
}


//Criando uma função para fazer o player ganhar level ao colidir com o power up
ganha_level_tiro = function()
{
    //Criando um limite pro meu level
    //Se eu colidir com um powerup e meu level tiro for maior que meu tiro
    //no nivel maximo então o codigo e encerrado
    if(level_tiro < level_tiro_max)
    {
        level_tiro++
    }
    
}


//Criando um metodo para desenhar nosso icone de vida
//Chamando um parametro dentro do meu metodo _icone = spr_vida
//por padrão ele sempre vai chamar por spr_vida porém podemos passar o nome da sprite
//spr_escudo dentro do draw_gui como desenha_icones(spr_escudo) assim desenhará tres escudos
//tambem pode colocar a quantidade de vez que queremos que seja desenhado o icone na tela
//por isso passamos qtd = 1, e por fim podemos colocar _y com a posição do valor 
desenha_icones = function(_icone = spr_vida, qtd = 1, _y = 20)
{
    var gui_height = display_get_gui_height()
    //Criando uma variavel para determinar a distancia da vida
    var xspace = 25
    //Por padrão meu desenho vai ser feito na posição 25 da room
    //Rodando um repeat para repetir meu desenho conforme a quantidade que vidas que eu tenho
    //por padrão vida leva o valor 3 
    repeat(qtd) 
    {
        //Desenhando a sprite da vida na tela
        draw_sprite_ext(_icone, 1, xspace, _y, 2, 2, 0, c_white, 0.6)
        //desenhando meu spr_vida 3 vezes em locais diferentes
        xspace += 55
        //toda vez que uma vida for desenhada ele vai pular 55 pixels para desenhar a proxima
    }
    
}

//criando um metodo para perder vida 
perde_vida = function()
{
    vida--;
    if(vida <= 0) 
    { 
      audio_play_sound(snd_explosao, 1, 0)
      instance_destroy()
      //Se eu morri então ele roda a criação da particula de explosão
      //ele vai criar o efeito da particula 
      instance_create_layer(x, y, "Detalhes", oExplosao)   
        
    }
    else 
    { 
      player_invencivel = true
      invencivel = 0
    }
}



//Criando um metodo para ativar meu escudo
perde_escudo = function()
{
    escudo--;
    if(escudo <= 0)
    {
        //image_speed = 0
    }
}