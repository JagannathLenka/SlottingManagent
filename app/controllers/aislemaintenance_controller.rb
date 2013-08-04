class AislemaintenanceController < ApplicationController
  
 # GET /Render the JQGrid for aisle maintenance
  def index

     columns =  ['id','sm_aisle_id', 'cl_aisle_id','client_id', 'sm_zone_id','cl_zone_id','zone_id',
                  'sm_warehouse_id' ,'cl_warehouse_id','description', 'no_of_bays_aisle', 'no_of_bays_aisle_hidden','no_of_levels_aisle','no_of_levels_aisle_hidden',
                  'attribute1', 'attribute2' , 'attribute3','attribute4',
                  'attribute5','attribute6','attribute7','attribute8']
     aisles = Aisle.select(" id ,sm_aisle_id , cl_aisle_id ,client_id , sm_zone_id ,cl_zone_id , zone_id ,
                  sm_warehouse_id , cl_warehouse_id,  description ,no_of_bays_aisle ,no_of_bays_aisle as no_of_bays_aisle_hidden,no_of_levels_aisle,no_of_levels_aisle as no_of_levels_aisle_hidden,
                  attribute1 , attribute2  , attribute3 ,attribute4 ,
                  attribute5, attribute6 , attribute7 , attribute8 ").where(:zone_id => params[:id]).paginate(
                   :page     => params[:page],
                   :per_page => params[:rows],
                   :order    => order_by_from_params(params))
    #Get the header details of the zone
    get_header_details
      
    if request.xhr?
      render :json => json_for_jqgrid(aisles, columns)
    end

  end

 
 #Update the aisles and create bays and levels beased on the input from JQgrid
 def create
  
  case params[:oper]
  when "edit"
        aisles = Aisle.find_by_id(params[:id].to_i)
        aisles.update_attributes({ 
                                   :cl_aisle_id => params[:cl_aisle_id],
                                   :description    => params[:description],
                                   :no_of_bays_aisle => params[:no_of_bays_aisle],
                                   :no_of_levels_aisle => params[:no_of_levels_aisle],
                                   :attribute1 => params[:attribute1],
                                   :attribute2 => params[:attribute2], 
                                   :attribute3 => params[:attribute3],
                                   :attribute4 => params[:attribute4],
                                   :attribute5 => params[:attribute5],
                                   :attribute6 => params[:attribute6],
                                   :attribute7 => params[:attribute7],
                                   :attribute8 => params[:attribute8]    
                                  })
        create_bays aisles
          
  when "add"
        aisles = Aisle.find_by_id(params[:id])
        zone = Zone.find_by_id(params[:pt_zone_id].to_i)
        maximum_aisle_id = Aisle.where(:zone_id => params[:pt_zone_id]).maximum("sm_aisle_id").to_i + 1
        aisles= Aisle.new(:sm_aisle_id => maximum_aisle_id, 
                                   :cl_aisle_id => params[:cl_aisle_id],
                                   :sm_zone_id => zone.sm_zone_id,
                                   :cl_zone_id => zone.cl_zone_id,
                                   :sm_warehouse_id => zone.sm_warehouse_id,
                                   :cl_warehouse_id => zone.cl_warehouse_id,
                                   :zone_id => zone.id,
                                   :description  => params[:description],
                                   :no_of_bays_aisle => params[:no_of_bays_aisle],
                                   :no_of_levels_aisle => params[:no_of_levels_aisle],
                                   :attribute1 => params[:attribute1],
                                   :attribute2 => params[:attribute2], 
                                   :attribute3 => params[:attribute3],
                                   :attribute4 => params[:attribute4],
                                   :attribute5 => params[:attribute5],
                                   :attribute6 => params[:attribute6],
                                   :attribute7 => params[:attribute7],
                                   :attribute8 => params[:attribute8]   
                                
                          )
        
         aisles.save 
          zone.update_attributes({
                                   :no_of_aisles_zone => zone.no_of_aisles_zone + 1
          })
              
         create_bays aisles

  when "del"
              aisle = Aisle.destroy(params[:id].to_i) 
               zone = Zone.find_by_id(aisle.zone_id)
               zone.update_attributes({
                                   :no_of_aisles_zone => zone.no_of_aisles_zone - 1})
           
           
 end        
    #If it is a Ajax then send the json details
    if request.xhr?
      render :json => aisles
    end
 end
 
 #Create and save atribute for bays
 def create_bays aisles
   
    
     max_bays  = Bay.where(:aisle_id => aisles.id).maximum("sm_bay_id").to_i

     bayvalue = params[:no_of_bays_aisle].to_i
     hidden_bayvalue = params[:no_of_bays_aisle_hidden].to_i 

     if(bayvalue > hidden_bayvalue)
         diff_bayval =  bayvalue - hidden_bayvalue     
         (1.. diff_bayval).each do |b|
             if params[:attribute3].strip == "LR"
                 side_of_aisle =  b <= params[:no_of_bays_aisle].to_i/2? "L" : "R" 
             else
                 side_of_aisle = params[:attribute3]
             end  
             bays = Bay.new(:sm_bay_id            => max_bays + b,
                             :sm_aisle_id         => aisles.sm_aisle_id,
                             :sm_zone_id          => aisles.sm_zone_id,
                             :sm_warehouse_id     => aisles.sm_warehouse_id,
                             :aisle_id            => aisles.id,
                             :cl_bay_id           => "",
                             :cl_aisle_id         => aisles.cl_aisle_id,
                             :cl_zone_id          => aisles.cl_zone_id,
                             :cl_warehouse_id     => aisles.cl_warehouse_id,
                             :no_of_level_bay     => aisles.no_of_levels_aisle,
                             :attribute3          => side_of_aisle
                             
                          )
             bays.save
             create_levels bays
         end
                 
     
       #When there is no change in aisle value but just change in other parameters
        else
             bay_set = Bay.where(:aisle_id => aisles.id)
             counter = 0
             bay_set.each do |bays| 
                 counter = counter + 1
                 
                 #Change in Sides of aisles
                 if params[:attribute3].strip == "LR"
                   side_of_aisle = counter <= params[:no_of_bays_aisle].to_i/2? "L" : "R" 
                 else
                   side_of_aisle = params[:attribute3]
                 end    
    
                 bays.update_attributes({ 
                                      :cl_aisle_id         => aisles.cl_aisle_id,
                                      :cl_zone_id          => aisles.cl_zone_id,
                                      :cl_warehouse_id     => aisles.cl_warehouse_id,
                                      :attribute3          => side_of_aisle,
                                      :no_of_level_bay     => aisles.no_of_levels_aisle
                                      
                                      })
                                      
                #Update the levels accordingly                      
                create_levels bays
        end      
    end         
 end
 

 #create levels for each bays
 def create_levels bay
   
   max_levels  = Level.where(:bay_id => bay.id).maximum("sm_level_id").to_i

   levelvalue = params[:no_of_levels_aisle].to_i
   levelvalue_hidden = params[:no_of_levels_aisle_hidden].to_i
   

   if(levelvalue> levelvalue_hidden)
      diff_levelvalue = levelvalue - levelvalue_hidden
      (1..diff_levelvalue).each do |lev|
                  levels = Level.new(
                             :sm_level_id     => max_levels + lev,
                             :sm_bay_id           => bay.sm_bay_id,
                             :sm_aisle_id         => bay.sm_aisle_id,
                             :sm_zone_id          => bay.sm_zone_id,
                             :sm_warehouse_id     => bay.sm_warehouse_id,
                             :bay_id              => bay.id,
                             :cl_level_id         => "",
                             :cl_bay_id           => bay.cl_bay_id,
                             :cl_aisle_id         => bay.cl_aisle_id,
                             :cl_zone_id          => bay.cl_zone_id,
                             :cl_warehouse_id     => bay.cl_warehouse_id,
                             :no_of_pos_level     => ""
                          )
                 levels.save
      end
   end 
 end
 
 #Write the breadcrumbs
 def get_header_details
   zone  = Zone.find_by_id(params["id"].to_i)
   warehouse = Warehouse.find_by_id(zone.warehouse_id)

   add_breadcrumb warehouse.cl_warehouse_id, "/zonemaintenance?id="+ warehouse.id.to_s
   add_breadcrumb "Zone:" + zone.cl_zone_id.blank? ? zone.sm_zone_id: zone.cl_zone_id, "/aislemaintenance?id="+ zone.id.to_s
end 
    
 

end
