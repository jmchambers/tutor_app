class TutorshipsController < ApplicationController
  before_action :set_tutorship, only: [:show, :edit, :update, :destroy]

  # GET /tutorships
  # GET /tutorships.json
  def index
    @tutorships = Tutorship.all
  end

  # GET /tutorships/1
  # GET /tutorships/1.json
  def show
  end

  # GET /tutorships/new
  def new
    @tutorship = Tutorship.new
  end

  # GET /tutorships/1/edit
  def edit
  end

  # POST /tutorships
  # POST /tutorships.json
  def create
    @tutorship = Tutorship.new(tutorship_params)

    respond_to do |format|
      if @tutorship.save
        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully created.' }
        format.json { render :show, status: :created, location: @tutorship }
      else
        format.html { render :new }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorships/1
  # PATCH/PUT /tutorships/1.json
  def update
    respond_to do |format|
      if @tutorship.update(tutorship_params)
        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorship }
      else
        format.html { render :edit }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorships/1
  # DELETE /tutorships/1.json
  def destroy
    @tutorship.destroy
    respond_to do |format|
      format.html { redirect_to tutorships_url, notice: 'Tutorship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorship
      @tutorship = Tutorship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorship_params
      params.require(:tutorship).permit(:tutor_id, :student_id, :accepted, :created_by_student, :message, :subject_id)
    end
end
