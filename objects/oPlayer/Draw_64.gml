/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Rodando o debugando para ver o nivel atual do level
if(global.debug)
{
    draw_text(20, 20, "Level tiro: " + string(level_tiro))
    draw_text(20, 40, invencivel)
}

var gui_height = display_get_gui_height()
//Chamando meu metodo de desenhar icones dentro do draw gui
desenha_icones(spr_vida, vida, gui_height - 30);
desenha_icones(spr_escudo, escudo, gui_height - 80)
