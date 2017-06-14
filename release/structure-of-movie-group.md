# 建立讨论群的架构
## 目标
1. 讨论群要有“影片”与“简介”
1. 用户可以看到“影片讨论群一览表”

## 步骤
### Step 1. 设计 Group 的 model 架构
1. 输入 `rails g model group title:string description:text`
1. 输入 `rake db:migrate`

解释：每次产生 migration 之后都要运行 `rake db:migrate`

### Step 2. 在 routing 上挂上 groups
填入

** `config/routes.rb`
```
Rails.application.routes.draw do
  root 'welcome#index'

  resources :groups
end
```
### Step 3. 产生 groups controller，定义 index 方法
1. 输入 `rails g controller groups`
1. 填入

** `app/controllers/groups_controller.rb`
```
class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
end
```
### Step 4. 建立 index 的 view
1. 输入 `touch app/views/groups/index.html.erb`
1. 填入

** `app/views/groups/index.html.erb`
```
<div class="col-md-12">
  <div class="group">
    <%= link_to("New Movie Group", new_group_path, class: "btn btn-primary pull-right") %>
  </div>
  <table class="table table-hover">
    <thead>
      <tr>
        <td>#</td>
        <td>Movie's Title</td>
        <td>Description</td>
      </tr>
    </thead>
    <tbody>
      <% @groups.each do |group| %>
        <tr>
          <td>#</td>
          <td><%= link_to(group.title, group_path(group)) %></td>
          <td><%= group.description %></td>
          <td>
              <%= link_to("Edit", edit_group_path(group), class: "btn btn-sm btn-default")%>
              <%= link_to("Delete", group_path(group),    class: "btn btn-sm btn-default",
                          method: :delete, data: { confirm: "Are you sure?" } )%>
          </td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
```
### Step 5. 修改 root page
修改

** `config/routes.rb`
```
Rails.application.routes.draw do
+  root 'groups#index'
-  root 'welcome#index'

  resources :groups
end
```

### Step 6. 添加一些数据
1. 输入 `rails console`
1. 输入 `Group.create(title: "Star Wars 1", description: "Star Wars 1")`
1. 输入 `Group.create(title: "Star Wars 2", description: "Star Wars 2")`
![](https://ws2.sinaimg.cn/large/006tNbRwly1fgknlu614jj30os0ddjvd.jpg)
1. 打开 http://localhost:3000/ 可以看到以下成果
![](https://ws4.sinaimg.cn/large/006tNbRwgy1fgknnllqjej30qc0hzjt1.jpg)
