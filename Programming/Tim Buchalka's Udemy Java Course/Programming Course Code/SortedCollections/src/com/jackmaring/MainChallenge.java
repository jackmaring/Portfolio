package com.jackmaring;

public class MainChallenge {

    private static StockList stockList = new StockList();

    public static void main(String[] args) {

        StockItem bread = new StockItem("bread", 0.86, 100);
        stockList.addStock(bread);

        StockItem cake = new StockItem("cake", 1.10, 7);
        stockList.addStock(cake);

        StockItem car = new StockItem("car", 12.50, 2);
        stockList.addStock(car);

        StockItem chair = new StockItem("chair", 62.00, 10);
        stockList.addStock(chair);

        StockItem cup = new StockItem("cup", 0.50, 200);
        stockList.addStock(cup);

        StockItem door = new StockItem("door", 72.95, 4);
        stockList.addStock(door);

        StockItem juice = new StockItem("juice", 2.50, 36);
        stockList.addStock(juice);

        StockItem phone = new StockItem("phone", 96.99, 35);
        stockList.addStock(phone);

        StockItem towel = new StockItem("towel", 2.40, 80);
        stockList.addStock(towel);

        StockItem vase = new StockItem("vase", 8.76, 40);
        stockList.addStock(vase);


        Basket jacksBasket = new Basket("Jack's Basket");
        jacksBasket.addToBasket(bread, 40);
        jacksBasket.addToBasket(phone, 30);

    }

}
