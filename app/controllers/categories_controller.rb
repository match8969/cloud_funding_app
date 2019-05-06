class CategoriesController < ApplicationController
    def index
     
    end
    
    def show
        @category = Category.find_by(id: params[:id])
    end

    def new
        @category = Category.new
    end
    
    def edit
    end
    
    def create
        @category = Category.new(category_params)

        respond_to do |format|
            if @category.save
              format.html { redirect_to @category, notice: 'Category was successfully created.' }
              format.json { render :show, status: :created, location: @category }
            else
              format.html { render :new }
              format.json { render json: @category.errors, status: :unprocessable_entity }
            end
          end
    end
    
      # PATCH/PUT /categorys/1
      # PATCH/PUT /categorys/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to [admin, @category], notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: [admin, @category] }
        else 
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # DELETE /categorys/1
    # DELETE /categorys/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categorys_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
    private
    def set_category
        @category = Category.find(params[:id])
    end
    
    
    def category_params
          params.require(:category).permit(:name)
    end
end
