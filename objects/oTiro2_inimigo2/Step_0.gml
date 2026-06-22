/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Fazendo o tiro voltar ao tamanho normal dele
//Se meu imagem escala por padrão começar por 1.7 logo apos isso
//Ele irá diminuir para 1.5 e ser subtraindo por 0.5 
image_xscale = max(1.5 - 0.5, 0)


//Fazendo meu Y da room pegar a variavel de velocidade vertical
//Criando o movimento do tiro
//Faz o tiro Descer (somando do Y)
y += velv;

// Se o tiro passar da parte inferior da tela (Y menor que 0), ele se destrói, ele ainda
//vai percorrer 64 pixels fora da tela
if (y > room_height + 64)
{
    instance_destroy();
    //Debugando para ver se o tiro foi destruido
    show_debug_message("Tiro destruido no topo!");
    //Se eu sair da room o tiro acaba
}

//Chamando o metodo dentro do step do objeto tiro
acerta_player()