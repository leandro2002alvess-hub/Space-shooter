/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


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