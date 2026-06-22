/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando um sistema de cooldown do tiro
cooldown_tiro_inimigo = 0
//Por padrão ele receberá o valor de zero
//o valor limite que pode ser atingindo será aleatorios entre esse irandom_range
cooldown_tiro_maximo_inimigo = choose(irandom_range(30, 55), irandom_range(60, 195), irandom_range(60, 140));

//Criando um metodo para nosso inimigo
tiro_inimigo = function()
{
    //fazendo eu ganhar cooldown inimigo
    cooldown_tiro_inimigo++
    //se meu cooldown_tiro_inimigo for maior que meu maximo do inimigo
    if(cooldown_tiro_inimigo >= cooldown_tiro_maximo_inimigo)
    {
        //então ele criará um tiro do inimigo
        var _tiro = instance_create_layer(x, y + 35, "Tiros_inimigos", oTiro_inimigo);
        //foi comentado o direciton pois sprite já está na posição correta
        //Sorteia um novo tempo para o PRÓXIMO tiro não ser igual
        cooldown_tiro_maximo_inimigo = choose(irandom_range(30, 55), irandom_range(60, 195), irandom_range(60, 140));
        //_tiro.direction = 270
        //fazendo o som do tiro
        audio_play_sound(snd_tiro_1, 1, 0)
        //Resetando a minha variavel do tiro
        cooldown_tiro_inimigo = 0

    }
}

//Criando o sistema de colisão do inimigo com o player
colidindo_player = function()
{
     //Se meu colidir com meu player
    if(instance_place(x, y, oPlayer))
    {
        //ele vai criar o efeito da particula
        instance_create_layer(x, y, "Detalhes", oExplosao)
        
        
        //iremos verificar se temos a instancia escudo existindoWWAW
        if(instance_exists(oEscudo))
        {
            //se tivermos ela ativa então ela será destruida pelo impacto do tiro
            instance_destroy(oEscudo)
            audio_play_sound(snd_shield_down, 1, 0)
        }
        else
        {
            //iremos criar um novo else e dentro dele colocamos um if
            //ele vai ver se meu escudo e maior que zero
            if(oPlayer.escudo > 0)
            { 
                //se for então ele criará novos escudos
                audio_play_sound(snd_shield, 1, 0)
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
    //ele vai criar o efeito da particula
    instance_create_layer(x, y, "Detalhes", oExplosao)
    audio_play_sound(snd_explosao, 1, 0)
    //Criando um sistema de chances para dropar meu powerup
    var _chance = random(100)
    //Criando um if para deixar aleatorio os drops do powerup
    if(_chance > 90)
    {
        //se meu chance for maior que 90
        //então ele vai criar um powerup
        instance_create_layer(x, y, "Powerups", oPowerUp)
    }
    //logo apos isso ele será destruido
    instance_destroy()
        
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