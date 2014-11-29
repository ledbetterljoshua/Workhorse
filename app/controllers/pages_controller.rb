class PagesController < ApplicationController
  def home
  	@drinks = Drink.all
  	@beers = Beer.all
  	@foods = Food.all
  	@addresses = Address.all
  	@emails = Email.all
  	@images = Image.all
  	@jukeboxes = Jukebox.all
  	@phones = Phone.all
  	@reviews = Review.all
  	@menus = Menu.all
  end
  def admin 
    @drinks = Drink.all
    @beers = Beer.all
    @foods = Food.all
    @addresses = Address.all
    @emails = Email.all
    @images = Image.all
    @jukeboxes = Jukebox.all
    @phones = Phone.all
    @reviews = Review.all
    @menus = Menu.all
    @employees = Employee.all

  end 

end
