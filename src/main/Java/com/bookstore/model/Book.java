package com.bookstore.model;

public class Book {
    private int bookId;
    private String title;
    private int price;
    private String bookType;
    private String cover;

    public Book(){

    }

    public Book(int bookId, String title, int price, String bookType, String cover, String description, String author, String press) {
        this.bookId = bookId;
        this.title = title;
        this.price = price;
        this.bookType = bookType;
        this.cover = cover;
        this.description = description;
        this.author = author;
        this.press = press;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    private String description;
    private String author;
    private String press;

}