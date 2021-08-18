<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String[] name = (String[])request.getAttribute("name");
    int all_price = (int)request.getAttribute("all_price");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>From zero</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; 
        IMP.init('imp39499607'); 
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'From zero 상품 결제',
            amount : <%=all_price%>,
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {

                jQuery.ajax({
                    url: "/payments/complete",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                    }
                }).done(function(data) {
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    }
                });
                location.href='<%=request.getContextPath()%>/myPage.jsp';
            } else {
                msg = '결제에 실패하였습니다.\n';
                msg += '에러내용 : ' + rsp.error_msg;
                location.href="<%=request.getContextPath()%>/shop.jsp";
                alert(msg);
            }
        });
        
    });
    </script>
 
</body>
</html>