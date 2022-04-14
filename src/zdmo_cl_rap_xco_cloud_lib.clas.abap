CLASS zdmo_cl_rap_xco_cloud_lib DEFINITION INHERITING FROM zdmo_cl_rap_xco_lib
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_aggregated_annotations REDEFINITION.
    METHODS get_behavior_definition REDEFINITION.
    METHODS get_class REDEFINITION.
    METHODS get_database_table REDEFINITION.
    METHODS get_data_definition REDEFINITION.
    METHODS get_metadata_extension REDEFINITION.
    METHODS get_package REDEFINITION.
    METHODS get_service_binding REDEFINITION.
    METHODS get_service_definition REDEFINITION.
    METHODS get_structure REDEFINITION.
    METHODS get_view_entity REDEFINITION.
    METHODS get_view REDEFINITION.
    METHODS get_entity REDEFINITION.
    METHODS get_abstract_entity REDEFINITION.
    METHODS get_views REDEFINITION.
    METHODS get_tables REDEFINITION.
    METHODS get_structures REDEFINITION.
    METHODS get_packages REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdmo_cl_rap_xco_cloud_lib IMPLEMENTATION.


  METHOD  get_aggregated_annotations.
    ro_aggregated_annotations = xco_cp_cds=>annotations->aggregated->of( io_field ).
  ENDMETHOD.


  METHOD  get_behavior_definition.
    ro_behavior_definition = xco_cp_abap_repository=>object->bdef->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_class.
    ro_class = xco_cp_abap_repository=>object->clas->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_database_table.
    ro_table = xco_cp_abap_repository=>object->tabl->database_table->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_data_definition.
    ro_data_definition = xco_cp_abap_repository=>object->ddls->for( iv_name  ).
  ENDMETHOD.


  METHOD get_entity.
    ro_entity = xco_cp_cds=>entity( iv_name ).
  ENDMETHOD.


  METHOD  get_metadata_extension.
    ro_metadata_extension  = xco_cp_abap_repository=>object->ddlx->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_package.
    ro_package = xco_cp_abap_repository=>object->devc->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_service_binding.
    ro_service_binding = xco_cp_abap_repository=>object->srvb->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_service_definition.
    ro_service_definition = xco_cp_abap_repository=>object->srvd->for( iv_name  ).
  ENDMETHOD.


  METHOD  get_structure.
    ro_structure = xco_cp_abap_repository=>object->tabl->structure->for( iv_name  ).
  ENDMETHOD.


  METHOD get_view.
    ro_view = xco_cp_cds=>view( iv_name ).
  ENDMETHOD.


  METHOD get_view_entity.
    ro_view_entity = xco_cp_cds=>view_entity( iv_name ).
  ENDMETHOD.


  METHOD get_abstract_entity.
*    ro_abstract_entity = xco_cp_cds=>abstract_entity( iv_name ).

    IF method_exists_in_class(
         class_name  = 'xco_cp_cds'
         method_name = 'abstract_entity'
       ).
      CALL METHOD xco_cp_cds=>('abstract_entity')
        EXPORTING
          iv_name            = iv_name
        RECEIVING
          ro_abstract_entity = ro_abstract_entity.
    ENDIF.

  ENDMETHOD.


  METHOD get_structures.
    IF it_filters IS NOT INITIAL.
      rt_structures =  xco_cp_abap_repository=>objects->tabl->structures->where( it_filters
*       VALUE #(
*                                              ( io_filter )
*                                              )
                                              )->in( xco_cp_abap=>repository )->get( ).
    ELSE.
      rt_structures = xco_cp_abap_repository=>objects->tabl->structures->all->in( xco_cp_abap=>repository )->get( ).
    ENDIF.
  ENDMETHOD.


  METHOD get_tables.
    IF it_filters IS NOT INITIAL.
      rt_tables = xco_cp_abap_repository=>objects->tabl->database_tables->where( it_filters
*      VALUE #(
*                                  ( io_filter )
*                                  )
                                  )->in( xco_cp_abap=>repository )->get( ).

    ELSE.
      rt_tables = xco_cp_abap_repository=>objects->tabl->database_tables->all->in( xco_cp_abap=>repository )->get( ).
    ENDIF.
  ENDMETHOD.


  METHOD get_views.
    IF it_filters IS NOT INITIAL.
      rt_data_definitions =  xco_cp_abap_repository=>objects->ddls->where( it_filters
*                                             VALUE #(
*                                              ( io_filter )
*                                              )
                                              )->in( xco_cp_abap=>repository )->get( ).
    ELSE.
      rt_data_definitions = xco_cp_abap_repository=>objects->ddls->all->in( xco_cp_abap=>repository )->get( ).
    ENDIF.
  ENDMETHOD.


  METHOD get_packages.
    IF it_filters IS NOT INITIAL.
      rt_packages =  xco_cp_abap_repository=>objects->devc->where( it_filters
*       VALUE #(
*                                              ( io_filter )
*                                              )
                                              )->in( xco_cp_abap=>repository )->get( ).
    ELSE.
      rt_packages = xco_cp_abap_repository=>objects->devc->all->in( xco_cp_abap=>repository )->get( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
