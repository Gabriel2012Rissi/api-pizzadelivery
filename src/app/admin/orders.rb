ActiveAdmin.register Order do
  belongs_to :customer, optional: true
  # Decorator
  decorate_with OrderDecorator

  # Strong parameters
  permit_params :customer_id,
                :total,
                :status,
                order_pizzas_attributes: [:id, :pizza_id, :quantity, :_destroy]

  # Breadcrumbs
  breadcrumb do
    [
      link_to('Admin', admin_root_path),
      link_to('Orders', admin_orders_path)   
    ]
  end

  # Filters
  filter :customer, collection: proc {
    Customer.all.map { |c| [c.decorate.full_name, c.id] } 
  }
  filter :total
  filter :status, as: :select, collection: Order.statuses.keys
  filter :created_at
  
  # Index page
  index do
    selectable_column
    # order id ascending by default
    id_column
    column :customer, sortable: :customer_id do |c|
      c.customer_name
    end
    column :total do |c|
      c.total_formatted
    end
    column :status
    column :created_at do |c|
      c.created_at_formatted
    end
    actions
  end

  # Show page
  show title: :customer_name do
    attributes_table do
      row :id
      row :customer do |r|
        r.customer_name
      end
      row :total do |r|
        r.total_formatted
      end
      row :status
      row :created_at do |r|
        r.created_at_formatted
      end
    end
    panel "Pizzas" do
      table_for order.order_pizzas do
        column :pizza do |c|
          c.pizza.name
        end
        column :pizza_price do |c|
          c.pizza.price_formatted
        end
        column :quantity
        column :subtotal do |c|
          c.subtotal_formatted
        end
      end
    end
  end

  # Form
  form do |f|
    f.inputs "Order Details" do
      f.input :customer, collection: Customer.all.map { |c| [c.decorate.full_name, c.id] }
      f.input :status
      f.input :total, input_html: { disabled: true }
    end
    f.inputs do
      f.has_many :order_pizzas, heading: 'Pizzas', allow_destroy: true do |f|
        f.input :pizza
        f.input :subtotal, input_html: { disabled: true } if f.object.persisted? do |f|
          f.subtotal_formatted
        end
        f.input :quantity
      end
    end
    f.actions
  end
end
