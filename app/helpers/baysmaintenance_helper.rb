module BaysmaintenanceHelper
    
    include JqgridsHelper

  def bays_jqgrid
    
    options = {:on_document_ready => true, :html_tags => false}
    url = "/baysmaintenance?id=" + params["id"]
    grid = [{
      :url => url ,
      :datatype => 'json',
      :mtype => 'GET',
     
      :colNames => ['Id','Sequence', 'Bay','Client Id','Description','sm_aisle_id','Aisle','aisle_id','sm_zone_id','Zone', 'sm_warehouse_id','Warehouse','Level/Bay','Attribute1','Attribute2','Attribute3','Attribute4','Attribute5','Attribute6','Attribute7','Attribute8'],
      :colModel  => [
        { :name => 'id',      :index => 'id',    :width => 55, :hidden => true},
        { :name => 'sm_bay_id',  :index => 'sm_bay_id',  :width => 120, :align => 'left', :editable => false,formatter:'showlink', formatoptions:{baseLinkUrl:'/levelmaintenance'}},
        {:name => 'cl_bay_id', :index => 'cl_bay_id',  :width => 120, :align => 'left', :editable => true},
        { :name => 'client_id',:index => 'client_id',     :width => 55,  :align => 'center', :editable => false },
        { :name => 'description', :index => 'description', :width => 120,  :align => 'left', :editable => true },
        { :name => 'sm_aisle_id', :index => 'sm_aisle_id', :width => 150,  :align => 'left', :editable => false,:hidden => true },
        { :name => 'cl_aisle_id', :index => 'cl_aisle_id', :width => 80,  :align => 'left', :editable => false},
        { :name => 'aisle_id',    :index => 'aisle_id',     :width => 150,  :align => 'left', :editable => false,:hidden => true },
        { :name => 'sm_zone_id',  :index => 'sm_zone_id',     :width => 150,  :align => 'left', :editable => false,:hidden => true },
        { :name => 'cl_zone_id',  :index => 'cl_zone_id',     :width => 80,  :align => 'left', :editable => false},
        { :name => 'sm_warehouse_id',:index => 'sm_warehouse_id',   :width => 80,   :align => 'center', :editable => false,:hidden => true },
        { :name => 'cl_warehouse_id', :index => 'cl_warehouse_id',   :width => 80,   :align => 'center', :editable => false},
        { :name => 'no_of_level_bay', :index => 'no_of_level_bay',   :width => 80,   :align => 'center', :editable => true},
        { :name => 'attribute1',   :index => 'attribute1',   :width => 80,   :align => 'center', :editable => true},
        { :name => 'attribute2',   :index => 'attribute2',   :width => 80,   :align => 'center', :editable => true},
        { :name => 'attribute3',   :index => 'attribute3',   :width => 80,   :align => 'center', :editable => true },
        { :name => 'attribute4',   :index => 'attribute4',   :width => 80,   :align => 'center', :editable => true },
        { :name => 'attribute5',   :index => 'attribute5',   :width => 80,   :align => 'center', :editable => true, :hidden => true},
        { :name => 'attribute6',   :index => 'attribute6',   :width => 80,   :align => 'center', :editable => true, :hidden => true},
        { :name => 'attribute7',   :index => 'attribute7',   :width => 80,   :align => 'center', :editable => true,:hidden => true},
        { :name => 'attribute8',   :index => 'attribute8',   :width => 80,   :align => 'center', :editable => true, :hidden => true}
        
      ],
      :editurl => '/baysmaintenance',
      :pager => '#bays_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :sortname => 'sm_bay_id',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'Bay Maintenance',
      :onSelectRow => "function() {}".to_json_var
    }]

    # See http://www.trirand.com/jqgridwiki/doku.php?id=wiki:navigator
    # ('navGrid','#gridpager',{parameters}, prmEdit, prmAdd, prmDel, prmSearch, prmView)
    #pager = [:navGrid, "#aisle_pager", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]
    pager = [:navGrid, "#bays_pager", {edit:true,add:true,del:true}]
    #pager2 = [:inlineNav, "#bays_pager"]

    
    pager_button = [:navButtonAdd, "#bays_pager", {:caption => 'Add', :onClickButton => 'function() {alert("Custom button!")}'.to_json_var }]

    jqgrid_api 'bays_list', grid, pager, pager_button, options

  end

  
end