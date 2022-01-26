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
Depois use o comando a seguir para executar o pacote
```
ros2 run teleop_twist_keyboard teleop_twist_keyboard
```
**NOTA:** obviamente, para todos os pacotes criados, é necessário a correta execução no arduino.
## Trabalhos futuros
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
