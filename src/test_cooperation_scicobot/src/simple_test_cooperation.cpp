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


using std::placeholders::_1;

class MinimalNode : public rclcpp::Node
{
public:
  MinimalNode()
  : Node("scicobot_cooperation")
  {
  	 publisher_move = this->create_publisher<std_msgs::msg::UInt8>("rasp_encoder_right", 10);
    
    subscription_move = this->create_subscription<std_msgs::msg::UInt8>(
      "encoder_right", 10, std::bind(&MinimalNode::topic_callback, this, _1));
      
  }

private:
  void topic_callback(const std_msgs::msg::UInt8::SharedPtr msg) const
  {
     RCLCPP_INFO(this->get_logger(), "I heard: '%d'", msg->data);
     auto message = std_msgs::msg::UInt8();
     message.data = msg->data;
         
     publisher_move->publish(message);
  }
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_move;
  
  rclcpp::Publisher<std_msgs::msg::UInt8>::SharedPtr publisher_move;
  
};


int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalNode>());
  rclcpp::shutdown();
  return 0;
}
