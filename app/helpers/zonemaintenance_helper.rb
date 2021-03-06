module ZonemaintenanceHelper
  include JqgridsHelper

  def zone_jqgrid

    options = {:on_document_ready => true, :html_tags => false}
    url = "/zonemaintenance?id=" +  params["id"]
    editcheckfunc = 'function(postdata, formid) 
              {
               if (parseInt(postdata.no_of_aisles_zone) < parseInt(postdata.no_of_aisles_zone_hidden)) 
                   {
                     return[false, "Can not delete Aisles from this screen, Please use Aisles Maintenance"];
                   } 
              return[true, " "]}'
    addcheckfunc = 'function(postdata, formid) {postdata.pt_warehouse_id=' + params["id"] + '; return[true, " "]}' 
    
    aftersubfunc = 'function(response, postdata) {message = response.responseText; success = false; return [success, message ]}'
    
    selectrowfunc = "function(id) {                       
                      if(id && id!==lastsel){                           
                           jQuery('#zone_list').jqGrid('restoreRow',lastsel);
                           jQuery('#zone_list').jqGrid('editRow',id,{keys: true, 
                           aftersavefunc: function(){lastsel=0;jQuery('#zone_list').trigger('reloadGrid');},
                           errorfunc: function(id, response){lastsel=0;
                                       $.jgrid.info_dialog($.jgrid.errors.errcap,'<div class=""ui-state-error"">'+ response.responseText +'</div>', 
                                       $.jgrid.edit.bClose,{buttonalign:'right'});},                         
                           afterrestorefunc : function(){lastsel=0;}            
                      });
                     lastsel=id;
                     } 
                   }"                             

    grid = [{
      
      :url => url ,
      :datatype => 'json',
      :mtype => 'GET',
      :height=> 350,
      :width => 'auto',
      :shrinkToFit => false,
                   
      :colNames => ['Id','Sequence','Zone','Description','Client Id','sm_warehouse_id','Warehouse','warehouse_id', 'Aisles/Zone', 'no_of_aisles_zone_hidden',  'Bays/Aisle','Levels/Aisle', 'Sequence Type', 'Sequence No.', 'Attribute3','Attribute4','Attribute5','Attribute6','Attribute7','Attribute8'], 
      :colModel  => [
        { :name => 'id',   :index => 'id',    :width => 50, :align => 'center',hidden:true},
        { :name => 'sm_zone_id',   :index => 'sm_zone_id',    :width => 100, :align => 'center',:editable => false,:hidden => true, :editable => true},
        { :name => 'cl_zone_id',   :index => 'cl_zone_id',    :width => 100, :align => 'center', :editable => true, editrules:{required:true},formatter:'showlink', formatoptions:{baseLinkUrl:'/aislemaintenance'}},
        { :name => 'description',   :index => 'description',    :width => 150, :align => 'left', :editable => true},
        { :name => 'client_id',   :index => 'client_id',    :width => 100, :align => 'center', :editable => false, :hidden => true},
        { :name => 'sm_warehouse_id',   :index => 'sm_warehouse_id',    :width => 100, :align => 'center', :editable => false, hidden:true},
        { :name => 'cl_warehouse_id',   :index => 'cl_warehouse_id',    :width => 100, :align => 'center', :editable => false,:hidden => true},
        { :name => 'warehouse_id',   :index => 'warehouse_id',    :width => 100, :align => 'center', :editable => false, hidden:true},      
        { :name => 'no_of_aisles_zone',    :index => 'no_of_aisles_zone',     :width => 150,  :align => 'center', :editable => true, editrules:{required:true,number:true} },
        { :name => 'no_of_aisles_zone_hidden',    :index => 'no_of_aisles_zone_hidden',     :width => 100,  :align => 'center', hidden:true, :editable => true },
        { :name => 'no_of_bays_aisle',    :index => 'no_of_bays_aisle',     :width => 150,  :align => 'center', :editable => true, :hidden => true },
        { :name => 'no_of_levels_aisle',    :index => 'no_of_levels_aisle',     :width => 100,  :align => 'center', :editable => true, formatter:'showlink', formatoptions:{baseLinkUrl:'/levelmaintenance'},:hidden => true},
        { :name => 'attribute1',  :index => 'attribute1',   :width => 150,   :align => 'center',:editable => true,edittype:"select", editoptions: {value: "Loop:Loop;OneWay:OneWay;ZigZag:ZigZag" }},
        { :name => 'attribute2',     :index => 'attribute2',:width => 150,   :align => 'left', :editable => true},
        { :name => 'attribute3',   :index => 'attribute3',  :width => 100,   :align => 'left', :editable => true },
        { :name => 'attribute4',   :index => 'attribute4',  :width => 100,   :align => 'left', :editable => true },
        { :name => 'attribute5',   :index => 'attribute5',  :width => 100,   :align => 'left', :editable => true,  :hidden => true },
        { :name => 'attribute6',   :index => 'attribute6',  :width => 100,   :align => 'left', :editable => true,  :hidden => true },
        { :name => 'attribute7',   :index => 'attribute7',  :width => 100,   :align => 'left', :editable => true,  :hidden => true },
        { :name => 'attribute8',   :index => 'attribute8',  :width => 100,   :align => 'left', :editable => true,  :hidden => true },

        
        
      ],
      :editurl => '/zonemaintenance',
      :pager => '#zone_pager',
      :rowNum => 30,
      :rowList => [30, 40, 50],
      :sortname => 'sm_zone_id',
      :sortorder => 'asc',
      :viewrecords => true,
      :shrinkToFit => true,
      :autowidth => true,
      :caption => 'Zone Maintenance',
      :reloadAfterEdit => true,
      :multiselect => true,
      :ondblClickRow => selectrowfunc.to_json_var }]
    

    pager = [:navGrid, "#zone_pager", {edit:false, add:true, del: true}, {:closeAfterEdit => true, :closeAfterAdd => true,
                                                       :closeOnEscape => true, :beforeSubmit => editcheckfunc.to_json_var}, 
                                                       {:closeAfterAdd=>true,:errorTextFormat  =>aftersubfunc.to_json_var, :beforeSubmit => addcheckfunc.to_json_var}, {}, {}, {}]   
                                                                                 

    pager_button = [:navButtonAdd, "#zone_pager", 
                   {:caption => 'Show Layout', :onClickButton => 'function() {
                                          var grid = $("#zone_list");
                                          selectedRowId= grid.jqGrid ("getGridParam","selrow");                                          
                                          if (selectedRowId == null){
                                              alert("Please select a zone to see the layout");
                                             return;
                                          }
                                          win = window.open("/bay?id=" + selectedRowId, "_blank");
                                          win.focus();
                                          }'.to_json_var }]
                                          
     location_button = [:navButtonAdd, "#zone_pager", 
                   {:caption => "Show Locations", :onClickButton => "function() {
                                          var grid = $('#zone_list');
                                          selectedRowId= grid.jqGrid ('getGridParam','selrow');                                          
                                          if (selectedRowId == null){
                                          $.jgrid.info_dialog($.jgrid.errors.errcap,'<div class=""ui-state-error"">'+ 'Select a zone for location' +'</div>', 
                                          $.jgrid.edit.bClose,{buttonalign:'right'});  
                                             return;
                                          }                
                                          window.location.href = '/locationmaintenance?zone_id=' + selectedRowId                                                
                                          }".to_json_var }]
    pager3 = [:gridResize, {minWidth:200,maxWidth:1500,minHeight:400, maxHeight:800}];                                       

    jqgrid_api 'zone_list', grid, pager, pager3, pager_button,location_button, options

  end

  
end
