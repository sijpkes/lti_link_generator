class BasicLtiKeysController < ApplicationController
  before_action :set_basic_lti_key, only: [:show, :edit, :update, :destroy]

  # GET /basic_lti_keys
  # GET /basic_lti_keys.json
  def index
    @basic_lti_keys = BasicLtiKey.all
  end

  # GET /basic_lti_keys/1
  # GET /basic_lti_keys/1.json
  def show
  end

  # GET /basic_lti_keys/new
  def new
    @basic_lti_key = BasicLtiKey.new
  end

  # GET /basic_lti_keys/1/edit
  def edit
  end

  # POST /basic_lti_keys
  # POST /basic_lti_keys.json
  def create
    @basic_lti_key = BasicLtiKey.new(basic_lti_key_params)

    respond_to do |format|
      if @basic_lti_key.save
        format.html { redirect_to @basic_lti_key, notice: 'Basic lti key was successfully created.' }
        format.json { render :show, status: :created, location: @basic_lti_key }
      else
        format.html { render :new }
        format.json { render json: @basic_lti_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_lti_keys/1
  # PATCH/PUT /basic_lti_keys/1.json
  def update
    respond_to do |format|
      if @basic_lti_key.update(basic_lti_key_params)
        format.html { redirect_to @basic_lti_key, notice: 'Basic lti key was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic_lti_key }
      else
        format.html { render :edit }
        format.json { render json: @basic_lti_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_lti_keys/1
  # DELETE /basic_lti_keys/1.json
  def destroy
    @basic_lti_key.destroy
    respond_to do |format|
      format.html { redirect_to basic_lti_keys_url, notice: 'Basic lti key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_lti_key
      @basic_lti_key = BasicLtiKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_lti_key_params
      params.require(:basic_lti_key).permit(:title, :body)
    end
end
