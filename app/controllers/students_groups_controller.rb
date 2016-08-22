class StudentsGroupsController < ApplicationController
  before_action :set_students_group, only: [:show, :edit, :update, :destroy]

  # GET /students_groups
  # GET /students_groups.json
  def index
    @students_groups = StudentsGroup.all
  end

  # GET /students_groups/1
  # GET /students_groups/1.json
  def show
  end

  # GET /students_groups/new
  def new
    @students_group = StudentsGroup.new
  end

  # GET /students_groups/1/edit
  def edit
  end

  # POST /students_groups
  # POST /students_groups.json
  def create
    @students_group = StudentsGroup.new(students_group_params)

    respond_to do |format|
      if @students_group.save
        format.html { redirect_to @students_group, notice: 'Students group was successfully created.' }
        format.json { render :show, status: :created, location: @students_group }
      else
        format.html { render :new }
        format.json { render json: @students_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_groups/1
  # PATCH/PUT /students_groups/1.json
  def update
    respond_to do |format|
      if @students_group.update(students_group_params)
        format.html { redirect_to @students_group, notice: 'Students group was successfully updated.' }
        format.json { render :show, status: :ok, location: @students_group }
      else
        format.html { render :edit }
        format.json { render json: @students_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_groups/1
  # DELETE /students_groups/1.json
  def destroy
    @students_group.destroy
    respond_to do |format|
      format.html { redirect_to students_groups_url, notice: 'Students group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_group
      @students_group = StudentsGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def students_group_params
      params.require(:students_group).permit(:studenta, :studentb)
    end
end
