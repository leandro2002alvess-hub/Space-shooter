/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Fazendo o tiro voltar ao tamanho normal dele
//Se meu imagem escala por padrão começar por 1.7 logo apos isso
//Ele irá diminuir para 1.5 e ser subtraindo por 0.5 
image_xscale = max(1.5 - 0.5, 0)


//Fazendo meu Y da room pegar a variavel de velocidade vertical
//Criando o movimento do tiro
//Faz o tiro SUBIR (subtraindo do Y)
y -= velv;

// Se o tiro passar do topo da tela (Y menor que 0), ele se destrói
if (y < 0)
{
    instance_destroy();
    //Debugando para ver se o tiro foi destruido
    //show_debug_message("Tiro destruido no topo!");
    //Se eu sair da room o tiro acaba
}

//chamando o metodo dentro do step do tiro
causa_dano_inimigo()

colide_tiro()