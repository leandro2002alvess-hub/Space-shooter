/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando o sistema de vida do segundo inimigo
vida = 3

//Criando uma variavel de velocidade vertical
velv = 4

//Criando um sistema de cooldown do tiro
cooldown_tiro_inimigo = 0
//Por padrão ele receberá o valor de zero
//o valor limite que pode ser atingindo será aleatorios entre esse irandom_range
cooldown_tiro_maximo_inimigo = choose(irandom_range(55, 95), irandom_range(70, 195), irandom_range(80, 170));

////Criando um metodo para nosso inimigo
//tiro_inimigo = function()
//{
    ////fazendo eu ganhar cooldown inimigo
    //cooldown_tiro_inimigo++
    ////se meu cooldown_tiro_inimigo for maior que meu maximo do inimigo
    //if(cooldown_tiro_inimigo >= cooldown_tiro_maximo_inimigo)
    //{
        ////então ele criará um tiro do inimigo
        //var _tiro = instance_create_layer(x, y + 35, "Tiros_inimigos", oTiro_inimigo);
        ////foi comentado o direciton pois sprite já está na posição correta
        ////Sorteia um novo tempo para o PRÓXIMO tiro não ser igual
        //cooldown_tiro_maximo_inimigo = choose(irandom_range(25, 45), irandom_range(50, 145), irandom_range(60, 90));
        ////_tiro.direction = 270
        ////fazendo o som do tiro
        //audio_play_sound(snd_tiro, 1, 0)
        ////Resetando a minha variavel do tiro
        //cooldown_tiro_inimigo = 0
//
    //}
//}

//Criando o sistema de colisão do inimigo com o player
colidindo_player = function()
{
     //Se meu colidir com meu player
    if(instance_place(x, y, oPlayer))
    {
        //ele vai criar o efeito da particula
        instance_create_layer(x, y, "Detalhes", oExplosao)
        audio_play_sound(snd_explosao, 1, 0)
        
        //iremos verificar se temos a instancia escudo existindoWWAW
        if(instance_exists(oEscudo))
        {
            //se tivermos ela ativa então ela será destruida pelo impacto do tiro
            instance_destroy(oEscudo)
        }
        else
        {
            //iremos criar um novo else e dentro dele colocamos um if
            //ele vai ver se meu escudo e maior que zero
            if(oPlayer.qtd_escudos_ativos > 0)
            { 
                //se for então ele criará novos escudos
                instance_create_layer(x, y, "Player", oEscudo)
                oPlayer.perde_escudo()
                //toda vez que tiver colisão com o tiro então ele perde um escudo
            }
            else 
            {
                if(oPlayer.player_invencivel == false)
                {
                    oPlayer.perde_vida()
                    
                }
                
            }
        }
        //logo apos isso ele será destruido
        instance_destroy()
    }
    
}

//Criando um sistema de morte pro inimigo
morte_inimigo = function()
{
    vida--
    //ele vai criar o efeito da particula
    instance_create_layer(x, y, "Detalhes", oExplosao)
    audio_play_sound(snd_explosao, 1, 0)
    
    if(vida <= 0)
    {
        //Criando um sistema de chances para dropar meu powerup
       var _chance = random(100)
       //Criando um if para deixar aleatorio os drops do powerup
       if(_chance > 90 && oPlayer.level_tiro < oPlayer.level_tiro_max && instance_number(oPowerUp) == 0)
       {
           //se meu chance for maior que 90
           //então ele vai criar um powerup
           instance_create_layer(x, y, "Powerups", oPowerUp)
       }
       //logo apos isso ele será destruido
       instance_destroy()
    }
    
        
}


//Criando uma variavel para gerar posiçoes aleatorias pro inimigo2
randomise()
coordy = random_range(110, 160)


//criando um sistema de maquina de estados para meu inimigo
estado = "chegando"
//definindo o estado inicial como chegando

maquina_estados = function()
{
    //Criando um metodo para montar maquina de estados
    //vamos usar um switch e dentro dele pegar a variavel chegando
    switch (estado) 
    {
    	//iremos separar por casos assim terá comportamentos diferentes
        case "chegando": 
        {
            //Deixando de forma mais aleatoria
            if(y < coordy)
            {
                //Se mey y da room for menor que minha coordy com valores aleatorios
                //então ele vai se mover com base na velocidade meu velv pra uma posição aleatoria
                y += velv
                
            }
            else 
            {
                //se eu cheguei na posição desejada
                //então meu estado muda para carregando
                estado = "carregando"
                //debug pra teste
                show_debug_message("Cheguei")
            }
            
        }
        //Se meu case acabou, então ele deve parar     
        break;    
        case "carregando":
        {
            velv = 0
            //Criando um timer para o inimigo começar a atirar no player
            //diferente do inimigo 1 que possui um metodo o estado carregando possui o codigo
            //de timer do tiro e atirar dentro dele mesmo
            //fazendo eu ganhar cooldown inimigo
             cooldown_tiro_inimigo++
             //se meu cooldown_tiro_inimigo for maior que meu maximo do inimigo
             if(cooldown_tiro_inimigo >= cooldown_tiro_maximo_inimigo)
             {
                 estado = "atirar"
                //Resetando a minha variavel do tiro
                cooldown_tiro_inimigo = 0
             }   
        }
        break;    
        case "atirar":
        {
            //criando um tiro perseguidor
            if(instance_exists(oPlayer))
            {
                var _dir = point_direction(x, y, oPlayer.x, oPlayer.y)
            
                //então ele criará um tiro do inimigo
                var _tiro = instance_create_layer(x, y + 35, "Tiros_inimigos", oTiro_inimigo1);
                //foi comentado o direciton pois sprite já está na posição correta
                //Sorteia um novo tempo para o PRÓXIMO tiro não ser igual
                cooldown_tiro_maximo_inimigo = choose(irandom_range(55, 95), irandom_range(70, 195), irandom_range(80, 170));
                _tiro.direction = _dir
                //o tiro vai ir na direção do player com base nos parametros do _dir 
                //que armazena valores dentro de um point_direction que consiste em medir a direção de um ponto
                _tiro.speed = 4
                //dando a velocidade para o tiro
                _tiro.image_angle = _dir + 90
                //criando o angulo do tiro + 90 graus
                //fazendo o som do tiro
                audio_play_sound(snd_tiro, 1, 0)
            }
            estado = "carregando"
        }    
}

}


//Criando um sistema para ver o inimigo foi criado em sequencia
feito_em_sequence = in_sequence

//Criando um metodo para ver se fui criado na sequencia
cria_sequence = function()
{
    if(!in_sequence && feito_em_sequence)
    {
        instance_destroy()
    }
}