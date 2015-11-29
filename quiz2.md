1. 請用簡單的方式敘述以下每一行程式碼：
  ```ruby 
  a = 1 # local variable
  @a = 2 # instance variable
  @@a = 5 # class static variable
  user = User.new # new a User object assign to the variable named user
  user.name # use getter method to get the value/attribute of object
  user.name = "Joe" # use setter method to set the value/attribute to "Joe"
  ```
  
2. 什麼是 module? 請寫一段程式碼說明一個 class 要如何使用一個 module 裡面的 method?
把常用的方法都先實作存放的地方, 可以想像成一個工具箱
  ```ruby 
  module Sentence
    def say_hello
      puts "hello"
    end
  end

  class Human
    include Sentence
  end

  arumin = Human.new
  arumin.say_hello
  ```

3. 請說明 class 和 instance variable 之間的差別
  使用class variable時並不需要new一個實體即可呼叫
  而使用getter取得instance variable時必須先new出一個物件

4. 如果今天我為一個叫 User 的 class 產生一個新物件的方式是: 
  ```ruby
  User.new("Bob", "male", "Engineer")
  ```
  請寫出 User class 的 initialize method
  ```ruby
  class User
    attr_accessor :name, :gender, :job
    
    def initialize(name, gender, job)
      @name = name
      @gender = gender
      @job = job
    end
  end

  eren = User.new("Eren", "male", "Soldier")
  puts eren.name
  puts eren.gender
  puts eren.job 
  ```


5. self 在：
  a. class 裡，method 外面
  b. class 裡，instance method 裡
  分別是指向什麼?
  a. 代表該模板(class)本身的變數與方法
  b. 屬於被實體化的物件(object/instance)本身的變數與方法

6. attr_accessor 的功能是什麼
  讓ruby代勞自動產生instance varaible, 以及其getter與setter

7. 請說明 public 和 private method 之間的不同
  public method可直接被外部實體物件使用dot存取
  而private method僅能被class內部的其他method存取
  外部實體物件若想存取必須透過其他public method的幫忙
  
8. Ruby 是如何確保一個 module 的 method 會被 include 它的 class 使用到？ (提示：method lookup)
  ```ruby
  puts Titan.ancestors
  ```
  使用.ancestors印出祖宗十八代查看module的名稱有沒有在繼承鏈中
