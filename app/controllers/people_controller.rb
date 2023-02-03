class PeopleController < ApplicationController 
  before_action :find_person, only: [:show, :edit, :update, :destroy]
  def index
    @persons = Person.all
  end

  def show
  end

  def new
    @person = Person.new 
  end

  def create
    @person = Person.new(person_params)
    @person.save 
    redirect_to people_path
  end

  def edit 

  end

  def update
    @person.update(person_params) 
    redirect_to people_path
  end
  
  def destroy
    @person.destroy
    redirect_to people_path
  end

  private

  def find_person
    @person = Person.find_by_id(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :age, :address)
  end
end