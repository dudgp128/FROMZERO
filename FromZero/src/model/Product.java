package model;

import java.util.Comparator;

public class Product {
	String productid;
	String productname;
	String brand;
	int price;
	String big_category;
	String small_category;
	String img;

	public Product(String productid, String productname, String brand, int price, String big_category,
			String small_category, String img) {
		this.productid = productid;
		this.productname = productname;
		this.brand = brand;
		this.price = price;
		this.big_category = big_category;
		this.small_category = small_category;
		this.img = img;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBig_category() {
		return big_category;
	}

	public void setBig_category(String big_category) {
		this.big_category = big_category;
	}

	public String getSmall_category() {
		return small_category;
	}

	public void setSmall_category(String small_category) {
		this.small_category = small_category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}



 
