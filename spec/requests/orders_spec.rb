# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/orders", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Order.create! valid_attributes
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get order_url(order)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_order_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get edit_order_url(order)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        post orders_url, params: { order: valid_attributes }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url, params: { order: invalid_attributes }
        }.to change(Order, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post orders_url, params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        patch order_url(order), params: { order: new_attributes }
        order.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the order" do
        order = Order.create! valid_attributes
        patch order_url(order), params: { order: new_attributes }
        order.reload
        expect(response).to redirect_to(order_url(order))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        order = Order.create! valid_attributes
        patch order_url(order), params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete order_url(order)
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete order_url(order)
      expect(response).to redirect_to(orders_url)
    end
  end
end
