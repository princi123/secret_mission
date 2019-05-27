class SecretCodesController < ApplicationController
	before_action :find_secret_code, only: [ :destroy]

	def index
		@secret_codes = SecretCode.all
		@secret_code = SecretCode.new
		begin
			authorize! :index, @secret_code
		rescue CanCan::AccessDenied
			  flash[:warning] = "You are not authorized"
			  redirect_to root_path
		end
	end


	def new
		code = (0...8).map { (65 + rand(26)).chr }.join.downcase
		@secret_code = SecretCode.create(code: code)
		redirect_to secret_codes_path, notice: "Secret code was successfully created"
	end

	#to save codes in bulk
	def bulk_code
		SecretCode.create_bulk_codes(params[:secret_code][:bulk_number])
		redirect_to secret_codes_path, notice: "Secret code was successfully created"
	end


  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
	def secret_code_params
		params.require(:secret_code).permit(:code, :user_id)
	end

	def find_secret_code
		@secret_code = SecretCode.find_by(id: params[:id])
	end

end
