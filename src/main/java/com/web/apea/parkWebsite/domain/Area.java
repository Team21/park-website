package com.web.apea.parkWebsite.domain;

public class Area {

    private Integer id;
    private String name;
    private String description;

    public Area(Integer id, String name) {
        this.id = id;
        this.name = name;
        description = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getId() {
        return id;
    }
}