# 建立新项目
## 目标
建立一个新的 Rails 项目 movie-review

## 步骤
### Step 1. 确认 Ruby 版本
输入 `ruby -v`
![](https://ws4.sinaimg.cn/large/006tKfTcgy1fgio3nmk1nj30lc0190tr.jpg)
确认一下现在的 Ruby 版本。这个项目用的 Ruby 版本是 ruby-2.3.1

### Step 2. 确认 Rails 版本
输入 `rails -v`
![](https://ws1.sinaimg.cn/large/006tKfTcly1fgio9110fej30ox018aa1.jpg)

### Step 3. 进入 Public 文件夹，建立一个新 Rails 项目 movie-review
1. 输入 `cd Public`
1. 输入 `rails new movie-review`
![](https://ws4.sinaimg.cn/large/006tKfTcgy1fgioags6a0j30os0e3tbm.jpg)

### Step 4. 进入新建好的项目, 并建立 git 做版本控制
1. 输入 `cd movie-review`
1. 输入 `git init`
1. 输入 `git add .`
1. 输入 `git commit -m "initial commit"`
![](https://ws3.sinaimg.cn/large/006tKfTcly1fgioggjwb5j30ot0e8adu.jpg)

# 给项目应用 Bootstrap
## 目标
给项目应用 Bootstrap

## 步骤
### Step 0. git checkout -b develop, 把项目推送到 GitHub
1. 输入 `git checkout -b develop`
1. 打开 GitHub，点击 New repository 新建项目 movie-review，复制命令
1. 打开终端，粘贴 `git remote add origin https://github.com/lbias/movie-review.git
  git push -u origin master` (注意每人的 GitHub 用户名不同)
  ![](https://ws3.sinaimg.cn/large/006tKfTcgy1fgiora5v2tj30oq072dhg.jpg)
1. 刷新 GitHub 页面，即可看到有内容被推送上去
![](https://ws2.sinaimg.cn/large/006tKfTcly1fgiov2k0oqj30qd0nhacl.jpg)

### Step 1. 给项目安装 Bootstrap，挂上 bootstrap-sass 这个 gem
1. 在终端输入 `atom .`
1. 打开atom编辑器，再打开 Gemfile 这个文件
1. 修改 Gemfile，在 `group :development, :test do` 前一行加入 `gem 'bootstrap-sass'`

填入

 ** `Gemfile`
```
gem 'bootstrap-sass'
```
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fgip28ugo0j30mj04w3zp.jpg)

### Step 2. bundle install
输入 `bundle install`
(注意：每次修改完 Gemfile 都记得要 command + s 保存 ，然后执行 bundle install，然后重启 server：先 control + c 退出 server，然后输入 `rails s` 启动 server）

### Step 3. 将 Bootstrap 的 CSS 套件装进项目里面
1. 输入 `mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss`
将 application.css 更名为 application.scss

1. 然后修改内容加入这两行  
填入

** `app/assets/stylesheets/application.scss`

```
/*
 * ...(一堆注解)
 *= require_tree .
 *= require_self
 */

@import "bootstrap-sprockets";
@import "bootstrap";
```
![](https://ws2.sinaimg.cn/large/006tKfTcgy1fgipa112yhj30mm044wew.jpg)

# 套用 Bootstrap 的 html 样式
## 目标
让整个项目的 HTML 架构，套用 Bootstrap

## 步骤
### Step 1. 新增 app/views/common 文件夹
输入 `mkdir app/views/common`

### Step 2. 新增 navbar
1. 输入 `touch app/views/common/_navbar.html.erb`
1. 填入

** `app/views/common/_navbar.html.erb`
```
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Movie Review</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <%= link_to("Log In", '#') %>
        </li>
      </ul>
    </div>
  </div>
</nav>
```
![](https://ws3.sinaimg.cn/large/006tKfTcly1fgiprzl7rlj30mf0acwg6.jpg)

### Step 3. 新增 footer
1. 输入 `touch app/views/common/_footer.html.erb`
1. 填入

** `app/views/common/_footer.html.erb`
```
<footer class="container" style="margin-top: 100px;">
  <p class="text-center">Copyright ©2017 Movie Review
    <br>Designed by
    <a href="https://github.com/lbias/movie-review" target=_new>lbias</a>
  </p>
</footer>
```
![](https://ws3.sinaimg.cn/large/006tKfTcly1fgipul4d6ij30mh04sq3z.jpg)

### Step 4. 修改全域 HTML 样式 application.html.erb
填入

** `app/views/layouts/application.html.erb`
```
<!DOCTYPE html>
<html>
  <head>
    <title>Movie Review</title>
    <%= csrf_meta_tags %>
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <div class="container-fluid">
      <%= render "common/navbar" %>
      <%= yield %>
    </div>
    <%= render "common/footer" %>
  </body>
</html>
```
![](https://ws2.sinaimg.cn/large/006tKfTcly1fgipyvgx8bj30mn07lgmf.jpg)

### Step 5. 产生一个新的空 Welcome 页面 （放在 welcome#index)
1. 输入 `rails g controller welcome`
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fgiq3585ltj30os088mym.jpg)
1. 输入 `touch app/views/welcome/index.html.erb`
1. 填入

** `app/views/welcome/index.html.erb`
```
<h1> Welcome to Movie Review! </h1>
```
![](https://ws1.sinaimg.cn/large/006tKfTcly1fgiq5eoyqzj30mk01mt8q.jpg)

### Step 6. 将首页指到 welcome 下的 index.html.erb 页面
填入

** `config/routes.rb`
```
  root 'welcome#index'
```
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fgiq81soglj30me02rgls.jpg)

### Step 7. 运行 Rails Server
1. 输入 `rails s`
2. 打开浏览器，进入 localhost:3000
![](https://ws4.sinaimg.cn/large/006tKfTcly1fgiqbdpr7fj30qb0chmy7.jpg)


# 制作漂亮的“提示信息”
## 目标
利用 Bootstrap 内建的特效，建立“提示信息”

## 步骤
### Step 1. 将 Bootstrap 的 js 提示套件 bootstrap/alert “挂”进项目里面
填入

** `app/assets/javascripts/application.js`
```
... (一堆注解)
//= require jquery
//= require jquery_ujs
//= require turbolinks
+//= require bootstrap/alert
//= require_tree .
```
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fgiqwt6ve2j30mh049dg7.jpg)

解释：+号在这里是新增一行代码的意思，不用复制贴上这个+号本身，只要粘贴后面的代码就可以了
### Step 2. 新增 app/views/common/_flashes.html.erb
1. 输入 `touch app/views/common/_flashes.html.erb`

1. 填入

** `app/views/common/_flashes.html.erb`
```
<% if flash.any? %>
  <% user_facing_flashes.each do |key, value| %>
    <div class="alert alert-dismissable alert-<%= flash_class(key) %>">
      <button class="close" data-dismiss="alert">×</button>
      <%= value %>
    </div>
  <% end %>
<% end %>
```
### Step 3. 加入 app/helpers/flashes_helper.rb
1. 输入 touch app/helpers/flashes_helper.rb

1. 填入

** `app/helpers/flashes_helper.rb`
```
module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
end
```

### Step 4. 在 application.html.erb 内加入 flash 这个 partial
在 <%= yield %> 前加入 <%= render "common/flashes" %>

填入  

** `app/views/layouts/application.html.erb`
```
<%= render "common/flashes" %>
<%= yield %>
```
### Step 5: 测试 flash helper 的功能
填入

** `app/controllers/welcome_controller.rb`
```
class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good Morning!"
  end
end
```
![](https://ws4.sinaimg.cn/large/006tNbRwgy1fgiv7zzi15j30qb0dvdgt.jpg)
