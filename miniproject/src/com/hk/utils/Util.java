package com.hk.utils;

public class Util {

	//action tag: 
	//      <usebean>  :  값을 담고 꺼내는 객체를 사용할때 쓰임 --> Dto형식으로 만들어야 함
	private String arrowNbsp;//depth의 크기만큼 공백만드는 필드
	                         //"&nbsp;&nbsp;&nbsp;<img >"

	//<setProperty> : setMethod를 실행한다.
	public void setArrowNbsp(String depth) {
		String nbsp="";
		int depthInt=Integer.parseInt(depth);
		for (int i = 0; i < depthInt; i++) {
			nbsp+="&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		//                답글이면 nbsp+<img> 출력: 부모글이면 ""
		this.arrowNbsp = (depthInt>0?nbsp+"<img src='img/arrow.png' alt='답글'/>":"");
	}
	//<getPropery> : getMethod를 실행하면서 html에 값을 출력
	public String getArrowNbsp() {
		return arrowNbsp;
	}

	
	
}
