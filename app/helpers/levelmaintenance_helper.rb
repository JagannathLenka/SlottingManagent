module LevelmaintenanceHelper
   include JqgridsHelper

  def level_jqgrid

    options = {:on_document_ready => true, :html_tags => false}
    url = "/levelmaintenance?id=" + params["id"]
    editcheckfunc = 'function(postdata, formid) 
              {
                if (parseInt(postdata.no_of_pos_level) < parseInt(postdata.no_of_pos_level_hidden) )
                   {
                     return[false, "Can not delete positions from this screen, Please use Position Maintenance"];
                   } 

              return[true, " "]}'
    addcheckfunc = 'function(postdata, formid) {postdata.pt_bay_id=' + params["id"] + '; return[true, " "]}'
    
    copyrowfunc  = "function() {
                                var ids = $('#level_list').jqGrid('getGridParam','selarrrow');
                                
                                 $.post('/levelmaintenance',
                                       {
                                         'oper' :'cpy',
                                         'id'   :ids[0]
                                       })
                                        .done(function() {
                                        
                                      })
                                      .fail( function(xhr, textStatus, errorThrown) {
                                          $.jgrid.info_dialog(
                                                $.jgrid.errors.errcap, 
                                                '<div class=""ui-state-error"">' + xhr.responseText + '</div>', 
                                                 $.jgrid.edit.bClose,{buttonalign:'right'});
                                      })
                                      
                                      .always(function() {
                                        
                                    });
                                 $('#level_list').trigger('reloadGrid');       
                   }"
                   
    
     aftersubfunc = 'function(response, postdata) {message = response.responseText; success = false; return [success, message ]}'
     selectrowfunc = "function(id) { 
                      if(id && id!==lastsel){
                           jQuery('#level_list').jqGrid('restoreRow',lastsel);
                           jQuery('#level_list').jqGrid('editRow',id,{keys: true, 
                           aftersavefunc: function(){lastsel=0;jQuery('#level_list').trigger('reloadGrid');},
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
      :width=> 'auto',
      
      :colNames => ['Id','Sequence','Level','Description','Clent Id','sm_bay_id','Bay','bay_id','Position/Level','no_of_pos_level_hidden','sm_aisle_id','Aisle','sm_zone_id','Zone','sm_warehouse_id','Warehouse','Sequence No','Attribute2','Attribute3','PriorityLevel','Attribute5','Attribute6','Attribute7','Attribute8'],
      :colModel  => [
        { :name => 'id',   :index => 'id',    :width => 55, :hidden => true},
        { :name => 'sm_level_id',    :index => 'sm_level_id',     :width => 55,  :align => 'center', :editable => true,:hidden => true },
        { :name => 'cl_level_id',    :index => 'cl_level_id',     :width => 100,  :align => 'center', :editable => true,editrules:{required:true},formatter:'showlink', formatoptions:{baseLinkUrl:'/posmaintenance'} },
        { :name => 'description',  :index => 'description',   :width => 120,   :align => 'left', :editable => true},
        { :name => 'client_id', :index => 'client_id',  :width => 120, :align => 'left', :editable => false, :hidden => true},
        { :name => 'sm_bay_id',   :index => 'sm_bay_id',    :width => 120,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'cl_bay_id',   :index => 'cl_bay_id',    :width => 100,   :align => 'center', :editable => false ,:hidden => true},
        { :name => 'bay_id',   :index => 'bay_id',    :width => 120,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'no_of_pos_level',   :index => 'no_of_pos_level',    :width => 120,   :align => 'center', :editable => true, editrules:{required:true,number:true}},
        { :name => 'no_of_pos_level_hidden',   :index => 'no_of_pos_level_hidden',    :width => 120,   :align => 'center', :editable => true, :hidden => true},
        { :name => 'sm_aisle_id',   :index => 'sm_aisle_id',    :width => 120,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'cl_aisle_id',   :index => 'cl_aisle_id',    :width => 100,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'sm_zone_id',   :index => 'sm_zone_id',    :width => 120,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'cl_zone_id',   :index => 'cl_zone_id',    :width => 100,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'sm_warehouse_id',   :index => 'sm_warehouse_id',    :width => 120,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'cl_warehouse_id',   :index => 'cl_warehouse_id',    :width => 100,   :align => 'center', :editable => false, :hidden => true},
        { :name => 'attribute1',   :index => 'attribute1',   :width => 80,   :align => 'center', :editable => true},
        { :name => 'attribute2',   :index => 'attribute2',   :width => 80,   :align => 'center', :editable => true,:hidden => true},
        { :name => 'attribute3',   :index => 'attribute3',   :width => 80,   :align => 'center', :editable => true,:hidden => true },
        { :name => 'attribute4',   :index => 'attribute4',   :width => 100,   :align => 'center', :editable => true,edittype:"select", editoptions: {value: "High:High;Medium:Medium;Low:Low" }},
        { :name => 'attribute5',   :index => 'attribute5',   :width => 120,   :align => 'center', :editable => true, :hidden => true},
        { :name => 'attribute6',   :index => 'attribute6',   :width => 120,   :align => 'center', :editable => true, :hidden => true},
        { :name => 'attribute7',   :index => 'attribute7',   :width => 120,   :align => 'center', :editable => true,:hidden => true},
        { :name => 'attribute8',   :index => 'attribute8',   :width => 120,   :align => 'center', :editable => true, :hidden => true}
       
      ],
      :editurl => '/levelmaintenance',
      :pager => '#level_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :sortname => 'sm_level_id',
      :sortorder => 'asc',
      :shrinkToFit => true,
      :autowidth => true,
      :viewrecords => true,
      :caption => 'Level Maintenance',
      :multiselect => true,
      :ondblClickRow  => selectrowfunc.to_json_var }]

    # See http://www.trirand.com/jqgridwiki/doku.php?id=wiki:navigator
    # ('navGrid','#gridpager',{parameters}, prmEdit, prmAdd, prmDel, prmSearch, prmView)
    #pager = [:navGrid, "#aisle_pager", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]
    #pager = [:navGrid, "#level_pager", {edit:true,add:true,del:true}]
     pager = [:navGrid, "#level_pager", {edit:false, add:true, del: true}, {:closeAfterEdit => true, :closeAfterAdd => true,
                                                       :closeOnEscape => true, :beforeSubmit => editcheckfunc.to_json_var}, 
                                                       {:closeAfterAdd=>true, :errorTextFormat  =>aftersubfunc.to_json_var, :beforeSubmit => addcheckfunc.to_json_var}, {}, {}, {}]                                                                        
                                                        

    #pager2 = [:inlineNav, "#level_pager"]

    
    pager_button = [:navButtonAdd, "#level_pager", {:caption => 'Copy to other level', :onClickButton => copyrowfunc.to_json_var }]

    jqgrid_api 'level_list', grid, pager, pager_button, options

  end

  
end
