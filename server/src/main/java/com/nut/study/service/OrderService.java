package com.nut.study.service;


import com.nut.study.entity.Order;

import java.util.List;

public interface OrderService {
    List<Order> getOrderList();
    int createOrder(Order order);
    void deleteOrder(String id);

    void updateOrder(Order order);

    List<Order> getUserOrderList(String userId, String status);
}
