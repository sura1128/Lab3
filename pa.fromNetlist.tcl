
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Lab3 -dir "C:/CG3207/Lab3/planAhead_run_2" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/CG3207/Lab3/TOP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/CG3207/Lab3} }
set_property target_constrs_file "TOP.ucf" [current_fileset -constrset]
add_files [list {TOP.ucf}] -fileset [get_property constrset [current_run]]
link_design
