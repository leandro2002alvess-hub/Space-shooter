/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(instance_exists(oPlayer))
{
    segue_player()
}
else
{
    instance_create_layer(x, y, "Detalhes", oParticula)
    instance_destroy()
}

drone_tiro()
