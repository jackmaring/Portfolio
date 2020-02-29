package com.jackmaring;

import java.util.*;

public class Basket {

    private final String name;
    private final Map<StockItem, Integer> list;

    public Basket(String name) {
        this.name = name;
        this.list = new TreeMap<>();
    }

    public int addToBasket(StockItem item, int quantity) {
        if((item != null) && (quantity > 0)) {
            int inBasket = list.getOrDefault(item, 0);
            if(item.quantityInStock() > (item.getReserved() + quantity)) {
                item.reserveItem(quantity);
                list.put(item, quantity);
                return inBasket;
            } else {
                System.out.println("Sorry but there are already " + item.getReserved() + " reserved " + item.getName() + ". Try ordering less");
            }
        }
        return 0;
    }

    public void unreserveItems(StockItem item, int quantity) {
        if(list.containsKey(item) && (item.getReserved() >= quantity)) {
            item.adjustReserve(-quantity);
        } else {
            System.out.println("Nahhhh");
        }
    }

    public void checkOut() {
        Iterator<Map.Entry<StockItem, Integer>> iter = list.entrySet().iterator();
        while(iter.hasNext()) {
            Map.Entry<StockItem, Integer> item = iter.next();
            item.getKey().adjustStock(-item.getValue());
            item.getKey().resetReserve();
            iter.remove();
            System.out.println("You bought " + item.getValue() + " " + item.getKey().getName() + " for $" + (item.getKey().getPrice() * item.getValue()) + ". There are now " + item.getKey().quantityInStock() + " left." );
        }

    }

    public Map<StockItem, Integer> Items() {
        return Collections.unmodifiableMap(list);
    }

    @Override
    public String toString() {
        String s = "\nShopping basket " + name + " contains " + list.size() + ((list.size() == 1) ? " item" : " items") + "\n";
        double totalCost = 0.0;
        for(Map.Entry<StockItem, Integer> item : list.entrySet()) {
            s = s + item.getKey() + ". " + item.getValue() + " purchased\n";
            totalCost += item.getKey().getPrice() * item.getValue();
        }
        return s + "Total cost " + totalCost;
    }
}
