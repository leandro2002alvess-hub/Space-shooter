/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Criando um metodo de timer para encerrar a animação da explosão
//Criando um time para deletar o efeito do powerup
timer_anim_delete = 0
//por padrão ele receberá valo de 0
timer_anim_limite_delete = 30
//e o limite dele será 30
image_angle = random(359)


//criando um metodo para facilitar
roda_explosao = function()
{
    //Criando um timer para destruir particula
    timer_anim_delete++
    //fazendo meu timer ganhar tempo 
    if(timer_anim_delete >= timer_anim_limite_delete)
    {
        //se meu timer for maior que timer limite para deletar
        instance_destroy()
        //então ele vai destrui meu objeto particula powerup 
        timer_anim_delete = 0
        //resetando a variavel
    }
}