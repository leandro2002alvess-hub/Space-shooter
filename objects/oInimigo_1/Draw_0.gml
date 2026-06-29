/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()

if(flash_tempo > 0)
{
    shader_set(sh_branco)
    draw_self()
    shader_reset()
}
else 
{
    draw_self()	
}