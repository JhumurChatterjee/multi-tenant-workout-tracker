class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_tenant
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end
end
