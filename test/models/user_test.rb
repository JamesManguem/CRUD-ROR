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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new(lastname:'algo', email:'capitanmanguem@gmail.com', phone:'0123456789')
    assert_not user.save, "Debes Ingresar un nombre de usuario"
  end

  test "should not save user without lastname" do
    user = User.new(name:'algo', email:'capitanmanguem@gmail.com', phone:'0123456789')
    assert_not user.save, "Debes Ingresar el apellido del usuario"
  end

  test "should not save user without email" do
    user = User.new( name:'algo', lastname:'algo', phone:'0123456789')
    assert_not user.save, "Debes Ingresar un correo"
  end

  test "should not save user without a valid email format" do
    user = User.new(name:'algo', lastname:'algo', email:'capitanmanguemgmail.com', phone:'0123456789')
    assert_not user.save, "Debes Ingresar con formato valido"
  end

  test "should not save user without a phone number" do
    user = User.new(name:'algo', lastname:'algo', email:'capitanmanguem@gmail.com')
    assert_not user.save, "Debes Ingresar un numero telefonico"
  end

  test "should not save user without a phone number with ten digits" do
    user = User.new(name:'algo', lastname:'algo', email:'capitanmanguem@gmail.com' , phone:"123456789")
    assert_not user.save, "Debes Ingresar un numero telefonico a 10 digitos"
  end

  test "should save a user" do
    user = User.new(name:'algo', lastname:'algo', email:'capitanmanguem@gmail.com' , phone:"0123456789")
    assert user.save, "Usuario Guardado Correctamente"


  end
end
