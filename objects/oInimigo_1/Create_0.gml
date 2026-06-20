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
        audio_play_sound(snd_tiro, 1, 0)
        //Resetando a minha variavel do tiro
        cooldown_tiro_inimigo = 0

    }
}