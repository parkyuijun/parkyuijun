package com.hk.utils;

import java.util.HashMap;
import java.util.Map;

public class Paging {
	
	//pageEndNum : 페이지 그룹의 마지막 번호
	//prePageNum : 전페이지의 첫번호
	//nextPageNum : 다음페이지의 마지막 번호
	//startPage : 시작페이지 번호
	//endPage : 끝페이지 번호
	//pcount : 총페이지의 수
	//pNum : 현재 보여줄 페이지 번호
	//pageRange : 한번에 보여줄 페이지 범위
	
	public static Map<String, Integer> pagingValue(int pcount, String pNum, int pageRange){
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		int pNumber=Integer.parseInt(pNum);
		//페이지들을 5개씩 페이징처리를 위해
		//1234(5)  6789(10)  : 페이지 번호를 받아 해당 페아지의 마지막 페이지 번호를 구함
		int pageEndNum=((pNumber-1)/pageRange+1)==1?pageRange:(((pNumber-1)/pageRange+1)*pageRange); 
		//      			8-1= 7/5 = 1+1 = 2 ==1?false ---------> 8  - 1 /     5   +1 * 5 ==>
		int prePageNum=pageEndNum-pageRange==0?1:pageEndNum-pageRange; // 결과 : 5
		int nextPageNum=pageEndNum>=pcount?pcount:pageEndNum+1;
		//					10		  20		 : 10 + 1 = 11     결과 : 11
		//	여기까지 결과값 -->  5< 6 7 8 9 10 >11
		
		// 페이지 번호를 출력할 시작페이지와 마지막 페이지 번호 구하기(페이지 출력할 범위)
		int startPage=pageEndNum-(pageRange-1);  //6
		int endPage=pageEndNum>pcount?pcount:pageEndNum;  //10
		
		map.put("prePageNum", prePageNum);
		map.put("nextPageNum",nextPageNum);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		System.out.println("pcount:"+pcount);
		System.out.println("pageEndNum:"+pageEndNum);
		System.out.println("prePageNum:"+prePageNum);
		System.out.println("nextPageNum:"+nextPageNum);
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		return map;
	}
}
