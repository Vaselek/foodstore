ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
        
    columns do
      column do
        panel "Recent Orders" do
          ul do
            Order.last(5).map do |order|
              li link_to(order.created_at, admin_order_path(order))
            end
          end
        end
      end

      column do
        panel "Recent shops" do
          ul do
            Shop.last(5).map do |shop|
              li link_to(shop.title, admin_shop_path(shop))
            end
          end
        end
      end

      column do
        panel "Recent users" do
          ul do
            User.last(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end
      
    end
  end
end
