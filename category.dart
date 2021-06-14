import 'package:flutter/material.dart';

class myCategory {
  myCategory(String des, String url) {
    this.url = url;
    this.des = des;
  }
  String url;
  String des;
}

List<myCategory> getcategory() {
  List<myCategory> list = [];

  myCategory general = myCategory("Headlines",
      "https://images.unsplash.com/photo-1521295121783-8a321d551ad2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");

  list.add(general);

  myCategory science = myCategory("Science & Tech",
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80");

  list.add(science);

  myCategory fitness = myCategory("Health & Fitness",
      "https://images.unsplash.com/photo-1577221084712-45b0445d2b00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=343&q=80");

  list.add(fitness);

  myCategory finance = myCategory("Business",
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80");

  list.add(finance);

  myCategory fashion = myCategory("Entertainment",
      "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80");

  list.add(fashion);

  myCategory sports = myCategory("Sports",
      "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1167&q=80");
  list.add(sports);

  return list;
}
