#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/bool.hpp"
#include <std_msgs/msg/float32.hpp>
#include <std_msgs/msg/u_int8.hpp>

using namespace std::chrono_literals;
using std::placeholders::_1;

bool move(float ultrasonic, uint8_t encoder_right, uint8_t encoder_left){
	if((ultrasonic < 15.0) & (encoder_right > 0) & (encoder_left > 0)){
		return false;
	}
	else{
		return true;
	}
}

class MinimalPublisher : public rclcpp::Node
{
  public:
    MinimalPublisher()
    : Node("scicobot_raspberry")
    {
    
    publisher_on_move = this->create_publisher<std_msgs::msg::Bool>("move_on", 10);
      
    subscription_ultrasonic = this->create_subscription<std_msgs::msg::Float32>(
      "frontal_ultrasonic", 10, std::bind(&MinimalPublisher::callback_ultrasonic, this, _1));
       
    subscription_encoder_left = this->create_subscription<std_msgs::msg::UInt8>(
      "encoder_left", 10, std::bind(&MinimalPublisher::callback_encoder_left, this, _1));
    
    subscription_encoder_right = this->create_subscription<std_msgs::msg::UInt8>(
      "encoder_right", 10, std::bind(&MinimalPublisher::callback_encoder_right, this, _1));
    }

  private:
    
  void callback_ultrasonic(const std_msgs::msg::Float32::SharedPtr msg_ultrasonic) //const
  {
    this->new_msg_ultrasonic = msg_ultrasonic->data;
    
    //RCLCPP_INFO(this->get_logger(), "new_msg_ultrasonic: %lf", this->new_msg_ultrasonic);
     
    auto new_msg = std_msgs::msg::Bool();
    new_msg.data = move(this->new_msg_ultrasonic, this->new_msg_encoder_right, this->new_msg_encoder_left);
 
    RCLCPP_INFO(this->get_logger(), "Received ultrasonic: %lf, Published: %d", msg_ultrasonic->data, new_msg.data);

    publisher_on_move->publish(new_msg);
  }
  
  void callback_encoder_left(const std_msgs::msg::UInt8::SharedPtr msg_encoder_left) //const
  {
    this->new_msg_encoder_left = msg_encoder_left->data;    
    
    auto new_msg = std_msgs::msg::Bool();
    new_msg.data = move(this->new_msg_ultrasonic, this->new_msg_encoder_right, this->new_msg_encoder_left);
    
    RCLCPP_INFO(this->get_logger(), "Received left: %d, Published: %d", msg_encoder_left->data, new_msg.data);
        
    publisher_on_move->publish(new_msg);
  }
  
  void callback_encoder_right(const std_msgs::msg::UInt8::SharedPtr msg_encoder_right) //const
  {
    this->new_msg_encoder_right = msg_encoder_right->data;
    
    auto new_msg = std_msgs::msg::Bool();
    new_msg.data = move(this->new_msg_ultrasonic, this->new_msg_encoder_right, this->new_msg_encoder_left);    
    
    RCLCPP_INFO(this->get_logger(), "Received right: %d, Published: %d", msg_encoder_right->data);
    
    publisher_on_move->publish(new_msg);
  }
  
  	 float new_msg_ultrasonic = 0;
  	 uint8_t new_msg_encoder_left = 0;
  	 uint8_t new_msg_encoder_right = 0;
  	 
  	 rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_encoder_right;
  	 rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_encoder_left;
    
    rclcpp::Publisher<std_msgs::msg::Bool>::SharedPtr publisher_on_move;
  	 
  	 rclcpp::Subscription<std_msgs::msg::Float32>::SharedPtr subscription_ultrasonic;
};


int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalPublisher>());
  rclcpp::shutdown();
  return 0;
}
