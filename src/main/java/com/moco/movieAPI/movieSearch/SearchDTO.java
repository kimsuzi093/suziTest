package com.moco.movieAPI.movieSearch;

public class SearchDTO {
	private String name;
	private String genre;
	private int yearMin;
	private int yearMax;
	private String director;
	private String actor;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getYearMin() {
		return yearMin;
	}
	public void setYearMin(int yearMin) {
		this.yearMin = yearMin;
	}
	public int getYearMax() {
		return yearMax;
	}
	public void setYearMax(int yearMax) {
		this.yearMax = yearMax;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	
}
