package com.studentproject.model;
/**
 * Student Model Class (POJO - Plain Old Java Object)
 * This class represents a student entity in the system.
 * It maps directly to the 'students' table in the database.
 * OOP Concepts Used:
 * - Encapsulation: Private fields with public getters/setters
 * - Constructors: Default + Parameterized constructors
 * - toString Override: Polymorphism
 */
public class Student {
    private int id;         
    private String name;    
    private double marks;   
    public Student() {
    }
    public Student(int id, String name, double marks) {
        this.id = id;
        this.name = name;
        this.marks = marks;
    }
    public Student(String name, double marks) {
        this.name = name;
        this.marks = marks;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getMarks() {
        return marks;
    }
    public void setMarks(double marks) {
        this.marks = marks;
    }
    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", marks=" + marks + "]";
    }
}
