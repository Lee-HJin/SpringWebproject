<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<table cellpadding="0" cellspacing="0" class="orderTable">
           		<colgroup><col width="55"><col>
           			<col width="92">
           			
           			<col width="92"><col width="72"><col width="92"><col width="90"><col width="40"></colgroup>
           		<tbody><tr>
           			<th colspan="2">상품명</th>
           			
            			<th>수령예상일</th>
           			
           			<th>판매가</th>
           			<th>수량</th>
           			<th>합계</th>
           			<th>담기/삭제</th>   
           			<th><input type="checkbox" id="bandiDeduction" class="checkAll"></th>                			
           		</tr>

           		<tr>
           			<td>
           				<span class="book_img"><img src="http://image.bandinlunis.com/upload/product/4034/4034224_s.jpg" onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type02.gif'"></span> 
           			</td>
           			<td class="prod_name">
           				<span class="block t_14">

          						<a href="/front/product/detailProduct.do?prodId=4034224">[도서]돌이킬 수 없는 약속</a>

           				</span>
           				<span class="block mt3 t_gr">야쿠마루 가쿠 | 북플라자</span>
           				
           			</td>
           			
           			<td id="bandi_deli_term_48116888">
          							2018년<br>10월 13일(토)
           			</td>
           			
           			<td>
           				<strong>13,500원</strong><br>
           				(10%<strong class="point_b">↓</strong>)<br>
           				(<strong class="point_o">P</strong> 750원)
           			</td>
           			
           			<td>
           				<span class="num_c">
           					<input type="text" name="cntVal" id="cntVal_48116888" value="1" class="o_input_num fl_left" size="3" onkeydown="onlyNumber();" onkeyup="cntChange('48116888');" style="text-align:right;ime-mode:disabled;">
        					<span class="num_c_up"><img src="/webproject/resources/images/searchN/btn_num_up.gif" alt="" onclick="cntUp('48116888');" style="cursor:pointer;"></span>
        					<span class="num_c_dn"><img src="/webproject/resources/images/searchN/btn_num_down.gif" alt="" onclick="cntDown('48116888');" style="cursor:pointer;"></span>
        				</span>
       					<img src="/webproject/resources/images/searchN/btn_cart_modify.gif" alt="수정" class="mt5" onclick="updateShopCart(48116888)" style="cursor:pointer;">
        			</td>

        			<td><strong id="costVal_48116888">13,500원</strong></td>  
        			          			
        			<td>
        				<img src="/webproject/resources/images/searchN/btn_cart_wishlist.gif" alt="위시리스트 담기" onclick="add_wish_common('4034224');" style="cursor:pointer;"><br>
        				<img src="/webproject/resources/images/searchN/btn_cart_del.gif" alt="삭제" class="mt5" onclick="deleteShopCart('48116888')" style="cursor:pointer;">
        			</td>

        		</tr>
        	</tbody></table>