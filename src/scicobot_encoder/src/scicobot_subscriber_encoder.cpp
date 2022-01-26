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

class MinimalSubscriber : public rclcpp::Node
{
public:
  MinimalSubscriber()
  : Node("scicobot_raspberry")
  {
    subscription_encoder_left = this->create_subscription<std_msgs::msg::UInt8>(
      "encoder_left", 10, std::bind(&MinimalSubscriber::callback_encoder_left, this, _1));
    
    subscription_encoder_right = this->create_subscription<std_msgs::msg::UInt8>(
      "encoder_right", 10, std::bind(&MinimalSubscriber::callback_encoder_right, this, _1));
  }

private:
  void callback_encoder_left(const std_msgs::msg::UInt8::SharedPtr msg_encoder_left) const
  {
    RCLCPP_INFO(this->get_logger(), "I heard left: '%d'", msg_encoder_left->data);
  }
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_encoder_left;
  
  void callback_encoder_right(const std_msgs::msg::UInt8::SharedPtr msg_encoder_right) const
  {
    RCLCPP_INFO(this->get_logger(), "I heard right: '%d'", msg_encoder_right->data);
  }
  rclcpp::Subscription<std_msgs::msg::UInt8>::SharedPtr subscription_encoder_right;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalSubscriber>());
  rclcpp::shutdown();
  return 0;
}
