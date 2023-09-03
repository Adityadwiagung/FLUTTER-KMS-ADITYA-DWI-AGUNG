abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  @override
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return (side * side);
  }

  @override
  int getPerimeter() {
    return (4 * side);
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.width, this.height);

  @override
  int getArea() {
    return (width * height);
  }

  @override
  int getPerimeter() {
    return (2 * (width + height));
  }
}

void main() {
  Circle circle = Circle(5);
  Square square = Square(4);
  Rectangle rectangle = Rectangle(6, 8);

  print("Luas dan Keliling Lingkaran:");
  print("Luas: ${circle.getArea()}");
  print("Keliling: ${circle.getPerimeter()}");
  print("");

  print("Luas dan Keliling Persegi:");
  print("Luas: ${square.getArea()}");
  print("Keliling: ${square.getPerimeter()}");
  print("");

  print("Luas dan Keliling Persegi Panjang:");
  print("Luas: ${rectangle.getArea()}");
  print("Keliling: ${rectangle.getPerimeter()}");
}
