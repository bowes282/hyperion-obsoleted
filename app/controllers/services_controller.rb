class ServicesController < ApplicationController
  def index
    @services = Service.all
    @dangling_hosts = Host.dangling_hosts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  def show
    @service = Service.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  def new
    @service = Service.new
    set_return_to

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  def edit
    @service = Service.find_by_name(params[:id])
  end

  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        set_toast message: 'Service was successfully created.'

        format.html { return_to_or @service }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @service = Service.find_by_name(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        set_toast message: 'Service was successfully updated.'

        format.html { redirect_to @service }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find_by_name(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end
