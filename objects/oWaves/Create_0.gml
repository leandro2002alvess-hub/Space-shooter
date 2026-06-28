/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando o sistema de ondas do jogo
waves = [sq_wave1, sq_wave1b, sq_wave2, sq_wave3, sq_level2_wave, sq_level2_wave2b, sq_level2_wave3, sq_level3_wave1]
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
    if (sequence_ativa == noone || layer_sequence_is_finished(sequence_ativa))
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
                wave_atual = 0
            }
        }
    }
}

//Criando um sistema novo de waves sem uso do sequence
spawn_inimigos = 0
limite_spawn_inimigos = 60
maximo_inimigos_tela = 20

//Criando uma nova função para criar novas waves
cria_waves2 = function()
{
    var _total_inimigos = instance_number(oInimigo_1) + instance_number(oInimigo_2) + instance_number(oInimigo_3);
    if(_total_inimigos < maximo_inimigos_tela)
    {
        spawn_inimigos++
        if(spawn_inimigos >= limite_spawn_inimigos)
        {
            //Criando um sistema aleatorio de spawn de inimigos
            var cria_inimigos = choose(oInimigo_2, oInimigo_3)
            var _x_espalhado = random_range(64, room_width - 64);
            //Criando o inimigo dentro do jogo
            instance_create_layer(_x_espalhado, -64, "Inimigos_1", cria_inimigos)
            spawn_inimigos = 0
        }
    }
}

//definindo um valor de tempo spawn por padrão zero
spawn_suprimentos = 0  
//definindo um limite de tempo de 180 frames
limite_spawn_suprimentos = 180
//dando um limite de suprimentos na tela que será 5 
maximo_sup_tela = 5

//Criandon um sistema de spawn dos powerups vida e escudo
suporte_suprimentos = function()
{
    //usando um var temporaria para guardar a minha instance_number onde irá armazenar o objeto que quero
    var _total_suprimentos = instance_number(oVida_powerup) + instance_number(oEscudo_powerup)
    if(_total_suprimentos < maximo_sup_tela)
    {
        //se meu _total_suprimentos for menor que maximo_sup_tela
        spawn_suprimentos++
        //então ele ganha tempo no spawn_suprimentos
        if(spawn_suprimentos >= limite_spawn_suprimentos)
        {
            //se o spawn_suprimentos for maior que limite_spawn_suprimentos
            //Criando um sistema aleatorio de spawn de  powerups vida e escudo
            //ele vai escolher entre os dois
            var cria_sup = choose(oVida_powerup, oEscudo_powerup)
            var _x_espalhado = random_range(64, room_width - 64);
            //ele vai definir com base na largura horizontal da room onde nascer
            //e ele tambem nascerá fora da tela e vai descer
            //Criando o powerup dentro do jogo
            instance_create_layer(_x_espalhado, -64, "Powerups", cria_sup)
            spawn_suprimentos = 0
            //resentando a variavel de tempo
        }
    }
}

//por padrão seu tempo e zero
spawn_speed = 0
//limite maximo que chegará a 2400 frames
limite_spawn_speed = 2400

//Criando o powerup de velocidade
powerupspeed = function()
{
    //ele vai ganhar tempo
    spawn_speed++
    if(spawn_speed >= limite_spawn_speed)
    {
        //se meu spawn_speed for maior que o limite
        //então ele cria o objeto indo da esquerda pra direita usando um raio aleatorio pro eixo y
        //fazendo ele nascer encima ou embaixo verticalmente 
        var _y_espalhado = random_range(64, room_height - 64);
        instance_create_layer(x, _y_espalhado, "Powerups", oSpeed_powerup)
        //resetando a variavel
        spawn_speed = 0
    }
}