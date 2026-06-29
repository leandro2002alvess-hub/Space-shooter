/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Tocando a musica do jogo
audio_play_sound(snd_musicgame, 1, 1)

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
vel_max = 6

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

//Criando um limitador para meus escudos
qtd_escudos = 3
qtd_escudos_ativos = 3
//por padrão temos 3 escudos
//criando uma variavel de limite pro meu escudo
qtd_escudo_limite = 8


//Criando uma função para ganhar escudo
ganha_escudo = function()
{
    //se a minha quantidade de escudos por menor que a quantidade maxima
    //antigamente esse if guardava a variavel escudo e agora ele utiliza qtd_escudos_ativos e qtd_escudos
    if(qtd_escudos_ativos < qtd_escudos)
    {
        //então eu ganho escudos
        qtd_escudos_ativos++
    }
    else if(qtd_escudos < qtd_escudo_limite)
    {
        //Criando um limite se a qtd_escudos e menor que o limite
        //então eu não ganho, so passo a ganhar se eu perder 
        qtd_escudos++
        qtd_escudos_ativos++
    }
    
}

//Criando um limitador para meus escudos
qtd_vidas = 3
qtd_vidas_ativas = 3
//por padrão temos 3 escudos
//criando uma variavel de limite pro meu escudo
qtd_vidas_limite = 8

//Criando meu metodo ganha vida
ganha_vida = function()
{
    //se a minha quantidade de vidas  por menor que a quantidade maxima
    //antigamente esse if guardava a variavel vida e agora ele utiliza qtd_vidas_ativas e     if(qtd_vidas_ativas < qtd_vidas)
    if(qtd_vidas_ativas < qtd_vidas)
    {
        //então eu ganho escudos
        qtd_vidas_ativas++
    }
    else if(qtd_vidas < qtd_vidas_limite)
    {
        //Criando um limite se a qtd_vidas++ e menor que o limite
        //então eu não ganho, so passo a ganhar se eu perder 
        qtd_vidas++
        qtd_vidas_ativas++
    }
}

//Criando mais um metodo para nosso powerup speed
ganha_speed = function()
{
    //se meu velv for menor que meu vel max e velvh for menor que meu vel max
    if(velv < vel_max && velh < vel_max)
    {
        //então ambos vão ganhar velocidade de 0.3
        velv += 0.3
        velh += 0.3
    }
    
}

//Criando as variaveis para limitar os drones
qtd_drones = 0
//definindo um limite de quantos drones posso ter
qtd_drones_limite = 4

//Criando mais um metodo para o nosso sistema de powerups
ganha_naves = function()
{
    //se minha qtd_drones e menor que qtd_drones_limite
    if(qtd_drones < qtd_drones_limite)
    {
        //então eu ganho um drone
        qtd_drones += 1
        //chamando o instance create para gerar esse meu drone 
        instance_create_layer(x, y, "Drones", oDrone)
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

//Criando um sistema para deixar o player branco
flash_tempo = 0

//criando um metodo para perder vida 
perde_vida = function()
{
    //mudando as variaveis de vida para qtd_vidas_ativas
    qtd_vidas_ativas--;
    //Chamando meu metodo screenshake
    oScreenshake.treme = 10
    flash_tempo = 10
    if(qtd_vidas_ativas <= 0) 
    { 
      audio_play_sound(snd_explosao, 1, 0)
      
      //Se eu morri então ele roda a criação da particula de explosão
      //ele vai criar o efeito da particula 
      instance_create_layer(x, y, "Detalhes", oExplosao)   
      oScreenshake.treme = 40  
      instance_destroy() 
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
    //mudando as variaveis de escudo para qtd_escudos_ativos
    qtd_escudos_ativos--;
    oScreenshake.treme = 15
    if(qtd_escudos_ativos <= 0)
    {
       qtd_escudos_ativos = 0;
    }
}