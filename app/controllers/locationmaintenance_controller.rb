require 'csv'
class LocationmaintenanceController < ApplicationController
  # GET /maintenance
  
  def index
    get_header_details  if !request.xhr?
    search_string = '1 = 1'
    
    if !params[:warehouse_id].nil? 
      warehouse = Warehouse.find(params[:warehouse_id])
      @warehouse = warehouse.cl_warehouse_id
     @warehouse_description = warehouse.description
    else
      zone = Zone.find(params[:zone_id])
      warehouse = Warehouse.find(zone.warehouse_id)
      @warehouse_description = warehouse.description
      @warehouse = zone.cl_warehouse_id
     
      search_string = "cl_zone_id = '" +  zone.cl_zone_id + "'"
    end
    
    #Dynamic search
    if params[:_search] == "true"
      case params[:searchOper]
      when 'eq'
        search_string = params[
          :searchField] + " = '" +  params[:searchString] + "'"
        
      when 'bw'
        search_string = params[:searchField] + " like '" +  params[:searchString] + "%'"
      else
        (search_string += " AND cl_barcode = '"  + params[:cl_barcode]  + "'" ) if !params[:cl_barcode].nil?
        (search_string += " AND cl_zone_id = '"  + params[:cl_zone_id]  + "'" ) if !params[:cl_zone_id].nil?
        (search_string += " AND cl_aisle_id ='" + params[:cl_aisle_id]  + "'" ) if !params[:cl_aisle_id].nil?
        (search_string += " AND cl_bay_id =  '"   + params[:cl_bay_id]  + "'" ) if !params[:cl_bay_id].nil?
        (search_string += " AND cl_level_id ='"  + params[:cl_level_id] + "'" ) if !params[:cl_level_id].nil?  
        (search_string += " AND cl_pos_id =  '"  + params[:cl_pos_id]   + "'" ) if !params[:cl_pos_id].nil?
        (search_string += " AND current_item = '"  + params[:current_item] + "'")    if !params[:current_item].nil?  
        
      end 
    end
    
    columns =  ['id','sm_warehouse_id', 'cl_warehouse_id','sm_barcode','cl_barcode', 'sm_zone_id','cl_zone_id', 'sm_aisle_id','cl_aisle_id',  
                'sm_bay_id', 'cl_bay_id', 'sm_level_id','cl_level_id','sm_pos_id','cl_pos_id',
                'sm_loc_id','cl_loc_id','client_id','current_item', 'current_quantity',
                'life_time_total_picks', 'lock_code',  'minimum_quantity','maximum_quantity','status', 
                'location_priority', 'location_length','location_breadth','location_height',
                'location_volume','allowed_weight', 'item_short_description','item_long_description',
                'attribute1', 'attribute2', 'attribute3', 'attribute4','attribute5',
                'attribute6', 'attribute7','attribute8']
    loc = Location.select("*")
      .where(:cl_warehouse_id => @warehouse)
      .where(search_string).paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))
      
     if request.xhr?
        render :json => json_for_jqgrid(loc, columns)
          else
       respond_to do |format|
          format.html
          format.csv { 
                 loc = Location.select("*")
                .where(:cl_warehouse_id => @warehouse)
                .where(search_string)
                 send_data loc.to_csv, filename: "location_data.csv" }
        end   
     end
   end
   
 #
 #Manual addition of location
 #
 def create
   
  case params[:oper]
  when "edit"
       update_location
        
  when "add"
        
         loc= Location.new(params[:location])
         loc.client_id = cookies[:client_id]
         loc.save
         
         Location.update_location_details loc, params[:location][:cl_warehouse_id], params[:location][:cl_barcode]           
             
   when "del"
       params[:id].split(',').each do |id|
            Location.destroy(id.to_i)
       end
           
   end
    
    
    if request.xhr?
        render :json => loc   
     end
 end
 
 def update_location
   
        loc = Location.find_by_id(params[:id])
        loc.update_attributes(params[:location])
        Location.update_location_details loc, params[:location][:cl_warehouse_id], params[:location][:cl_barcode]
                                         
    end
      

 
  
 def get_header_details

   if cookies[:userid].nil? 
               redirect_to "/login"
    else
      @userid = cookies[:userid]
    end
  end
end
