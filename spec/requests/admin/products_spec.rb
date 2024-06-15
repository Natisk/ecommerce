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

RSpec.describe "/admin/products", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Product.create! valid_attributes
      get admin_products_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get admin_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_product_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get edit_admin_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Product" do
        expect {
          post admin_products_url, params: { admin_product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created admin_product" do
        post admin_products_url, params: { admin_product: valid_attributes }
        expect(response).to redirect_to(admin_product_url(Product.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product" do
        expect {
          post admin_products_url, params: { admin_product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_products_url, params: { admin_product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_product" do
        product = Product.create! valid_attributes
        patch admin_product_url(product), params: { admin_product: new_attributes }
        product.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_product" do
        product = Product.create! valid_attributes
        patch admin_product_url(product), params: { admin_product: new_attributes }
        product.reload
        expect(response).to redirect_to(admin_product_url(product))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        patch admin_product_url(product), params: { admin_product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_product" do
      product = Product.create! valid_attributes
      expect {
        delete admin_product_url(product)
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the admin_products list" do
      product = Product.create! valid_attributes
      delete admin_product_url(product)
      expect(response).to redirect_to(admin_products_url)
    end
  end
end
