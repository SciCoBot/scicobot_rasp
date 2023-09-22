# scicobot_rasp

## Descrição

### scicobot_encoder

Criar dois inscritos, utilizados para receber dados publicados dos sensores encoders, escrevendo na janela os valores obtidos.

### scicobot_move_on

Criar um editor para enviar dados publicados dados, para isso, é os dados dos sensores encoders e ultrassônico são analisados.

### scicobot_ultrasonic

Criar um inscrito para receber dados publicados do ultrassônico e escreve na janela os valores obtidos.

### teleop_twist_keyboard

É um projeto externo disponível [aqui](https://index.ros.org/r/teleop_twist_keyboard/#foxy). Ele é utilizado pelo Scicobot para movimentar o robô a partir de comandos do teclado. Para isso, instale o pacote antes de usar

```
sudo apt install ros-foxy-teleop-twist-keyboard
```

## Building dependências

Para instalar, primeiro forneça sua instalação do ROS 2:
```
source /opt/ros/foxy/setup.bash
```
Baixe o projeto

```
git clone https://github.com/SciCoBot/scicobot_rasp.git
```
Em /scicobot_rasp, verifique as dependências com:
```
rosdep install -i --from-path src --rosdistro foxy -y
```
Caso tenha sucesso, contrua o projeto com:
```
colcon build 
```

Nota: Devido a limitação de hardware do raspberry o processo de build pode travar. Para esse caso, use a solução descrita [aqui](https://answers.ros.org/question/407554/colcon-build-freeze-a-raspberry-pi/). Essa solução altera o build em paralelo, padrão do colcon, para um build sequencial:
```
colcon build --executor sequential
```

## Running

Use o comando abaixo para configurar o espaço de trabalho conforme as necessidades dos projetos
```
. install/setup.bash
```

**NOTA:** cuidado para não executar . install/setup.bash no mesmo terminal no qual o projeto foi criado, isto pode gerar resultados inesperados/indesejados.


Para executar um projeto, use:
```
ros2 run <nome do projeto> <nome do executável>
```
Por exemplo:

```
ros2 run teleop_twist_keyboard teleop_twist_keyboard
```

```
ros2 run scicobot_encoder listener_encoder
```

```
ros2 run test_cooperation_scicobot cooperation_scicobot
```

**NOTA:** Para funcionar corretamenta também é necessária a correta execução do software do arduino.

## Building e running projetos ROS2 (foxy)

- [Como realizar o buid e run de projetos ROS2 (foxy)](https://docs.ros.org/en/foxy/Tutorials/Beginner-Client-Libraries/Writing-A-Simple-Cpp-Publisher-And-Subscriber.html#build-and-run)

## Nota de desenvolvimento - Melhorias

- Adicionar aplicação que executa a dinâmica de trabalho 
```
source /opt/ros/foxy/setup.bash
sudo snap install micro-xrce-dds-agent --edge
snap set micro-xrce-dds-agent daemon=true
sudo snap refresh core --edge
sudo snap set core experimental.hotplug=true
sudo systemctl restart snapd
snap interface serial-port
snap connect micro-xrce-dds-agent:serial-port snapd:<slots snapd>
sudo micro-xrce-dds-agent serial --dev /dev/ttyACM0 -v6
```
e depois execute o pacote ROS2 desejado.

## Teste multi-robôs
Usa scicobot_encoder, test_cooperation_rasp e test_cooperation_scicobot
- Scicobot 1:
  - Raspberry:
    - Tela 1:
    ```
    cd microros_ws
    source /opt/ros/foxy/setup.bash
    ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0

    ```
    ```
    source /opt/ros/foxy/setup.bash
    ros2 run teleop_twist_keyboard teleop_twist_keyboard
    ```
    - Tela 2:
    ```
    source /opt/ros/foxy/setup.bash
    ros2 run scicobot_encoder listener_encoder
    ```
     - Tela 3:
     ```
     source /opt/ros/foxy/setup.bash
     ros2 run test_cooperation_scicobot cooperation_scicobot
     ```
     - Tela 4: micro-xrce-dds-agent
   - Arduino: [exemplo encoder_moveTwist](https://github.com/SciCoBot/scicobot_arduino/blob/main/examples/encoder_moveTwist/encoder_moveTwist.ino)
   
- Scicobot 2:
  - Raspberry:
    - Tela 1:
     ```
     source /opt/ros/foxy/setup.bash
     ros2 run test_cooperation_rasp operation_rasp
     ```
<p align="center">
  <img src="https://github.com/SciCoBot/scicobot_rasp/blob/main/images/telas_rasp.png"/ height="400" width="750">
</p>

### Comportamento inesperado

Tem-se que o comportamento esperado é:
<p align="center">
  <img src="https://github.com/SciCoBot/scicobot_rasp/blob/main/images/comportamento_pc.png"/ >
</p>

No entanto, o resultado foi:
<p align="center">
  <img src="https://github.com/SciCoBot/scicobot_rasp/blob/main/images/comportamento_rasp.png"/ >
</p>
É estranho o fato de não aparecer o nó do arduino, de todo modo, os tópicos estão funcionam adequadamente, logo, as trocas de mensagens não parecem ter sido afetadas.
