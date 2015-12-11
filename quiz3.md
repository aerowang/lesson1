1. 請解釋 ```database.yml```, ```routes.rb```, 和 ```Gemifle``` 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？
  database.yml # 設定資料庫的組態的yml檔案
  routes.rb    # 當使用者連線到網址,設定路由規則的檔案
  gemfile      # 設定專案中使用到的gem套件的檔案

2. MVC 架構裡的 M, V, 和 C 分別代表什麼？ 
Model # 與資料庫溝通的東西
View, # 呈獻給使用者看的HTML檔案
Controller # 負責接收前端來的請求,所做出對應的action
撰寫原則： Skinny Controller, Fat Model

3. 請解釋 CRUD 是哪四個字的縮寫？  
  Create(新建資料), 
  Read(讀取資料), 
  Update(更新資料), 
  Delete(刪除資料)

4. 請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入```http://localhost:3000/rails/info/routes```)
	```ruby
	resources :users
	```
  /users/
  /users/new
  /users/:id/edit
  /orders/:id
  
  
5. 請解釋 model 檔案和 migration 檔案的差別
	model: 
  ```ruby
  class Order < ActiveRecord::Base
    def self.calculate_tax(amount)
      tax = amount * 0.05
    end
  end
  ```
  migration: 更改新增資料表裡面的欄位
  ```ruby
  class AddUsersTable < ActiveRecord::Migration
    def change
      create_table :users do |t|
        t.string :name
        t.string :description
        t.integer :age
  
        t.timestamps
      end
    end
  end
  ```

6. 若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration? 
  $ rake db:rollback
  
7. 假設今天
	* 我要在資料庫裡產出一個叫 group 的資料表
	* 裡面包括的欄位名稱和相對應的資料型別是： 
		**name (string)**,
		**description (text)**,
		**members (integer)**
    * 請寫出一個能產生出以上需求的 migration 檔
  ```ruby
	class CreateGroups < ActiveRecord::Base
    def change
    	create_table :groups do |t|
        t.string :name
        t.text :description
        t.integer :members
        
        t.timestamps
      end
    end
  end
  ```
  don't forget comment
  $ rake db:migrate

8. 請解釋什麼是 ActiveRecord?
  model. migration file繼承的父類別
  Rails讓使用者們可以不用自己下SQL語法
  幫使用者把ruby語言翻成SQL語法
  rails底下的ORM功能
