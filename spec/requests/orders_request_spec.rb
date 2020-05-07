require 'rails_helper'

RSpec.describe "Orders", type: :request do

	describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 5, customer: FactoryBot.create(:customer))
      get orders_path
      expect(response.status).to eq(200)
    end
  end
  
    describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order, customer: FactoryBot.create(:customer))
      get order_path(id: order.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the order is invalid" do
      get order_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to orders_path
    end
  end

   describe "get new_order_path" do
    it "renders the :new template" do
      FactoryBot.create_list(:order, 2, customer: FactoryBot.create(:customer))
      get new_order_path
      expect(response.status).to eq(200)
   end
end
  
  describe "get edit_order_path" do
    it "renders the :edit template" do 
    order = FactoryBot.create(:order, customer: FactoryBot.create(:customer))
    get edit_order_path(id: order.id)
    expect(response.status).to eq(200)
  end
end 
####################
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes[:customer] = FactoryBot.create(:customer)
      expect {post orders_path, {order: order_attributes}}.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
######################
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order, customer: FactoryBot.create(:customer))
      order_attributes.delete(:product_name)
      expect { post orders_path, {order: order_attributes, customer: order_attributes}
    }.to_not change(Order, :count)
      expect(response.status).to eq(200)
    end
  end

  describe "put order_path with valid data" do
         it "updates an entry and redirects to the show path for the order" do
            order = FactoryBot.create(:order, product_count: 10, customer: FactoryBot.create(:customer))
            expect(order.product_count).to eq(10)
            put order_path(order), {order: {product_count: 20}}
            order.reload
            expect(order.product_count).to eq(20)
         end
  end

  describe "put order_path with invalid data" do
         it "does not update the order record or redirect" do
           order = FactoryBot.create(:order, customer: FactoryBot.create(:customer))
           put order_path(id: order.id),params:{order:{product_count:"d"}}
           order.reload
           expect(order.product_count).to_not eq("d")
           expect(response.status).to eq(200)
         end
  end

  describe "delete an order record" do
         it "deletes an order record" do
            order = FactoryBot.create(:order, customer: FactoryBot.create(:customer))
            delete order_path(order.id)
            expect change(Order, :count).from(1).to eq(0)
            expect(response.status).to eq(302)
         end
  end

end 
