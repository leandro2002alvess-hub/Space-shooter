/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()

//Rodando o debugando para ver o nivel atual do level
if(global.debug)
{
    draw_text(x, y, "Vida: " + string(vida))
    draw_text(x, y + 20, "Vida: " + string(estado))
    
}

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