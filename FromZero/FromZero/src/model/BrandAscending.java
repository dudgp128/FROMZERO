package model;

import java.util.Comparator;

public class BrandAscending implements Comparator<Product> {
	 
    @Override
    public int compare(Product a, Product b) {
    	String temp1 = a.getBrand();
    	String temp2 = b.getBrand();
        
        return temp1.compareTo(temp2);
    }
}