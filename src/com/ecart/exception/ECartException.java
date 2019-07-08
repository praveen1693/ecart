package com.ecart.exception;

public class ECartException extends Exception{
	
	private String details;
	
	public ECartException(String details) {
		super();
		this.details = details;
	}

	public String getDetails() {
		return details;
	}
}
