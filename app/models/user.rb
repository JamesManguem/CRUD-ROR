# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  lastname   :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates_presence_of   :name, :message => 'Debe ingresar un nombre.'
  validates_presence_of   :lastname, :message => 'Debe ingresar su apellido.'
  validates :email, presence:true,format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ , message:"Formato de correo invalido" }
  validates :phone, presence: true, format: {with: /\A\d{10}\z|\A\d{4}-{1}\d{6}\z/, message: "El numero de telefono debe tener 10 digitos"}
end
