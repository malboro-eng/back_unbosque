class GraduatesController < ApplicationController

  def index
    @graduates = User.joins(:graduate)
    json_response = @graduates.map do |user|
      {
      id: user.id,
      name: user.name,
      email: user.email,
      cc: user.cc,
      lastname: user.lastname,
      direccion: user.direccion,
      graduate: {
        faculty: user.graduate.faculty,
        qualification: user.graduate.qualification
      },
      type: user.type
      }
    end
    render json: json_response, status: :ok
  end

  def show
    @user = User.find(params[:id])
    json_response = {
    id: @user.id,
    name: @user.name,
    email: @user.email,
    edad: @user.edad,
    cc: @user.cc,
    lastname: @user.lastname,
    direccion: @user.direccion,
    celular: @user.celular,
    telofono: @user.telefono,
    graduate: {
    faculty: @user.graduate.faculty,
    qualification: @user.graduate.qualification,
    works: @user.graduate.works.map do |work|
    {
     id_trabajo: work.id,
     carge: work.carge,
     company: work.company,
     country: work.country,
     description: work.description,
     date_contract: work.date_contract
    }
    end,
    academic_title: @user.graduate.academic_titles.map do |title|
    {
    id_title: title.id,
    title: title.title,
    institucion: title.institucion,
    country: title.country,
    description: title.description
    }
    end,
    life_history: @user.graduate.life_histories.map do |history|
    {
    id_history: history.id,
    title: history.title,
    description: history.description,
    date: history.date
    }
    end
    }
    }
    render json: json_response , status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end
  private 
  def set_graduate
    @user = User.find(params[:id])
  end

  def graduate_params
    params.require(:graduate).permit(:name,:lastname,:email,:edad,:photo,:cc,:direccion,:celular,:telofono,:password)
  end

end
