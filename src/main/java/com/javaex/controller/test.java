package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class test {
	
	@RequestMapping("")
	public String bookDetail() {
		System.out.println("main");
		
		return "main/main";
	}
	
	@RequestMapping("/analyze")
	public String analyze() {
		System.out.println("user_analyze");
		
		return "analyze/user_analyze";
	}
	
	@RequestMapping("/bookdetail")
	public String bookdetail() {
		System.out.println("book_detail");
		
		return "book_detail/book_detail";
	}
	
	@RequestMapping("/mybook")
	public String mybook() {
		System.out.println("mybook");
		
		return "mybook/mybook_review";
	}
	
	@RequestMapping("/imgpreview")
	public String imgpreview() {
		System.out.println("image_preview");
		
		return "mybook/image_preview";
	}
	
	@RequestMapping("/review_write")
	public String review_write() {
		System.out.println("review_write");
		
		return "review_write/review_write";
	}
	
	@RequestMapping("/taste_main")
	public String taste_main() {
		System.out.println("taste_main");
		
		return "taste/taste-main";
	}
	
	@RequestMapping("/click_playlist")
	public String click_playlist() {
		System.out.println("click_playlist");
		
		return "taste/click-playlist";
	}
	
	@RequestMapping("/like_playlist")
	public String like_playlist() {
		System.out.println("like_playlist");
		
		return "taste/like-playlist";
	}
	
	@RequestMapping("/main_book")
	public String main_book() {
		System.out.println("main_book");
		
		return "taste/main-book";
	}
	
	@RequestMapping("/playlist_edit")
	public String playlist_edit() {
		System.out.println("playlist_edit");
		
		return "taste/playlist_edit";
	}
	
	@RequestMapping("/playlist")
	public String playlist() {
		System.out.println("playlist");
		
		return "taste/playlist";
	}
	
	@RequestMapping("/review")
	public String review() {
		System.out.println("review");
		
		return "taste/review";
	}
	
	@RequestMapping("/recommend_playlist")
	public String recommend() {
		System.out.println("recommend");
		return "taste/recommend_playlist";
	}
	
	@RequestMapping("/hot_playlist")
	public String hot() {
		System.out.println("hot_playlist");
		return "taste/hot_playlist";
	}
	
	@RequestMapping("/written_playlist")
	public String written() {
		System.out.println("written_playlist");
		return "taste/written_playlist";
	}
	
}
