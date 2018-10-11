package com.example.spring05.model.shop.dto;

public class CartDTO {
	private int cart_id;//카트 아이디
	private String userid;//사용자 아이디
	private String name;//사용자 이름
	private int product_id;//제품 아이디
	private String product_name;//제품 이름
	private int price;//제품 단가
	private int money;//제품 금액
	private int amount;//제품 수량
	
	//getter,setter,toString까지만 생성
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", name=" + name + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", price=" + price + ", money=" + money + ", amount=" + amount
				+ "]";
	}

}
