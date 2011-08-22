class ItemsController < ApplicationController


  before_filter :login_required

  def index
    @items = Item.paginate(:per_page => 25, :page => params[:page])
    respond_to do |format|
      format.xml{render :text => @items.to_xml}
      format.html{}
    end
  end

  def show
    @item = Item.find_by_code(params[:id])
    respond_to do |format|
      format.html{}
      format.xml{
        if @item
          render :text => @item.to_xml
        else
          render :nothing => true, :status => 404 and return
        end
      }
    end
  end

  def new
    @categories = Category.find(:all)
    @item       = Item.new
  end
  
  def create
    @item = Item.create(params[:item])
    respond_to do |format|
      format.xml{ render :text => @item.to_xml}
      format.html{
        redirect_to item_path(@item) and return
      }
    end
  end
  
  def edit
    @categories = Category.find(:all)    
    @item = Item.find_by_code(params[:id])
  end
  
  def update
    @item = Item.find_by_code(params[:id])    
    if @item.update_attributes(params[:item])    
     respond_to do |format|
       format.html{redirect_to item_path(@item)}
       format.xml{ @item.to_xml }
     end
   else
     respond_to do |format|
       
     end
   end        
  end
  
  def delete
    @item = Item.find_by_code(params[:id])
    if @item.destroy
      redirect_to :back and return
    else
      redirect_to :back and return      
    end
  end
  
end
