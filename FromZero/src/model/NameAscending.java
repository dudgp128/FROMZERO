package model;

import java.util.Comparator;

/*Test객체의 name을 기준으로 오름차순 정렬하기*/
public class NameAscending implements Comparator<Product> {
 
    @Override
    public int compare(Product a, Product b) {
        
        String temp1 = a.getProductname();
        String temp2 = b.getProductname();
        
        return temp1.compareTo(temp2);
    }
}