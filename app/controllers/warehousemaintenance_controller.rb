
class WarehousemaintenanceController < ApplicationController
  
   # GET /maintenance
  def index
   columns =  ['id','sm_warehouse_id', 'cl_warehouse_id','client_id','description', 'no_of_zones','no_of_zones_hidden', 'attribute1','attribute2','attribute3','attribute4','attribute5','attribute6','attribute7','attribute8' ]
    warehouse = Warehouse.select(" id ,sm_warehouse_id , cl_warehouse_id ,client_id , description , no_of_zones , no_of_zones as no_of_zones_hidden , attribute1 , attribute2 , attribute3 , attribute4, attribute5, attribute6 , attribute7 , attribute8 ").paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))
  
    if request.xhr? and params[:lightweight] !="yes"
      #@invoices = 'ok'
      render :json => json_for_jqgrid(warehouse, columns)
    end
   
  end


 #POST /warehousemaintenance
 #Creates the warehouse and the zones
 def create
   
  case params[:oper]
  when "edit"
    edit_warehouse_details
  

       #When warehouse is added, create the respective zones also
  when "add"
        maximum_warehouse_id = Warehouse.maximum("sm_warehouse_id").to_i 
        warehouse= Warehouse.new(  :sm_warehouse_id => maximum_warehouse_id + 1 ,
                                   :cl_warehouse_id => params[:cl_warehouse_id], 
                                   :client_id => params[:client_id],
                                   :description => params[:description],
                                   :no_of_zones => 0,
                                   :attribute1 => params[:attribute1],
                                   :attribute2 => params[:attribute2], 
                                   :attribute3 => params[:attribute3],
                                   :attribute4 => params[:attribute4]
          )
        
         warehouse.save          
         add_zones_to_warehouse warehouse

    when "del"
              Warehouse.destroy(params[:id].to_i)                               
    end
    
    if request.xhr?
      render :json => @warehouse
    end
end 

def edit_warehouse_details
  warehouse = Warehouse.find_by_id(params[:id])
  
  case 
        
        #add in the number of zones
        when params[:no_of_zones].to_i >  (warehouse.no_of_zones.nil? ? 0 :  warehouse.no_of_zones)
             add_zones_to_warehouse warehouse
             
             
        #delete in the number of zones
        when params[:no_of_zones].to_i < (warehouse.no_of_zones.nil? ? 0 :  warehouse.no_of_zones)
             remove_zones_from_warehouse warehouse
                    
       end  
       warehouse.update_attributes({
                                   :cl_warehouse_id => params[:cl_warehouse_id], 
                                   :description => params[:description],
                                   #:no_of_zones => params[:no_of_zones],
                                   :attribute1 => params[:attribute1],
                                   :attribute2 => params[:attribute2], 
                                   :attribute3 => params[:attribute3],
                                   :attribute4 => params[:attribute4]
                                        
          }) 
end

def add_zones_to_warehouse warehouse
         max_zone = Zone.where(:warehouse_id => warehouse.id).maximum("sm_zone_id").to_i
         newzone = params[:no_of_zones].to_i
         existingzone = warehouse.no_of_zones.nil? ? 0 : warehouse.no_of_zones
         diff_zonevalue = newzone - existingzone
               
            logger.debug diff_zonevalue 
            logger.debug existingzone
            logger.debug newzone   
               (1..diff_zonevalue).each do |z| 
               
                     zones = Zone.new(
                                        :sm_zone_id  => max_zone + z,
                                        :cl_zone_id  =>"",
                                        :sm_warehouse_id => warehouse.sm_warehouse_id,
                                        :warehouse_id => warehouse.id,
                                        :cl_warehouse_id => params[:cl_warehouse_id],
                                        :no_of_aisles_zone => 0,
                                        
                                        
                                     )
                      zones.save
                                
                end 
end

def remove_zones_from_warehouse warehouse
         newzone = params[:no_of_zones].to_i
         existingzone = warehouse.no_of_zones
         diff_zonevalue = existingzone - newzone 
         
        (1..diff_zonevalue).each do |z| 
               Zone.where(:warehouse_id => warehouse.id).last.destroy
         end
           
end



end
