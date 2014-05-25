class TestStuffsController < ApplicationController
  before_action :set_test_stuff, only: [:show, :edit, :update, :destroy]

  # GET /test_stuffs
  # GET /test_stuffs.json
  def index
    @test_stuffs = TestStuff.all
  end

  # GET /test_stuffs/1
  # GET /test_stuffs/1.json
  def show
  end

  # GET /test_stuffs/new
  def new
    @test_stuff = TestStuff.new
  end

  # GET /test_stuffs/1/edit
  def edit
  end

  # POST /test_stuffs
  # POST /test_stuffs.json
  def create
    @test_stuff = TestStuff.new(test_stuff_params)

    respond_to do |format|
      if @test_stuff.save
        format.html { redirect_to @test_stuff, notice: 'Test stuff was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_stuff }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_stuffs/1
  # PATCH/PUT /test_stuffs/1.json
  def update
    respond_to do |format|
      if @test_stuff.update(test_stuff_params)
        format.html { redirect_to @test_stuff, notice: 'Test stuff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_stuffs/1
  # DELETE /test_stuffs/1.json
  def destroy
    @test_stuff.destroy
    respond_to do |format|
      format.html { redirect_to test_stuffs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_stuff
      @test_stuff = TestStuff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_stuff_params
      params.require(:test_stuff).permit(:duration)
    end
end
