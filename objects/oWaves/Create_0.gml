/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando o sistema de ondas do jogo
waves = [sq_wave1, sq_wave1b, sq_wave2, sq_wave3]
//Criando uma lista de array para armazenar minhas waves

//por padrão nossa wave começa como zero
wave_atual = 0
//vendo se a wave está pront para avançar
wave_pronta = false

//Criando um limite de tempo para ondas
cria_waves_timer = 0
cria_waves_timer_limite = 100


sequence_ativa = noone

//Informando quando uma onde deve ser criada por metodo
cria_waves = function()
{
    // Se a tela estiver vazia, não importa se foi por morte ou fuga!
    if(instance_number(oInimigo_1) == 0)
    {
        cria_waves_timer++
        if(cria_waves_timer >= cria_waves_timer_limite)
        {
            if(sequence_ativa != noone)
            {
                layer_sequence_destroy(sequence_ativa);
            }
            
            //Cria a onda atual
            sequence_ativa = layer_sequence_create("sq_inimigos", 0, 0, waves[wave_atual])
            cria_waves_timer = 0
            
            //avança para a próxima wave
            wave_atual += 1
            
            //MÁGICA: Se estourou o tamanho da lista, trava na ÚLTIMA wave!
            if(wave_atual >= array_length(waves))
            {
                //array_length é 4. O último índice é 3 (4 - 1).
                wave_atual = array_length(waves) - 1; 
            }
        }
    }
}