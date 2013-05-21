class TestNumbersController < ApplicationController
  # GET /test_numbers
  # GET /test_numbers.json
  def index
    @app = App.find(params[:app_id])
    @test_numbers = @app.test_numbers

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_numbers }
    end
  end

  # GET /test_numbers/1
  # GET /test_numbers/1.json
  def show
    @test_number = TestNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_number }
    end
  end

  # GET /test_numbers/new
  # GET /test_numbers/new.json
  def new
    @test_number = TestNumber.new
    @test_number.app = App.find(params[:app_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_number }
    end
  end
  
  # GET /test_numbers/1/edit
  def edit
    @test_number = TestNumber.find(params[:id])
  end

  # POST /test_numbers
  # POST /test_numbers.json
  def create
    @test_number = TestNumber.new(params[:test_number])
    @app = App.find(params[:app_id])
    @app.test_numbers << @test_number

    respond_to do |format|
      if @test_number.save
        format.html { redirect_to app_test_numbers_path, notice: 'Test number was successfully created.' }
        format.json { render json: @test_number, status: :created, location: @test_number }
      else
        format.html { render action: "new" }
        format.json { render json: @test_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_numbers/1
  # PUT /test_numbers/1.json
  def update
    @test_number = TestNumber.find(params[:id])

    respond_to do |format|
      if @test_number.update_attributes(params[:test_number])
        format.html { redirect_to app_test_numbers_path, notice: 'Test number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_numbers/1
  # DELETE /test_numbers/1.json
  def destroy
    @test_number = TestNumber.find(params[:id])
    @test_number.destroy

    respond_to do |format|
      format.html { redirect_to app_test_numbers_url }
      format.json { head :no_content }
    end
  end
end
