/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//criando uma variavel de vida pro inimigo3
vida = 7

velv = 6

//Criando um sistema para manter o inimigo na tela
tempo_na_tela = 0
tempo_limite_fuga = 500

//Criando um sistema de cooldown do tiro
cooldown_tiro_inimigo = 0
//Por padrão ele receberá o valor de zero
//o valor limite que pode ser atingindo será aleatorios entre esse irandom_range
cooldown_tiro_maximo_inimigo = choose(irandom_range(30, 55), irandom_range(60, 195), irandom_range(60, 140));

//Criando o sistema de colisão do inimigo com o player
colidindo_player = function()
{
     //Se meu colidir com meu player
    if(instance_place(x, y, oPlayer))
    {
        //ele vai criar o efeito da particula
        instance_create_layer(x, y, "Detalhes", oExplosao)
        audio_play_sound(snd_explosao, 1, 0)
        oScreenshake.treme = 20
        
        //iremos verificar se temos a instancia escudo existindo
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

flash_tempo = 0

//Criando um sistema de morte pro inimigo
morte_inimigo = function()
{
    vida--
    //ele vai criar o efeito da particula
    instance_create_layer(x, y, "Detalhes", oExplosao)
    audio_play_sound(snd_explosao, 1, 0)
    oScreenshake.treme = 10
    flash_tempo = 10
    if(vida <= 0)
    { 
       //Criando um sistema de chances para dropar meu powerup
       var _chance = random(100)
       //Criando um if para deixar aleatorio os drops do powerup
       if(_chance > 90)
       {
           //se meu chance for maior que 90
           //então ele vai criar um powerup
           instance_create_layer(x, y, "Powerups", oNavinhas_powerup)
       }
       //logo apos isso ele será destruido
       instance_destroy()
    }
        
}



//Criando uma variavel para gerar posiçoes aleatorias pro inimigo2
randomise()
coordy = random_range(10, 80)


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
            
             tempo_na_tela++
            //ganhando tempo de tela
             if(tempo_na_tela >= tempo_limite_fuga)  
             {
                //se meu tempo de tela for mairo que meu limite para fuga
                estado = "fugindo"
                velv = 6
                //então ele muda o estado
                //mudando o estado para fugindo
                direcao_fuga = choose("cima", "baixo", "esquerda", "direita");
                //ele vai escolher a direção para fugir
             }
             //se meu cooldown_tiro_inimigo for maior que meu maximo do inimigo
             else if(cooldown_tiro_inimigo >= cooldown_tiro_maximo_inimigo)
             {
                estado = choose("atirar", "atirar2")
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
                var _tiro = instance_create_layer(x, y + 35, "Tiros_inimigos", oTiro_inimigo2);
                //foi comentado o direciton pois sprite já está na posição correta
                //Sorteia um novo tempo para o PRÓXIMO tiro não ser igual
                cooldown_tiro_maximo_inimigo = choose(irandom_range(55, 95), irandom_range(70, 195), irandom_range(80, 170));
                _tiro.direction = _dir
                //o tiro vai ir na direção do player com base nos parametros do _dir 
                //que armazena valores dentro de um point_direction que consiste em medir a direção de um ponto
                _tiro.speed = 0.5
                //dando a velocidade para o tiro
                _tiro.image_angle = _dir + 90
                //criando o angulo do tiro + 90 graus
                //fazendo o som do tiro
                audio_play_sound(snd_tiro, 1, 0)
            }
            estado = "carregando"
        }    
        break;
        case "atirar2":
        {
            if(instance_exists(oPlayer))
            {
                var _dir = point_direction(x, y, oPlayer.x, oPlayer.y)
            
                //então ele criará um tiro do inimigo
                var _tiro = instance_create_layer(x, y + 35, "Tiros_inimigos", oTiro2_inimigo2)  
                var _tiro2 = instance_create_layer(x + 15, y + 35, "Tiros_inimigos", oTiro2_inimigo2) 
                //foi comentado o direciton pois sprite já está na posição correta
                //Sorteia um novo tempo para o PRÓXIMO tiro não ser igual
                cooldown_tiro_maximo_inimigo = choose(irandom_range(55, 95), irandom_range(70, 195), irandom_range(80, 170));
                _tiro.direction = _dir
                _tiro2.direction = _dir
                //o tiro vai ir na direção do player com base nos parametros do _dir 
                //que armazena valores dentro de um point_direction que consiste em medir a direção de um ponto
                _tiro.speed = 1
                _tiro2.speed = 1
                //dando a velocidade para o tiro
                _tiro.image_angle = _dir + 90
                _tiro2.image_angle = _dir + 90
                //criando o angulo do tiro + 90 graus
                //fazendo o som do tiro
                audio_play_sound(snd_tiro, 1, 0)
            }
            estado = "carregando"
        }     
        break;
        case "fugindo":
        {
            //Criando um case para o inimigo fugir 
            //criando um sistema de fuga para quatro direçoes
            if(direcao_fuga == "cima")
            {
                y -= velv
            }
            if(direcao_fuga == "baixo")
            {
                y += velv
            }
            if(direcao_fuga == "esquerda")
            {
                x -= velv
            }
            if(direcao_fuga == "direita")
            {
                x += velv
            }
            //Criando um if para destruir meu inimigo ao sair da room
            //Se o inimigo passar da parte inferior da tela (Y menor que 0), ele se destrói, ele ainda
            //vai percorrer 64 pixels fora da tela
            if (y > room_height + 64 || y < -64)
            {
                instance_destroy();
                //Debugando para ver se o tiro foi destruido
                show_debug_message("nave destruido y");
                //Se eu sair da room o tiro acaba
            }
            if(x > room_width + 32 || x < -32)
            {
                instance_destroy();
                show_debug_message("nave destruido x");
            }
            
        }    
        break;  
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

