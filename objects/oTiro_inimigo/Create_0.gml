/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando o sistema de velocidade e destruição do meu tiro
velv = 5;

//Criando um sistema personalizado para efeito do tiro
image_xscale = 1.7
//Por padrão meu tiro irá se iniciar sendo maior que normal
//Ele tambem terá variadade em suas cores
image_blend = make_colour_rgb(irandom(255), irandom(255), irandom(255))


//Criando o sistema de colisão do tiro com o player
acerta_player = function()
{
    //Se meu colidir com meu player
    if(instance_place(x, y, oPlayer))
    {
        instance_create_layer(x, y, "Detalhes", oParticula)
        
        
        //iremos verificar se temos a instancia escudo existindo
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
                instance_create_layer(x, y, "Player", oEscudo)
                audio_play_sound(snd_shield, 1, 0)
                oPlayer.perde_escudo()
                //toda vez que tiver colisão com o tiro então ele perde um escudo
            }
            else 
            {
                if(oPlayer.player_invencivel == false)
                {
                    //ele vai criar o som da explosão
                    audio_play_sound(snd_explosao, 1, 0)
                    oPlayer.perde_vida()
                    
                }
                
            }
        }
        //logo apos isso ele será destruido
        instance_destroy()
    }
    
}
