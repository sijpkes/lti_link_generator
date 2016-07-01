class BasicLtiKeysController < ApplicationController
  before_action :set_basic_lti_key, only: [:show, :edit, :update, :destroy]

  def index
    @test_var = BasicLtiKey.first
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
