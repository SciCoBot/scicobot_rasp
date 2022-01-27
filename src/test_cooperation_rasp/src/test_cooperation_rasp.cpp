// Copyright 2016 Open Source Robotics Foundation, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <memory>

#include "rclcpp/rclcpp.hpp"
#include <std_msgs/msg/u_int8.hpp>
#include <std_msgs/msg/float64.hpp>

#include <chrono>
#include <functional>


using namespace std::chrono_literals;

float tempMeasure()
{
    float systemp, millideg;
    FILE *thermal;
    int n;

    thermal = fopen("/sys/class/thermal/thermal_zone0/temp","r");
    n = fscanf(thermal,"%f",&millideg);
    fclose(thermal);
    systemp = millideg / 1000;

    //printf("CPU temperature is %f degrees C\n",systemp);

    return systemp;
}

using std::placeholders::_1;

class MinimalNode : public rclcpp::Node
{
public:
  MinimalNode()
  : Node("rasp_cooperation")
  {
  	 publisher_temperature = this->create_publisher<std_msgs::msg::Float64>("rasp_temp", 10);
    
    timer_temperature = this->create_wall_timer(2000ms, std::bind(&MinimalNode::timer_callback_temperature, this));
    
    subscription_encoder = this->create_subscription<std_msgs::msg::UInt8>(
      "rasp_encoder_right", 10, std::bind(&MinimalNode::topic_callback, this, _1));
      
  }

private:
  void timer_callback_temperature()
    {
      auto message = std_msgs::msg::Float64();
      message.data = tempMeasure();
      RCLCPP_INFO(this->get_logger(), "Publishing: '%f'", message.data);
      
      publisher_temperature->publish(message);
    }
    
  void topic_callback(const std_msgs::msg::UInt8::SharedPtr msg) const
  {
     RCLCPP_INFO(this->get_logger(), "I heard: '%d'", msg->data);
     auto message = std_msgs::msg::UInt8();
     message.data = msg->data;

  }
  
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_encoder;
  
  rclcpp::TimerBase::SharedPtr timer_temperature;
  
  rclcpp::Publisher<std_msgs::msg::Float64>::SharedPtr publisher_temperature;
  
};


int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalNode>());
  rclcpp::shutdown();
  return 0;
}
