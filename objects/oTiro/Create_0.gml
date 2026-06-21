/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando o sistema de velocidade e destruição do meu tiro
velv = 5;

//Criando um sistema personalizado para efeito do tiro
image_xscale = 1.7
//Por padrão meu tiro irá se iniciar sendo maior que normal
//Ele tambem terá variadade em suas cores
image_blend = make_colour_rgb(irandom(255), irandom(255), irandom(255))


//Criando um metodo de dano para acertar o inimigo
causa_dano_inimigo = function()
{
    // Captura o "CPF" (ID único) da instância exata que o tiro colidiu
    var _inimigo_atingido = instance_place(x, y, oInimigo_1);
    
    // Se o ID for diferente de "noone" (ou seja, se realmente colidiu com alguém)
    if(_inimigo_atingido != noone)
    {
        //Criando o efeito de particula do tiro do player
        instance_create_layer(x, y, "Detalhes", oParticula)
        
        // Manda APENAS a instância atingida rodar o método de morte!
        _inimigo_atingido.morte_inimigo()
        
        //destruindo o tiro ao colidir com o inimigo
        instance_destroy()
    }
}