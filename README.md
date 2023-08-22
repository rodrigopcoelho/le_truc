Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.



 <div class="d-flex product-card-container">
    <% @products.each do |product| %>

      <div class="card product-card" style="width: 18rem;">

        <div class="product-content">
          <%= image_tag "https://images.unsplash.com/photo-1515773512591-dfaf9e052325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80", class:"img-thumbnail" %>

          <div class="card-body product-card-body">
            <h5 class="card-title"><%= product.name %></h5>
            <div class="card-details d-flex">
              <p class="card-text flex-grow-1"><%= product.price %> <i class="fa-solid fa-coins"></i></p>
              <%= link_to "Rent!", products_path, class:"btn btn-rent" %>
              <%# <i class="fa-solid fa-cart-plus"></i> ver se da para alterar %>
            </div>
          </div>
        </div>
        <%# <div class="card-footer card-footer-color">
          <small class="text-muted">Avaible</small>
        </div> %>
      </div>
    <% end %>
  </div>



<div class="icons-container">
    <ul class="icons-list">
    <%# não está a alinhar %>
      <div class="icon-card">
        <li><i class="fa-solid fa-border-all fa-2xl"></i></li>
        <li>All</li>
      </div>
      <div class="icon-card">
        <li><i class="fa-solid fa-table-tennis-paddle-ball fa-2xl"></i></li>
        <li>Leisure</li>
      </div>
      <div class="icon-card">
        <li><i class="fa-solid fa-utensils fa-2xl"></i></li>
        <li>Lunch</li>
      </div>
      <div class="icon-card">
        <li><i class="fa-solid fa-laptop-code fa-2xl"></i></li>
        <li>Work</li>
      </div>
    </ul>

  </div>
