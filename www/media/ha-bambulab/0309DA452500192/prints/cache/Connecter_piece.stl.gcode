; HEADER_BLOCK_START
; BambuStudio 02.02.02.56
; model printing time: 3m 6s; total estimated time: 9m 11s
; total layer number: 50
; total filament length [mm] : 94.45
; total filament volume [cm^3] : 227.17
; total filament weight [g] : 0.28
; filament_density: 1.24,1.24,1.24,1.24
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 10.00
; filament: 2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 8
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = ;===== machine: A1 mini =========================\n;===== date: 20240830 =======================\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1}\nG17\nG2 Z{max_layer_z + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\nM400\n\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\n\nM622.1 S0\n\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nG392 S0\nM1007 S1
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; different_settings_to_system = brim_type;brim_width;gap_infill_speed;inner_wall_speed;internal_solid_infill_speed;outer_wall_speed;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;travel_speed;;;;;change_filament_gcode;machine_max_speed_x;machine_max_speed_y
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80,80,80,80
; fan_max_speed = 80,80,80,80
; fan_min_speed = 60,60,60,60
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 100,100,100,100
; filament_change_length = 10,10,10,10
; filament_colour = #FFFFFF;#161616;#3A1B41;#F72323
; filament_colour_type = 0;0;0;0
; filament_cost = 20,20,20,20
; filament_density = 1.24,1.24,1.24,1.24
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFL99;GFL99;GFL99;GFL99
; filament_is_support = 0,0,0,0
; filament_map = 1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12,12,12,12
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #FFFFFF;#161616;#3A1B41;#F72323
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0
; filament_prime_volume = 45,45,45,45
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_scarf_gap = 15%,15%,15%,15%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Generic PLA @BBL A1M";"Generic PLA @BBL A1M";"Generic PLA @BBL A1M";"Generic PLA @BBL A1M"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = Generic;Generic;Generic;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,165,181,311,617,0,202,467,606,152,0,422,612,192,214,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 220
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 60,60,60,60
; hot_plate_temp_initial_layer = 60,60,60,60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10,10,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL A1M";;;;;"Bambu Lab A1 mini 0.4 nozzle"
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 200
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 220
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20231229 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_speed_e = 30,30
; machine_max_speed_x = 1000,200
; machine_max_speed_y = 1000,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20240620 =====================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M104 S{nozzle_temperature_range_high[initial_no_support_extruder]}\n    G92 E0\n    G1 E50 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action : 2\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of "draw extrinsic para cali paint"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 150
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1MV1
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = FONCTIONELLE A1 MINI
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 8,8,8,8
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 10%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = triangles
; sparse_infill_speed = 220
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,45
; supertack_plate_temp_initial_layer = 45,45,45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65,65,65
; textured_plate_temp_initial_layer = 65,65,65,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 600
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 140.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R9
M201 X20000 Y20000 Z1500 E5000
M203 X1000 Y1000 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20240620 =====================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S170
M140 S65
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S1A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T1
    G1 X-13.5 F3000
    M400
    M620.1 E F299.339 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
M73 P5 R8
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
    M104 S240
    G92 E0
    G1 E50 F299.339
    M400
    M106 P1 S178
    G92 E0
M73 P8 R8
    G1 E5 F299.339
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
M73 P9 R8
    G1 E-0.5 F300

M73 P10 R8
    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S180
    G392 S0 ;turn off clog detect
M621 S1A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P57 R3
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
M73 P58 R3
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action : 2
M104 S0
M190 S65;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X74.1584 Y128.632 I18.8184 J18.8185
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
M73 P59 R3
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F678.743
    G0 X93 E.3742  F1131.24
    G0 X98 E.3742  F4524.96
    G0 X103 E.3742  F1131.24
    G0 X108 E.3742  F4524.96
    G0 X113 E.3742  F1131.24
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F282.81
    M983 F4.7135 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F4.7135 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P61 R3
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F4.7135 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S220
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F678.743
G0 X93 E.3742  F1131.24
G0 X98 E.3742  F4524.96
G0 X103 E.3742  F1131.24
G0 X108 E.3742  F4524.96
G0 X113 E.3742  F1131.24
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


;VT1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/50
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
; OBJECT_ID: 136
G1 X78.801 Y130.193 F36000
M204 S6000
G1 Z.4
M73 P62 R3
G1 Z.2
M73 P63 R3
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X79.559 Y129.78 E.03215
G1 X79.995 Y129.582 E.01787
G1 X80.442 Y129.407 E.01786
G1 X80.898 Y129.255 E.0179
M73 P65 R3
G1 X81.36 Y129.128 E.01787
G1 X81.832 Y129.024 E.01797
G1 X82.303 Y128.946 E.0178
G1 X82.893 Y128.883 E.02208
G1 X83.849 Y128.863 E.03564
G1 X84.707 Y128.929 E.03204
G1 X85.649 Y129.097 E.03564
G1 X86.115 Y129.218 E.01792
G1 X86.573 Y129.364 E.01791
G1 X87.021 Y129.532 E.01782
G1 X87.464 Y129.725 E.01798
G1 X87.893 Y129.94 E.01789
G1 X88.315 Y130.18 E.01805
G1 X88.717 Y130.437 E.01779
G1 X89.108 Y130.717 E.01791
G1 X89.483 Y131.016 E.01786
G1 X89.843 Y131.336 E.01794
M73 P66 R3
G1 X90.261 Y131.753 E.02201
G1 X90.579 Y132.11 E.0178
G1 X90.881 Y132.486 E.01795
G1 X91.161 Y132.874 E.01783
G1 X91.422 Y133.28 E.01798
G1 X91.66 Y133.698 E.01789
G1 X91.875 Y134.125 E.01781
G1 X92.206 Y134.921 E.0321
G1 X92.483 Y135.834 E.03557
G1 X92.587 Y136.305 E.01796
G1 X92.665 Y136.78 E.01792
G1 X92.719 Y137.256 E.01784
G1 X92.748 Y137.736 E.01793
G1 X92.748 Y138.325 E.02194
G1 X92.721 Y138.805 E.01788
G1 X92.668 Y139.284 E.01795
G1 X92.49 Y140.222 E.03557
G1 X92.247 Y141.048 E.03208
G1 X92.078 Y141.497 E.01788
G1 X91.886 Y141.937 E.01788
G1 X91.671 Y142.367 E.01789
G1 X91.433 Y142.785 E.01791
G1 X91.113 Y143.279 E.02194
G1 X90.829 Y143.666 E.01788
G1 X90.524 Y144.039 E.01795
G1 X90.202 Y144.394 E.01786
G1 X89.86 Y144.733 E.0179
G1 X89.501 Y145.054 E.01795
G1 X89.128 Y145.352 E.01778
G1 X88.42 Y145.84 E.03202
G1 X88.008 Y146.082 E.0178
G1 X87.581 Y146.303 E.01791
G1 X87.144 Y146.502 E.0179
G1 X86.695 Y146.678 E.01794
G1 X86.239 Y146.83 E.01791
G1 X85.776 Y146.957 E.01789
G1 X85.306 Y147.06 E.0179
G1 X84.832 Y147.139 E.01791
G1 X84.354 Y147.193 E.01792
G1 X83.875 Y147.221 E.01786
G1 X83.286 Y147.222 E.02196
G1 X82.806 Y147.195 E.01788
G1 X82.329 Y147.142 E.01787
G1 X81.853 Y147.064 E.01799
G1 X81.384 Y146.963 E.01784
G1 X80.919 Y146.836 E.01796
G1 X80.466 Y146.686 E.01776
G1 X79.672 Y146.358 E.03202
G1 X79.245 Y146.145 E.01779
G1 X78.827 Y145.907 E.0179
G1 X78.332 Y145.587 E.02195
G1 X77.944 Y145.302 E.01792
G1 X77.572 Y144.998 E.0179
G1 X77.217 Y144.675 E.0179
G1 X76.878 Y144.334 E.01789
G1 X76.558 Y143.975 E.01792
G1 X76.259 Y143.602 E.01782
G1 X75.769 Y142.891 E.03216
G1 X75.308 Y142.055 E.03556
G1 X75.109 Y141.617 E.01791
G1 X74.933 Y141.169 E.01793
G1 X74.782 Y140.713 E.01791
G1 X74.654 Y140.249 E.0179
G1 X74.531 Y139.673 E.02194
G1 X74.458 Y139.199 E.01786
G1 X74.41 Y138.721 E.01789
G1 X74.387 Y138.241 E.01791
G1 X74.389 Y137.76 E.01792
G1 X74.417 Y137.279 E.01793
G1 X74.469 Y136.801 E.0179
G1 X74.546 Y136.328 E.01785
G1 X74.648 Y135.86 E.01785
G1 X74.892 Y135.033 E.03213
G1 X75.252 Y134.148 E.03559
G1 X75.467 Y133.718 E.01789
G1 X75.704 Y133.3 E.01789
G1 X76.025 Y132.805 E.022
G1 X76.309 Y132.418 E.01789
G1 X76.613 Y132.046 E.01788
G1 X76.936 Y131.69 E.0179
G1 X77.278 Y131.351 E.01794
G1 X77.637 Y131.031 E.01792
G1 X78.01 Y130.732 E.01782
G1 X78.751 Y130.227 E.0334
M204 S6000
G1 X79.008 Y130.605 F36000
G1 F3000
M204 S500
G1 X79.034 Y130.588 E.00114
G1 X79.771 Y130.186 E.03125
G1 X80.591 Y129.84 E.03317
G1 X81.463 Y129.574 E.03397
G1 X82.357 Y129.4 E.03392
G1 X82.928 Y129.34 E.02136
G1 X83.843 Y129.321 E.03412
G1 X84.656 Y129.384 E.03036
G1 X85.56 Y129.546 E.03421
G1 X86.417 Y129.794 E.03321
G1 X87.263 Y130.136 E.034
G1 X88.072 Y130.568 E.03415
G1 X88.826 Y131.077 E.03391
G1 X89.524 Y131.664 E.03393
G1 X89.926 Y132.064 E.02115
G1 X90.521 Y132.768 E.03433
G1 X91.027 Y133.511 E.03348
G1 X91.455 Y134.308 E.03368
G1 X91.772 Y135.069 E.03071
G1 X92.039 Y135.945 E.03411
G1 X92.211 Y136.836 E.03379
G1 X92.29 Y137.743 E.03392
G1 X92.291 Y138.309 E.02108
G1 X92.217 Y139.207 E.03357
G1 X92.047 Y140.108 E.03415
G1 X91.81 Y140.911 E.03119
G1 X91.475 Y141.737 E.03319
G1 X91.046 Y142.541 E.03395
G1 X90.732 Y143.026 E.0215
G1 X90.173 Y143.746 E.03396
G1 X89.552 Y144.395 E.03344
G1 X88.862 Y144.98 E.0337
G1 X88.167 Y145.459 E.03143
G1 X87.375 Y145.895 E.03369
G1 X86.546 Y146.245 E.03352
G1 X85.673 Y146.511 E.034
G1 X84.776 Y146.685 E.03401
G1 X83.869 Y146.764 E.03392
G1 X83.302 Y146.765 E.0211
G1 X82.398 Y146.69 E.03379
G1 X81.5 Y146.52 E.03404
G1 X80.634 Y146.26 E.0337
G1 X79.866 Y145.944 E.03091
G1 X79.071 Y145.52 E.03358
G1 X78.586 Y145.206 E.02152
G1 X77.865 Y144.647 E.03396
G1 X77.207 Y144.015 E.03399
G1 X76.631 Y143.336 E.03318
G1 X76.155 Y142.644 E.03126
G1 X75.719 Y141.854 E.0336
G1 X75.366 Y141.02 E.03375
G1 X75.1 Y140.148 E.03394
G1 X74.979 Y139.583 E.02152
G1 X74.866 Y138.68 E.03389
G1 X74.847 Y137.767 E.03403
G1 X74.921 Y136.87 E.03351
G1 X75.089 Y135.982 E.03368
G1 X75.327 Y135.178 E.03124
G1 X75.666 Y134.341 E.03362
G1 X76.091 Y133.544 E.03364
G1 X76.406 Y133.058 E.02157
G1 X76.964 Y132.339 E.0339
G1 X77.596 Y131.68 E.03404
G1 X78.287 Y131.096 E.03366
G1 X78.959 Y130.638 E.03029
M204 S6000
G1 X79.216 Y131.016 F36000
G1 F3000
M204 S500
G1 X79.267 Y130.982 E.00227
G1 X79.976 Y130.596 E.03007
G1 X80.74 Y130.273 E.03093
G1 X81.567 Y130.02 E.03219
G1 X82.419 Y129.854 E.03235
G1 X82.963 Y129.796 E.02034
G1 X83.837 Y129.779 E.03258
G1 X84.604 Y129.84 E.02867
G1 X85.463 Y129.994 E.0325
G1 X86.274 Y130.229 E.03144
G1 X87.063 Y130.548 E.03169
G1 X87.83 Y130.956 E.03236
G1 X88.545 Y131.439 E.03213
G1 X89.211 Y131.997 E.03237
G1 X89.586 Y132.37 E.0197
G1 X90.152 Y133.04 E.03267
G1 X90.632 Y133.743 E.0317
G1 X91.039 Y134.498 E.03197
G1 X91.339 Y135.217 E.02902
G1 X91.593 Y136.048 E.03236
G1 X91.757 Y136.892 E.03201
G1 X91.833 Y137.757 E.03236
G1 X91.834 Y138.285 E.01964
G1 X91.764 Y139.138 E.03191
G1 X91.603 Y139.994 E.03242
G1 X91.375 Y140.766 E.03
G1 X91.063 Y141.536 E.03094
G1 X90.655 Y142.304 E.03239
G1 X90.356 Y142.766 E.02049
G1 X89.822 Y143.452 E.03239
G1 X89.243 Y144.056 E.03115
G1 X88.589 Y144.612 E.03198
G1 X87.921 Y145.073 E.03024
G1 X87.181 Y145.48 E.03143
G1 X86.397 Y145.812 E.03175
G1 X85.569 Y146.065 E.03222
G1 X84.72 Y146.23 E.03223
G1 X83.854 Y146.306 E.03237
G1 X83.327 Y146.308 E.01966
G1 X82.467 Y146.237 E.03213
G1 X81.616 Y146.077 E.03226
G1 X80.793 Y145.831 E.03198
G1 X80.068 Y145.533 E.02922
G1 X79.308 Y145.129 E.03205
G1 X78.846 Y144.829 E.0205
G1 X78.17 Y144.305 E.03185
G1 X77.545 Y143.707 E.03222
G1 X76.999 Y143.063 E.03146
G1 X76.541 Y142.398 E.03008
G1 X76.134 Y141.661 E.03136
G1 X75.799 Y140.87 E.03197
G1 X75.545 Y140.039 E.03237
G1 X75.43 Y139.501 E.0205
G1 X75.322 Y138.64 E.03233
G1 X75.304 Y137.788 E.03172
G1 X75.374 Y136.939 E.03174
G1 X75.533 Y136.096 E.03195
G1 X75.761 Y135.322 E.03005
G1 X76.078 Y134.542 E.03138
G1 X76.482 Y133.782 E.03207
G1 X76.782 Y133.318 E.02055
G1 X77.315 Y132.633 E.03233
G1 X77.915 Y132.009 E.03225
G1 X78.57 Y131.457 E.03189
G1 X79.167 Y131.05 E.02691
M204 S6000
G1 X79.424 Y131.428 F36000
G1 F3000
M204 S500
G1 X79.5 Y131.376 E.0034
G1 X80.168 Y131.011 E.02838
G1 X80.89 Y130.706 E.02919
G1 X81.671 Y130.466 E.03042
G1 X82.482 Y130.308 E.03077
G1 X82.997 Y130.253 E.01932
G1 X83.83 Y130.237 E.03103
G1 X84.552 Y130.295 E.02698
G1 X85.366 Y130.442 E.03078
G1 X86.131 Y130.664 E.02967
G1 X86.862 Y130.96 E.0294
G1 X87.587 Y131.345 E.03057
G1 X88.263 Y131.8 E.03035
G1 X88.897 Y132.331 E.03081
G1 X89.245 Y132.676 E.01824
G1 X89.783 Y133.311 E.031
G1 X90.237 Y133.975 E.02993
G1 X90.623 Y134.689 E.03025
G1 X90.906 Y135.366 E.02733
G1 X91.147 Y136.152 E.03061
G1 X91.302 Y136.948 E.03022
G1 X91.375 Y137.772 E.0308
G1 X91.377 Y138.261 E.01819
G1 X91.311 Y139.07 E.03025
G1 X91.159 Y139.88 E.03068
G1 X90.945 Y140.609 E.0283
G1 X90.651 Y141.336 E.02921
G1 X90.263 Y142.067 E.03082
G1 X89.979 Y142.505 E.01946
G1 X89.48 Y143.148 E.0303
G1 X88.934 Y143.718 E.0294
G1 X88.316 Y144.244 E.03024
G1 X87.686 Y144.679 E.02853
G1 X86.988 Y145.065 E.02969
G1 X86.247 Y145.379 E.02998
G1 X85.466 Y145.619 E.03044
G1 X84.663 Y145.776 E.03045
G1 X83.839 Y145.849 E.0308
G1 X83.35 Y145.851 E.01821
G1 X82.535 Y145.784 E.03047
G1 X81.731 Y145.633 E.03048
G1 X80.952 Y145.401 E.03026
G1 X80.268 Y145.121 E.02753
G1 X79.545 Y144.737 E.0305
G1 X79.106 Y144.453 E.01948
G1 X78.464 Y143.954 E.03029
G1 X77.884 Y143.398 E.02992
G1 X77.367 Y142.79 E.02973
G1 X76.927 Y142.151 E.02889
G1 X76.543 Y141.454 E.02965
G1 X76.232 Y140.72 E.02968
G1 X75.989 Y139.93 E.03079
G1 X75.88 Y139.419 E.01947
G1 X75.778 Y138.599 E.03076
G1 X75.762 Y137.795 E.02995
G1 X75.829 Y136.993 E.02998
G1 X75.976 Y136.21 E.02968
G1 X76.191 Y135.48 E.02834
G1 X76.49 Y134.742 E.02965
G1 X76.874 Y134.019 E.0305
G1 X77.159 Y133.579 E.01953
G1 X77.666 Y132.928 E.03075
G1 X78.234 Y132.338 E.03047
G1 X78.841 Y131.826 E.02959
G1 X79.375 Y131.461 E.02407
M204 S6000
G1 X79.632 Y131.839 F36000
G1 F3000
M204 S500
G1 X79.733 Y131.77 E.00453
G1 X80.361 Y131.427 E.02668
G1 X81.04 Y131.138 E.02747
G1 X81.775 Y130.912 E.02864
G1 X82.544 Y130.761 E.02918
G1 X83.032 Y130.709 E.01828
G1 X83.823 Y130.695 E.02948
G1 X84.5 Y130.75 E.02529
G1 X85.268 Y130.889 E.02907
G1 X85.974 Y131.094 E.02739
G1 X86.662 Y131.373 E.02766
G1 X87.346 Y131.734 E.02879
G1 X87.982 Y132.162 E.02856
G1 X88.585 Y132.666 E.02925
G1 X88.905 Y132.983 E.01678
G1 X89.415 Y133.583 E.02934
G1 X89.842 Y134.207 E.02817
G1 X90.207 Y134.881 E.02852
G1 X90.473 Y135.516 E.02564
M73 P67 R3
G1 X90.701 Y136.256 E.02886
G1 X90.848 Y137.006 E.02844
G1 X90.917 Y137.788 E.02924
G1 X90.92 Y138.237 E.01675
G1 X90.858 Y139.002 E.02859
G1 X90.716 Y139.766 E.02895
G1 X90.515 Y140.452 E.0266
G1 X90.239 Y141.136 E.02747
G1 X89.871 Y141.83 E.02925
G1 X89.602 Y142.245 E.01842
G1 X89.137 Y142.843 E.02822
G1 X88.625 Y143.38 E.02765
G1 X88.043 Y143.877 E.02851
G1 X87.45 Y144.286 E.02682
G1 X86.794 Y144.65 E.02796
G1 X86.097 Y144.946 E.02821
G1 X85.361 Y145.173 E.02866
G1 X84.606 Y145.321 E.02867
G1 X83.824 Y145.391 E.02924
G1 X83.374 Y145.393 E.01677
G1 X82.603 Y145.331 E.02881
G1 X81.845 Y145.19 E.0287
G1 X81.111 Y144.972 E.02853
G1 X80.469 Y144.709 E.02584
G1 X79.782 Y144.345 E.02895
G1 X79.366 Y144.076 E.01845
G1 X78.758 Y143.602 E.02872
G1 X78.222 Y143.089 E.02764
G1 X77.735 Y142.517 E.028
G1 X77.32 Y141.916 E.02717
G1 X76.958 Y141.26 E.02792
G1 X76.665 Y140.57 E.02792
G1 X76.434 Y139.821 E.02921
G1 X76.331 Y139.337 E.01843
G1 X76.236 Y138.574 E.02864
G1 X76.22 Y137.817 E.02819
G1 X76.282 Y137.062 E.02823
G1 X76.42 Y136.324 E.02795
G1 X76.626 Y135.624 E.02716
G1 X76.902 Y134.942 E.02742
G1 X77.266 Y134.256 E.02892
G1 X77.535 Y133.839 E.01849
G1 X78.017 Y133.222 E.02915
G1 X78.552 Y132.668 E.0287
G1 X79.124 Y132.186 E.02784
G1 X79.583 Y131.873 E.02071
M204 S6000
G1 X79.841 Y132.25 F36000
G1 F3000
M204 S500
G1 X79.966 Y132.164 E.00566
G1 X80.555 Y131.842 E.02499
G1 X81.191 Y131.571 E.02573
G1 X81.88 Y131.358 E.02687
G1 X82.606 Y131.215 E.02758
G1 X83.066 Y131.166 E.01723
G1 X83.816 Y131.153 E.02791
G1 X84.447 Y131.205 E.0236
G1 X85.17 Y131.337 E.02736
G1 X85.831 Y131.53 E.02564
G1 X86.463 Y131.785 E.0254
G1 X87.104 Y132.124 E.02702
G1 X87.701 Y132.524 E.02678
G1 X88.272 Y133 E.0277
G1 X88.565 Y133.289 E.01532
G1 X89.046 Y133.856 E.02767
G1 X89.447 Y134.44 E.0264
G1 X89.791 Y135.072 E.0268
G1 X90.04 Y135.665 E.02396
G1 X90.255 Y136.361 E.02711
G1 X90.393 Y137.063 E.02666
G1 X90.46 Y137.803 E.02769
G1 X90.463 Y138.214 E.01529
G1 X90.405 Y138.935 E.02693
G1 X90.272 Y139.653 E.02722
G1 X90.085 Y140.295 E.0249
G1 X89.826 Y140.936 E.02574
G1 X89.48 Y141.593 E.02766
G1 X89.226 Y141.985 E.01739
G1 X88.795 Y142.539 E.02614
G1 X88.315 Y143.042 E.02591
G1 X87.769 Y143.51 E.02678
G1 X87.215 Y143.894 E.02511
G1 X86.599 Y144.235 E.02622
G1 X85.946 Y144.514 E.02645
G1 X85.257 Y144.727 E.02688
G1 X84.549 Y144.867 E.02688
G1 X83.808 Y144.934 E.02768
G1 X83.397 Y144.936 E.01532
G1 X82.671 Y144.878 E.02715
G1 X81.96 Y144.746 E.02693
G1 X81.27 Y144.542 E.02681
G1 X80.669 Y144.297 E.02414
G1 X80.019 Y143.954 E.02739
G1 X79.627 Y143.7 E.01741
G1 X79.063 Y143.26 E.02663
G1 X78.56 Y142.78 E.0259
G1 X78.102 Y142.243 E.02628
G1 X77.713 Y141.681 E.02546
G1 X77.373 Y141.066 E.02619
G1 X77.097 Y140.42 E.02617
G1 X76.879 Y139.711 E.02762
G1 X76.781 Y139.255 E.01739
G1 X76.693 Y138.547 E.02654
G1 X76.678 Y137.838 E.02643
G1 X76.735 Y137.13 E.02648
G1 X76.864 Y136.437 E.02622
G1 X77.056 Y135.782 E.02545
G1 X77.315 Y135.142 E.0257
G1 X77.657 Y134.493 E.02734
G1 X77.912 Y134.1 E.01744
G1 X78.358 Y133.528 E.02702
G1 X78.86 Y133.007 E.02693
G1 X79.395 Y132.555 E.0261
G1 X79.791 Y132.284 E.01789
M204 S6000
G1 X80.05 Y132.661 F36000
G1 F3000
M204 S500
G1 X80.2 Y132.558 E.00679
G1 X80.749 Y132.257 E.0233
G1 X81.342 Y132.004 E.02401
G1 X81.999 Y131.801 E.02563
G1 X82.669 Y131.668 E.02544
G1 X83.101 Y131.622 E.01617
G1 X83.808 Y131.611 E.02634
G1 X84.394 Y131.659 E.02191
G1 X85.071 Y131.784 E.02565
G1 X85.674 Y131.96 E.0234
G1 X86.264 Y132.197 E.02367
G1 X86.863 Y132.513 E.02525
G1 X87.421 Y132.886 E.025
G1 X87.96 Y133.335 E.02614
G1 X88.225 Y133.596 E.01385
G1 X88.678 Y134.128 E.02601
G1 X89.053 Y134.673 E.02464
G1 X89.375 Y135.265 E.02508
G1 X89.607 Y135.815 E.02227
G1 X89.809 Y136.466 E.02535
G1 X89.939 Y137.121 E.02489
G1 X90.003 Y137.82 E.02613
G1 X90.005 Y138.191 E.01384
G1 X89.952 Y138.868 E.02527
G1 X89.828 Y139.541 E.02549
G1 X89.654 Y140.139 E.0232
G1 X89.414 Y140.737 E.024
G1 X89.088 Y141.356 E.02606
G1 X88.849 Y141.724 E.01634
G1 X88.453 Y142.235 E.02408
G1 X88.006 Y142.705 E.02417
G1 X87.495 Y143.143 E.02505
G1 X86.979 Y143.501 E.02339
G1 X86.404 Y143.82 E.02449
G1 X85.795 Y144.081 E.02468
G1 X85.151 Y144.281 E.02511
G1 X84.491 Y144.412 E.02509
G1 X83.792 Y144.476 E.02613
G1 X83.42 Y144.479 E.01386
G1 X82.738 Y144.425 E.02549
G1 X82.073 Y144.302 E.02516
G1 X81.428 Y144.112 E.02508
G1 X80.869 Y143.885 E.02245
G1 X80.256 Y143.562 E.02582
G1 X79.887 Y143.323 E.01636
G1 X79.367 Y142.918 E.02455
G1 X78.898 Y142.47 E.02417
G1 X78.469 Y141.969 E.02455
G1 X78.106 Y141.445 E.02375
M73 P67 R2
G1 X77.788 Y140.871 E.02446
G1 X77.53 Y140.269 E.02441
G1 X77.323 Y139.602 E.02601
G1 X77.231 Y139.173 E.01634
G1 X77.149 Y138.507 E.02498
G1 X77.136 Y137.845 E.02469
G1 X77.188 Y137.197 E.0242
G1 X77.308 Y136.55 E.02449
G1 X77.486 Y135.938 E.02375
G1 X77.727 Y135.341 E.02398
G1 X78.049 Y134.73 E.02575
G1 X78.288 Y134.36 E.01639
G1 X78.709 Y133.823 E.02542
G1 X79.178 Y133.337 E.02516
G1 X79.667 Y132.924 E.02383
G1 X80 Y132.695 E.01507
M204 S6000
G1 X80.259 Y133.072 F36000
G1 F3000
M204 S500
G1 X80.435 Y132.952 E.00794
G1 X80.943 Y132.671 E.02162
G1 X81.492 Y132.436 E.02226
G1 X82.104 Y132.246 E.02386
G1 X82.732 Y132.122 E.02382
G1 X83.135 Y132.079 E.01509
G1 X83.799 Y132.069 E.02475
G1 X84.34 Y132.114 E.02021
G1 X84.972 Y132.231 E.02395
G1 X85.531 Y132.395 E.02168
G1 X86.065 Y132.61 E.02145
G1 X86.623 Y132.903 E.02347
G1 X87.141 Y133.249 E.02322
G1 X87.649 Y133.671 E.02459
G1 X87.886 Y133.904 E.01238
G1 X88.31 Y134.401 E.02435
G1 X88.659 Y134.907 E.02288
G1 X88.959 Y135.457 E.02336
G1 X89.175 Y135.966 E.02057
G1 X89.363 Y136.571 E.02361
G1 X89.484 Y137.18 E.02311
G1 X89.545 Y137.837 E.02458
G1 X89.548 Y138.169 E.01238
G1 X89.498 Y138.801 E.02362
G1 X89.384 Y139.429 E.02376
G1 X89.223 Y139.983 E.0215
G1 X89.001 Y140.538 E.02227
G1 X88.696 Y141.119 E.02446
G1 X88.473 Y141.464 E.01528
G1 X88.11 Y141.931 E.02203
G1 X87.695 Y142.368 E.02244
G1 X87.22 Y142.776 E.02332
G1 X86.743 Y143.109 E.02168
G1 X86.209 Y143.406 E.02276
G1 X85.644 Y143.649 E.02291
G1 X85.046 Y143.835 E.02333
G1 X84.432 Y143.958 E.0233
G1 X83.775 Y144.019 E.02458
G1 X83.442 Y144.022 E.01239
G1 X82.804 Y143.971 E.02383
G1 X82.187 Y143.858 E.02339
G1 X81.585 Y143.682 E.02336
G1 X81.068 Y143.473 E.02076
G1 X80.493 Y143.17 E.02423
G1 X80.148 Y142.947 E.01531
G1 X79.672 Y142.576 E.02247
G1 X79.235 Y142.161 E.02244
G1 X78.836 Y141.695 E.02282
G1 X78.499 Y141.21 E.02203
G1 X78.202 Y140.676 E.02273
G1 X77.962 Y140.117 E.02266
G1 X77.768 Y139.492 E.02439
G1 X77.682 Y139.091 E.01527
G1 X77.607 Y138.481 E.02288
G1 X77.593 Y137.865 E.02295
G1 X77.641 Y137.264 E.02246
G1 X77.752 Y136.663 E.02277
G1 X77.917 Y136.095 E.02205
G1 X78.14 Y135.54 E.02225
G1 X78.441 Y134.966 E.02415
G1 X78.665 Y134.621 E.01532
G1 X79.059 Y134.118 E.02382
G1 X79.496 Y133.666 E.0234
G1 X79.95 Y133.284 E.0221
G1 X80.209 Y133.106 E.01173
M204 S6000
G1 X80.48 Y133.515 F36000
G1 F3000
M204 S500
G1 X80.988 Y133.179 E.02269
G1 X81.963 Y132.776 E.03929
G1 X82.939 Y132.575 E.03712
G1 X84.083 Y132.563 E.04258
G1 X85.098 Y132.753 E.03849
G1 X86.127 Y133.168 E.04131
G1 X87.01 Y133.745 E.0393
G1 X87.812 Y134.537 E.04198
G1 X88.394 Y135.389 E.03844
G1 X88.805 Y136.337 E.03848
G1 X89.037 Y137.414 E.04103
G1 X89.048 Y138.554 E.04246
G1 X88.857 Y139.576 E.03871
G1 X88.477 Y140.539 E.03856
G1 X87.879 Y141.465 E.04105
G1 X87.08 Y142.28 E.04253
G1 X86.227 Y142.864 E.03852
G1 X85.21 Y143.296 E.04113
G1 X84.11 Y143.519 E.04182
G1 X82.984 Y143.514 E.04194
G1 X81.868 Y143.275 E.04252
G1 X80.819 Y142.809 E.04275
G1 X80.027 Y142.261 E.03587
G1 X79.285 Y141.503 E.03952
G1 X78.684 Y140.58 E.04103
G1 X78.285 Y139.59 E.03973
G1 X78.095 Y138.644 E.03596
G1 X78.09 Y137.525 E.04167
G1 X78.28 Y136.511 E.03843
G1 X78.693 Y135.489 E.04106
G1 X79.319 Y134.545 E.04217
G1 X80.079 Y133.781 E.04015
G1 X80.43 Y133.549 E.01569
M204 S6000
G1 X80.684 Y133.924 F36000
G1 F3000
M204 S500
G1 X81.157 Y133.604 E.02126
G1 X82.043 Y133.226 E.03589
G1 X83.045 Y133.02 E.0381
G1 X84.094 Y133.02 E.03909
G1 X85.022 Y133.203 E.03522
G1 X85.962 Y133.595 E.03793
G1 X86.767 Y134.132 E.03604
G1 X87.496 Y134.867 E.03856
G1 X88.021 Y135.653 E.03519
G1 X88.388 Y136.526 E.03528
G1 X88.592 Y137.518 E.03773
G1 X88.591 Y138.566 E.03902
G1 X88.407 Y139.499 E.03542
G1 X88.049 Y140.378 E.03535
G1 X87.491 Y141.223 E.03774
G1 X86.749 Y141.965 E.03908
G1 X85.962 Y142.492 E.03526
G1 X85.025 Y142.878 E.03777
G1 X84.012 Y143.073 E.03843
G1 X82.978 Y143.057 E.0385
G1 X81.956 Y142.827 E.03904
G1 X80.998 Y142.389 E.03921
G1 X80.281 Y141.881 E.03272
G1 X79.606 Y141.178 E.03632
G1 X79.062 Y140.324 E.0377
G1 X78.707 Y139.413 E.03641
G1 X78.542 Y138.546 E.03287
G1 X78.547 Y137.515 E.0384
G1 X78.73 Y136.588 E.03523
G1 X79.119 Y135.653 E.03772
G1 X79.704 Y134.792 E.03875
G1 X80.324 Y134.167 E.03281
G1 X80.634 Y133.957 E.01393
M204 S6000
G1 X80.882 Y134.333 F36000
G1 F3000
M204 S500
G1 X81.418 Y133.979 E.02393
G1 X82.229 Y133.644 E.03268
G1 X83.144 Y133.466 E.03474
G1 X84.101 Y133.477 E.03561
G1 X84.94 Y133.653 E.03195
G1 X85.792 Y134.019 E.03455
G1 X86.519 Y134.516 E.03278
G1 X87.176 Y135.193 E.03515
G1 X87.644 Y135.912 E.03195
G1 X87.97 Y136.709 E.03208
G1 X88.146 Y137.617 E.03443
G1 X88.134 Y138.572 E.03557
G1 X87.957 Y139.416 E.03213
G1 X87.623 Y140.212 E.03214
G1 X87.106 Y140.978 E.03444
G1 X86.421 Y141.646 E.03563
G1 X85.702 Y142.116 E.03199
G1 X84.844 Y142.459 E.03442
G1 X83.918 Y142.625 E.03503
G1 X82.978 Y142.6 E.03505
G1 X82.049 Y142.379 E.03555
G1 X81.183 Y141.971 E.03566
G1 X80.54 Y141.505 E.02958
G1 X79.931 Y140.856 E.03314
G1 X79.444 Y140.073 E.03436
G1 X79.13 Y139.241 E.03309
G1 X78.989 Y138.454 E.02978
G1 X79.004 Y137.511 E.03515
G1 X79.18 Y136.67 E.03201
G1 X79.544 Y135.822 E.03437
G1 X80.085 Y135.043 E.03531
G1 X80.653 Y134.484 E.02969
G1 X80.832 Y134.366 E.00797
M204 S6000
G1 X81.075 Y134.743 F36000
G1 F3000
M204 S500
G1 X81.675 Y134.357 E.02659
G1 X82.41 Y134.064 E.02946
G1 X83.239 Y133.913 E.03138
G1 X84.101 Y133.934 E.03213
G1 X84.852 Y134.102 E.02868
G1 X85.618 Y134.442 E.03119
G1 X86.266 Y134.897 E.02952
G1 X86.852 Y135.516 E.03173
M73 P68 R2
G1 X87.265 Y136.166 E.0287
G1 X87.549 Y136.888 E.02889
G1 X87.698 Y137.711 E.03114
G1 X87.677 Y138.572 E.03211
G1 X87.509 Y139.328 E.02884
G1 X87.199 Y140.041 E.02893
G1 X86.723 Y140.728 E.03114
G1 X86.098 Y141.323 E.03217
G1 X85.447 Y141.737 E.02872
G1 X84.668 Y142.037 E.03107
G1 X83.831 Y142.177 E.03163
G1 X82.983 Y142.143 E.03159
G1 X82.148 Y141.933 E.03207
G1 X81.373 Y141.555 E.03211
G1 X80.804 Y141.132 E.02644
G1 X80.26 Y140.538 E.02998
G1 X79.829 Y139.826 E.03101
G1 X79.556 Y139.075 E.02977
G1 X79.438 Y138.368 E.0267
G1 X79.461 Y137.511 E.03192
G1 X79.629 Y136.757 E.02877
G1 X79.967 Y135.996 E.03103
G1 X80.464 Y135.3 E.03186
G1 X80.978 Y134.805 E.02657
G1 X81.024 Y134.776 E.00204
M204 S6000
G1 X81.298 Y135.132 F36000
G1 F3000
M204 S500
G1 X81.927 Y134.739 E.0276
G1 X82.584 Y134.486 E.02624
G1 X83.326 Y134.362 E.02802
G1 X84.095 Y134.391 E.02864
G1 X84.758 Y134.549 E.02541
G1 X85.437 Y134.861 E.02783
G1 X86.009 Y135.274 E.02626
G1 X86.523 Y135.834 E.02831
G1 X86.881 Y136.415 E.02545
G1 X87.126 Y137.061 E.02572
G1 X87.25 Y137.798 E.02783
G1 X87.22 Y138.566 E.02864
G1 X87.062 Y139.234 E.02554
G1 X86.778 Y139.864 E.02575
G1 X86.344 Y140.472 E.02783
G1 X85.779 Y140.996 E.02869
G1 X85.197 Y141.354 E.02544
G1 X84.499 Y141.612 E.02774
G1 X83.749 Y141.727 E.02823
G1 X82.996 Y141.686 E.02812
G1 X82.254 Y141.489 E.02858
G1 X81.57 Y141.143 E.02856
G1 X81.073 Y140.762 E.0233
G1 X80.593 Y140.225 E.02685
G1 X80.217 Y139.585 E.02763
G1 X79.984 Y138.914 E.02645
G1 X79.888 Y138.288 E.02361
G1 X79.918 Y137.517 E.02872
G1 X80.076 Y136.851 E.02548
G1 X80.387 Y136.176 E.0277
G1 X80.838 Y135.561 E.0284
G1 X81.255 Y135.172 E.02122
M204 S6000
G1 X81.561 Y135.51 F36000
G1 F3000
M204 S500
G1 X81.613 Y135.463 E.00265
G1 X82.173 Y135.124 E.02438
G1 X82.753 Y134.911 E.023
G1 X83.407 Y134.811 E.02465
G1 X84.081 Y134.848 E.02514
G1 X84.657 Y134.995 E.02214
G1 X85.25 Y135.278 E.02449
G1 X85.745 Y135.647 E.02299
G1 X86.19 Y136.146 E.02489
G1 X86.494 Y136.658 E.02218
G1 X86.7 Y137.228 E.02256
G1 X86.8 Y137.879 E.02453
G1 X86.763 Y138.553 E.02515
G1 X86.616 Y139.132 E.02224
G1 X86.359 Y139.681 E.02258
G1 X85.969 Y140.211 E.02453
G1 X85.465 Y140.663 E.0252
G1 X84.954 Y140.967 E.02216
G1 X84.336 Y141.185 E.02442
G1 X83.675 Y141.276 E.02482
G1 X83.016 Y141.23 E.02464
G1 X82.367 Y141.046 E.02511
G1 X81.773 Y140.733 E.025
G1 X81.348 Y140.397 E.02018
G1 X80.989 Y139.998 E.01998
G1 X80.65 Y139.438 E.02439
G1 X80.437 Y138.858 E.02302
G1 X80.338 Y138.206 E.02457
G1 X80.375 Y137.531 E.02518
G1 X80.521 Y136.953 E.0222
G1 X80.804 Y136.362 E.02438
G1 X81.209 Y135.829 E.02494
G1 X81.516 Y135.551 E.01544
M204 S6000
G1 X81.815 Y135.893 F36000
G1 F3000
M204 S500
G1 X81.922 Y135.8 E.00528
G1 X82.413 Y135.512 E.02121
G1 X82.913 Y135.339 E.01971
G1 X83.48 Y135.263 E.02129
G1 X84.059 Y135.305 E.02162
G1 X84.547 Y135.438 E.01886
G1 X85.056 Y135.692 E.02118
G1 X85.474 Y136.016 E.01969
G1 X85.851 Y136.453 E.02149
G1 X86.102 Y136.894 E.01891
G1 X86.272 Y137.387 E.01943
G1 X86.349 Y137.952 E.02123
G1 X86.307 Y138.531 E.02163
G1 X86.173 Y139.021 E.01894
G1 X85.944 Y139.49 E.01944
G1 X85.598 Y139.944 E.02123
G1 X85.158 Y140.325 E.02168
G1 X84.718 Y140.576 E.01888
G1 X84.18 Y140.756 E.02114
G1 X83.61 Y140.824 E.02138
G1 X83.044 Y140.774 E.02114
G1 X82.488 Y140.605 E.02164
G1 X81.984 Y140.328 E.02144
G1 X81.631 Y140.038 E.01701
G1 X81.326 Y139.689 E.01725
G1 X81.039 Y139.198 E.0212
G1 X80.865 Y138.697 E.01974
G1 X80.789 Y138.133 E.02122
G1 X80.831 Y137.553 E.02166
G1 X80.965 Y137.063 E.01892
G1 X81.218 Y136.556 E.0211
G1 X81.574 Y136.103 E.02145
G1 X81.77 Y135.933 E.00967
M204 S6000
G1 X82.06 Y136.28 F36000
G1 F3000
M204 S500
G1 X82.223 Y136.144 E.00789
G1 X82.647 Y135.905 E.01813
G1 X83.064 Y135.77 E.01634
G1 X83.543 Y135.715 E.01797
G1 X84.026 Y135.76 E.01807
G1 X84.428 Y135.879 E.01558
G1 X84.854 Y136.102 E.01792
G1 X85.196 Y136.378 E.01635
G1 X85.506 Y136.752 E.01811
G1 X85.706 Y137.12 E.01559
G1 X85.841 Y137.538 E.01635
G1 X85.896 Y138.016 E.01791
G1 X85.851 Y138.499 E.01808
G1 X85.732 Y138.901 E.01563
G1 X85.532 Y139.292 E.01635
G1 X85.233 Y139.669 E.01791
G1 X84.859 Y139.98 E.01812
G1 X84.491 Y140.179 E.0156
G1 X84.032 Y140.323 E.0179
G1 X83.554 Y140.37 E.01791
G1 X83.178 Y140.337 E.01403
G1 X82.71 Y140.206 E.01812
G1 X82.284 Y139.983 E.01791
G1 X81.912 Y139.678 E.0179
G1 X81.67 Y139.389 E.01404
G1 X81.432 Y138.964 E.01812
G1 X81.297 Y138.547 E.01636
G1 X81.242 Y138.069 E.01791
G1 X81.287 Y137.585 E.01811
G1 X81.406 Y137.182 E.01563
G1 X81.628 Y136.758 E.01786
G1 X81.934 Y136.386 E.01793
G1 X82.014 Y136.318 E.00391
; WIPE_START
G1 X82.223 Y136.144 E-.10328
G1 X82.647 Y135.905 E-.18495
G1 X83.064 Y135.77 E-.1667
G1 X83.543 Y135.715 E-.18332
G1 X83.862 Y135.745 E-.12175
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X81.823 Y137.98 Z.6 F36000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X81.822 Y137.951 E.00108
G3 X83.57 Y136.292 I1.747 J.091 E.09898
G1 X83.66 Y136.295 E.00338
G3 X81.841 Y138.316 I-.091 J1.747 E.29345
G1 X81.826 Y138.04 E.0103
M204 S6000
G1 X82.278 Y137.975 F36000
; FEATURE: Inner wall
G1 F3000
M204 S500
G3 X83.569 Y136.75 I1.291 J.067 E.07312
G1 X83.637 Y136.751 E.0025
G3 X82.277 Y138.035 I-.068 J1.291 E.22461
; WIPE_START
G1 X82.32 Y137.708 E-.12523
G1 X82.417 Y137.455 E-.10285
G1 X82.523 Y137.282 E-.07698
G1 X82.704 Y137.082 E-.10266
G1 X82.922 Y136.923 E-.10275
G1 X83.105 Y136.836 E-.07703
G1 X83.367 Y136.766 E-.10271
G1 X83.55 Y136.751 E-.0698
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.667 Y137.93 F36000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5914
G1 F6300
M204 S500
G1 X83.975 Y137.237 E.04376
G2 X83.188 Y137.226 I-.405 J.845 E.03628
G1 X84.385 Y138.423 E.07563
G3 X84.01 Y138.824 I-.774 J-.347 E.02498
G1 X82.785 Y137.599 E.07746
G2 X82.709 Y138.298 I.812 J.442 E.03226
G1 X83.558 Y139.147 E.05367
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X82.709 Y138.298 E-.45633
G1 X82.678 Y138.183 E-.04518
G1 X82.668 Y137.995 E-.0716
G1 X82.697 Y137.809 E-.07155
G1 X82.785 Y137.599 E-.08658
G1 X82.838 Y137.652 E-.02876
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/50
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S204
; open powerlost recovery
M1003 S1
; OBJECT_ID: 136
M204 S10000
G17
G3 Z.6 I-.598 J-1.06 P1  F36000
G1 X82.173 Y138.028 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.202 Y137.752 E.00918
G3 X83.642 Y136.647 I1.367 J.29 E.06555
G3 X83.715 Y139.432 I-.074 J1.396 E.13835
G3 X82.172 Y138.087 I-.146 J-1.39 E.07617
M204 S10000
G1 X81.785 Y137.987 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.818 Y137.671 E.00977
G3 X83.662 Y136.255 I1.751 J.372 E.07774
M73 P69 R2
G3 X83.756 Y139.822 I-.094 J1.787 E.16411
G3 X81.779 Y138.047 I-.187 J-1.78 E.09201
; WIPE_START
G1 F9000
M204 S6000
G1 X81.818 Y137.671 E-.14364
G1 X81.934 Y137.314 E-.14225
G1 X82.068 Y137.067 E-.10676
G1 X82.303 Y136.777 E-.14216
G1 X82.594 Y136.541 E-.14224
G1 X82.788 Y136.442 E-.08296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.52 Y138.246 F36000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46222
G1 F1200
M204 S6000
G1 X83.698 Y138.219 E.00613
G1 X83.792 Y138.054 E.00651
G1 X83.721 Y137.898 E.00587
G1 X83.544 Y137.821 E.00658
G1 X83.376 Y137.931 E.00688
G1 X83.368 Y138.136 E.007
G1 X83.472 Y138.211 E.00437
M204 S10000
G1 X84.188 Y138.002 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.102 Y137.721 E.00904
G1 X83.842 Y137.483 E.01083
G1 X83.471 Y137.426 E.01152
G1 X83.136 Y137.595 E.01152
G1 X82.984 Y137.832 E.00867
G1 X82.958 Y138.161 E.01013
G1 X83.036 Y138.364 E.00668
G1 X83.297 Y138.603 E.01087
G1 X83.646 Y138.66 E.01086
G1 X83.97 Y138.518 E.01086
G1 X84.172 Y138.204 E.01147
G1 X84.184 Y138.062 E.0044
M204 S10000
G1 X84.312 Y137.395 F36000
G1 F1200
M204 S6000
G1 X84.068 Y137.178 E.01003
G1 X83.616 Y137.04 E.0145
G1 X83.214 Y137.104 E.01251
G1 X82.892 Y137.302 E.0116
G1 X82.652 Y137.634 E.0126
G1 X82.585 Y137.967 E.01044
G1 X82.61 Y138.319 E.01085
G1 X82.725 Y138.584 E.00887
G1 X83.07 Y138.907 E.01452
G1 X83.524 Y139.044 E.01456
G1 X83.814 Y139 E.00902
G1 X84.156 Y138.849 E.01148
G1 X84.466 Y138.491 E.01456
G1 X84.571 Y138.095 E.01261
G2 X84.506 Y137.683 I-1.459 J.02 E.01285
G1 X84.346 Y137.444 E.00882
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.506 Y137.683 E-.1091
G1 X84.571 Y138.095 E-.15842
G1 X84.466 Y138.491 E-.15589
G1 X84.156 Y138.849 E-.18001
G1 X83.814 Y139 E-.14199
G1 X83.776 Y139.006 E-.01459
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/50
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z.8 I.639 J-1.036 P1  F36000
G1 X82.174 Y138.018 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.204 Y137.752 E.00887
G3 X83.573 Y136.645 I1.367 J.29 E.06321
G1 X83.642 Y136.646 E.00227
G3 X82.174 Y138.078 I-.071 J1.396 E.21493
M204 S10000
G1 X81.783 Y137.977 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.784 Y137.949 E.00087
G3 X83.574 Y136.253 I1.787 J.093 E.08359
G1 X83.662 Y136.255 E.00272
G3 X81.804 Y138.322 I-.091 J1.787 E.2477
G1 X81.786 Y138.037 E.00877
; WIPE_START
G1 F9000
M204 S6000
G1 X81.784 Y137.949 E-.03351
G1 X81.818 Y137.67 E-.10669
G1 X81.934 Y137.314 E-.14216
G1 X82.121 Y136.99 E-.14226
G1 X82.371 Y136.712 E-.14218
G1 X82.674 Y136.492 E-.14223
G1 X82.795 Y136.434 E-.05097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.11 Y138.457 F36000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.407 Y138.645 E.0108
G1 X83.71 Y138.647 E.00932
G1 X83.982 Y138.502 E.00948
G1 X84.172 Y138.204 E.01084
G1 X84.188 Y138.002 E.00622
G1 X84.1 Y137.717 E.00916
G1 X83.842 Y137.483 E.01071
G1 X83.471 Y137.426 E.01152
G1 X83.136 Y137.595 E.01153
G1 X82.984 Y137.832 E.00867
G1 X82.958 Y138.161 E.01014
G1 X83.083 Y138.404 E.00838
M204 S10000
G1 X83.721 Y137.897 F36000
; LINE_WIDTH: 0.46219
G1 F1200
M204 S6000
G1 X83.544 Y137.821 E.0066
G1 X83.376 Y137.931 E.00687
G1 X83.358 Y138.099 E.00577
G1 X83.514 Y138.259 E.00766
G1 X83.641 Y138.244 E.00435
G1 X83.786 Y138.096 E.00707
G2 X83.75 Y137.95 I-.13 J-.046 E.00545
M204 S10000
G1 X84.31 Y137.392 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.068 Y137.178 E.00992
G1 X83.616 Y137.04 E.01452
G1 X83.214 Y137.104 E.01251
M73 P70 R2
G1 X82.892 Y137.302 E.0116
G1 X82.652 Y137.634 E.0126
G2 X82.605 Y138.301 I1.25 J.423 E.02076
G1 X82.826 Y138.714 E.0144
G1 X83.12 Y138.939 E.01138
G1 X83.517 Y139.044 E.01261
G1 X83.921 Y138.981 E.01258
G1 X84.239 Y138.787 E.01145
G1 X84.465 Y138.492 E.01143
G1 X84.571 Y138.095 E.01262
G2 X84.506 Y137.683 I-1.461 J.02 E.01285
G1 X84.344 Y137.442 E.00894
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.506 Y137.683 E-.11051
G1 X84.571 Y138.095 E-.15832
G1 X84.465 Y138.492 E-.15608
G1 X84.239 Y138.787 E-.14135
G1 X83.921 Y138.981 E-.14157
G1 X83.785 Y139.002 E-.05218
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/50
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z1 I.657 J-1.024 P1  F36000
G1 X82.176 Y137.97 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.575 Y136.645 I1.396 J.073 E.07053
G1 X83.642 Y136.647 E.0022
G3 X82.174 Y138.03 I-.07 J1.396 E.21654
M204 S10000
G1 X81.785 Y137.981 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.822 Y137.671 E.00959
G3 X83.576 Y136.253 I1.751 J.371 E.07499
G1 X83.662 Y136.255 E.00266
G3 X81.783 Y138.042 I-.09 J1.787 E.25636
G1 X81.783 Y138.041 E.00004
; WIPE_START
G1 F9000
M204 S6000
G1 X81.822 Y137.671 E-.14139
G1 X81.934 Y137.314 E-.142
G1 X82.068 Y137.067 E-.10677
G1 X82.303 Y136.777 E-.14217
G1 X82.594 Y136.541 E-.14224
G1 X82.794 Y136.439 E-.08544
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.217 Y138.785 F36000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.433 Y138.541 E.01004
G1 X84.571 Y138.087 E.01456
G2 X84.506 Y137.683 I-1.38 J.014 E.01263
G2 X84.068 Y137.178 I-1.185 J.585 E.02075
G1 X83.616 Y137.04 E.01451
G1 X83.323 Y137.084 E.00912
G1 X82.966 Y137.246 E.01202
G1 X82.757 Y137.453 E.00903
G1 X82.589 Y137.829 E.01266
G1 X82.605 Y138.301 E.01452
G1 X82.826 Y138.714 E.01439
G1 X83.12 Y138.939 E.01137
G1 X83.516 Y139.044 E.01261
G1 X83.928 Y138.979 E.01282
G1 X84.167 Y138.819 E.00883
M204 S10000
G1 X83.773 Y138.091 F36000
; LINE_WIDTH: 0.4622
G1 F1200
M204 S6000
G1 X83.79 Y138.011 E.00279
G1 X83.678 Y137.853 E.00662
G1 X83.498 Y137.845 E.00615
G1 X83.38 Y137.924 E.00487
G1 X83.358 Y138.099 E.00603
G1 X83.515 Y138.259 E.00766
G1 X83.663 Y138.243 E.00508
G1 X83.738 Y138.139 E.00436
M204 S10000
G1 X83.11 Y138.457 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.407 Y138.645 E.0108
G1 X83.667 Y138.659 E.00798
G1 X83.891 Y138.575 E.00735
G1 X84.129 Y138.314 E.01087
G1 X84.188 Y137.99 E.0101
G1 X84.102 Y137.72 E.0087
G1 X83.842 Y137.483 E.01081
G1 X83.491 Y137.425 E.01092
G1 X83.151 Y137.578 E.01147
G1 X82.984 Y137.832 E.00934
G1 X82.958 Y138.161 E.01015
G1 X83.083 Y138.404 E.00838
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X82.958 Y138.161 E-.10358
G1 X82.984 Y137.832 E-.12551
G1 X83.151 Y137.578 E-.11548
G1 X83.491 Y137.425 E-.14187
G1 X83.842 Y137.483 E-.1351
G1 X84.102 Y137.72 E-.13371
G1 X84.105 Y137.732 E-.00475
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z1.2 I-.149 J-1.208 P1  F36000
G1 X82.177 Y137.97 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.577 Y136.645 I1.396 J.073 E.07055
G1 X83.642 Y136.647 E.00215
G3 X82.175 Y138.03 I-.069 J1.396 E.21657
M204 S10000
G1 X81.782 Y137.972 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.786 Y137.949 E.00071
G3 X83.578 Y136.253 I1.787 J.093 E.08365
G1 X83.662 Y136.255 E.0026
G3 X81.806 Y138.322 I-.089 J1.787 E.24777
G1 X81.786 Y138.032 E.00892
; WIPE_START
G1 F9000
M204 S6000
G1 X81.786 Y137.949 E-.03143
G1 X81.84 Y137.579 E-.1421
G1 X81.934 Y137.314 E-.10675
G1 X82.121 Y136.99 E-.14212
G1 X82.371 Y136.712 E-.14226
G1 X82.674 Y136.492 E-.14217
G1 X82.8 Y136.432 E-.05317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.641 Y138.244 F36000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46214
G1 F1200
M204 S6000
G1 X83.786 Y138.097 E.00706
G1 X83.79 Y138.011 E.00292
G1 X83.687 Y137.855 E.00639
G1 X83.519 Y137.827 E.00582
G1 X83.381 Y137.925 E.00578
G1 X83.352 Y138.09 E.00573
G1 X83.511 Y138.259 E.00791
G1 X83.581 Y138.251 E.00241
M204 S10000
G1 X84.109 Y137.761 F36000
; LINE_WIDTH: 0.41999
M73 P71 R2
G1 F1200
M204 S6000
G1 X83.936 Y137.537 E.0087
G1 X83.581 Y137.42 E.01148
G1 X83.365 Y137.454 E.00672
G1 X83.064 Y137.675 E.01149
G1 X82.946 Y138.032 E.01153
G1 X82.98 Y138.244 E.00661
G1 X83.109 Y138.456 E.00762
G1 X83.407 Y138.645 E.01085
G1 X83.711 Y138.647 E.00932
G1 X83.982 Y138.502 E.00947
G1 X84.172 Y138.204 E.01085
G2 X84.129 Y137.818 I-.473 J-.143 E.01227
M204 S10000
G1 X84.564 Y137.971 F36000
G1 F1200
M204 S6000
G1 X84.507 Y137.688 E.00887
G1 X84.309 Y137.366 E.0116
G1 X83.983 Y137.129 E.01238
G1 X83.616 Y137.04 E.0116
G1 X83.214 Y137.104 E.01251
G1 X82.892 Y137.302 E.01161
G1 X82.655 Y137.63 E.01244
G1 X82.567 Y137.998 E.01161
G1 X82.63 Y138.395 E.01235
G1 X82.824 Y138.713 E.01145
G1 X83.119 Y138.939 E.01141
G1 X83.516 Y139.044 E.01264
G1 X83.921 Y138.981 E.01259
G1 X84.239 Y138.787 E.01144
G1 X84.466 Y138.491 E.01145
G1 X84.571 Y138.095 E.01259
G1 X84.568 Y138.031 E.00197
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.571 Y138.095 E-.02441
G1 X84.466 Y138.491 E-.15574
G1 X84.239 Y138.787 E-.14165
G1 X83.921 Y138.981 E-.14151
G1 X83.516 Y139.044 E-.15572
G1 X83.158 Y138.949 E-.14098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z1.4 I.86 J-.861 P1  F36000
G1 X82.178 Y137.97 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.579 Y136.645 I1.396 J.073 E.07058
G1 X83.642 Y136.647 E.00208
G3 X82.176 Y138.03 I-.068 J1.396 E.2166
M204 S10000
G1 X81.782 Y137.969 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.787 Y137.949 E.00062
G3 X83.58 Y136.253 I1.787 J.093 E.08368
G1 X83.662 Y136.255 E.00254
G3 X81.807 Y138.322 I-.088 J1.787 E.2478
G1 X81.786 Y138.029 E.00902
; WIPE_START
G1 F9000
M204 S6000
G1 X81.787 Y137.949 E-.03023
G1 X81.84 Y137.579 E-.14207
G1 X81.974 Y137.23 E-.1422
G1 X82.121 Y136.99 E-.10666
G1 X82.371 Y136.712 E-.14224
G1 X82.674 Y136.492 E-.14225
G1 X82.803 Y136.431 E-.05435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.312 Y137.395 F36000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.068 Y137.178 E.01003
G1 X83.621 Y137.042 E.01435
G1 X83.252 Y137.091 E.01144
G1 X82.897 Y137.297 E.0126
G1 X82.655 Y137.63 E.01267
G1 X82.567 Y137.997 E.01161
G1 X82.631 Y138.397 E.01243
G1 X82.828 Y138.719 E.0116
G1 X83.161 Y138.959 E.01261
G2 X83.827 Y139.006 I.423 J-1.253 E.02074
G1 X84.239 Y138.787 E.01435
G1 X84.466 Y138.491 E.01145
G1 X84.571 Y138.095 E.0126
G2 X84.506 Y137.683 I-1.46 J.02 E.01286
G1 X84.346 Y137.444 E.00882
M204 S10000
G1 X83.678 Y138.221 F36000
; LINE_WIDTH: 0.46213
G1 F1200
M204 S6000
G1 X83.786 Y138.097 E.00563
G1 X83.791 Y138.023 E.00253
G1 X83.721 Y137.898 E.00489
G1 X83.58 Y137.829 E.00535
G1 X83.408 Y137.887 E.00618
G1 X83.35 Y138.087 E.00711
G1 X83.487 Y138.25 E.00727
G1 X83.619 Y138.23 E.00455
M204 S10000
G1 X83.982 Y138.502 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.172 Y138.204 E.01085
G1 X84.188 Y138.002 E.00623
G1 X84.102 Y137.721 E.00904
G1 X83.842 Y137.483 E.01082
G1 X83.601 Y137.425 E.00761
G1 X83.257 Y137.502 E.01084
G1 X83.041 Y137.715 E.00934
G1 X82.946 Y138.032 E.01015
G1 X82.981 Y138.246 E.00667
G1 X83.202 Y138.547 E.01148
G1 X83.419 Y138.647 E.00735
G1 X83.771 Y138.631 E.01081
G1 X83.931 Y138.533 E.00577
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.771 Y138.631 E-.07138
G1 X83.419 Y138.647 E-.13373
G1 X83.202 Y138.547 E-.09091
G1 X82.981 Y138.246 E-.14195
G1 X82.946 Y138.032 E-.0825
G1 X83.041 Y137.715 E-.12551
G1 X83.254 Y137.504 E-.11403
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z1.6 I-.483 J-1.117 P1  F36000
M73 P72 R2
G1 X82.177 Y137.97 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.65 Y136.647 I1.395 J.073 E.07295
G1 X83.715 Y136.652 E.00216
G3 X82.176 Y138.03 I-.142 J1.39 E.21414
M204 S10000
G1 X81.782 Y137.966 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.783 Y137.949 E.00054
G3 X83.665 Y136.255 I1.787 J.093 E.08642
G1 X83.756 Y136.262 E.0028
G3 X81.803 Y138.322 I-.185 J1.78 E.24479
G1 X81.786 Y138.026 E.0091
; WIPE_START
G1 F9000
M204 S6000
G1 X81.783 Y137.949 E-.0294
G1 X81.84 Y137.579 E-.14221
G1 X81.935 Y137.312 E-.10775
G1 X82.121 Y136.99 E-.1412
G1 X82.371 Y136.712 E-.14215
G1 X82.674 Y136.492 E-.1422
G1 X82.806 Y136.433 E-.05509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.778 Y138.058 F36000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46183
G1 F1200
M204 S6000
G1 X83.726 Y137.885 E.00618
G1 X83.532 Y137.824 E.00695
G1 X83.357 Y137.972 E.00782
G1 X83.363 Y138.104 E.00451
G1 X83.502 Y138.256 E.00702
G1 X83.71 Y138.216 E.00725
G1 X83.767 Y138.116 E.00393
M204 S10000
G1 X84.175 Y138.088 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.137 Y137.82 E.00834
G1 X84.022 Y137.617 E.00715
G1 X83.869 Y137.497 E.00596
G1 X83.504 Y137.421 E.01148
G1 X83.18 Y137.562 E.01085
G1 X82.973 Y137.855 E.01101
G1 X82.957 Y138.152 E.00915
G1 X83.089 Y138.432 E.0095
G1 X83.377 Y138.636 E.01086
G1 X83.613 Y138.663 E.00729
G1 X83.961 Y138.528 E.01148
G1 X84.142 Y138.283 E.00935
G1 X84.165 Y138.148 E.00422
M204 S10000
G1 X84.551 Y138.117 F36000
G1 F1200
M204 S6000
G1 X84.565 Y137.936 E.00559
G1 X84.459 Y137.581 E.01138
G1 X84.2 Y137.262 E.0126
G1 X83.896 Y137.112 E.01043
G1 X83.549 Y137.044 E.01086
G1 X83.266 Y137.086 E.0088
G1 X82.938 Y137.264 E.01145
G1 X82.697 Y137.547 E.01142
G1 X82.571 Y137.937 E.01261
G1 X82.613 Y138.345 E.01261
G1 X82.79 Y138.673 E.01145
G1 X83.068 Y138.911 E.01123
G1 X83.464 Y139.04 E.01279
G2 X84.131 Y138.867 I.014 J-1.32 E.02144
G1 X84.349 Y138.674 E.00893
G1 X84.536 Y138.307 E.01267
G1 X84.546 Y138.177 E.004
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.536 Y138.307 E-.04944
G1 X84.349 Y138.674 E-.15674
G1 X84.131 Y138.867 E-.11049
G1 X83.803 Y139 E-.13462
G1 X83.464 Y139.04 E-.12976
G1 X83.068 Y138.911 E-.15821
G1 X83.027 Y138.875 E-.02075
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z1.8 I.888 J-.832 P1  F36000
G1 X82.177 Y137.97 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.65 Y136.647 I1.396 J.073 E.07295
G1 X83.715 Y136.652 E.00216
G3 X82.176 Y138.03 I-.142 J1.39 E.21416
M204 S10000
G1 X81.782 Y137.963 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.783 Y137.949 E.00044
G3 X83.665 Y136.255 I1.787 J.093 E.08642
G1 X83.756 Y136.262 E.00279
G3 X81.803 Y138.322 I-.185 J1.78 E.24479
G1 X81.786 Y138.023 E.0092
; WIPE_START
G1 F9000
M204 S6000
G1 X81.783 Y137.949 E-.02823
G1 X81.84 Y137.579 E-.14217
G1 X81.974 Y137.23 E-.14218
G1 X82.178 Y136.916 E-.14221
G1 X82.371 Y136.712 E-.10685
G1 X82.674 Y136.492 E-.14213
G1 X82.809 Y136.432 E-.05624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.181 Y138.816 F36000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.405 Y138.587 E.00985
G1 X84.565 Y138.147 E.01437
G2 X84.462 Y137.585 I-1.574 J-.002 E.01764
G1 X84.2 Y137.263 E.01277
G1 X83.833 Y137.075 E.01267
G1 X83.462 Y137.046 E.01144
G1 X83.025 Y137.206 E.0143
G1 X82.697 Y137.547 E.01454
G1 X82.571 Y137.938 E.01261
G1 X82.613 Y138.345 E.01259
G1 X82.79 Y138.673 E.01145
G1 X83.074 Y138.914 E.01144
G1 X83.464 Y139.04 E.0126
G1 X83.878 Y138.997 E.0128
G1 X84.13 Y138.846 E.009
M204 S10000
G1 X83.77 Y138.102 F36000
; LINE_WIDTH: 0.46212
G1 F1200
M204 S6000
G1 X83.772 Y137.956 E.005
G1 X83.661 Y137.839 E.0055
G1 X83.449 Y137.859 E.00727
G1 X83.346 Y138.019 E.0065
G1 X83.403 Y138.177 E.00572
G1 X83.561 Y138.265 E.00618
G2 X83.734 Y138.15 I.004 J-.183 E.00756
M204 S10000
G1 X83.395 Y137.46 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.193 Y137.546 E.00675
G1 X82.975 Y137.849 E.01148
G1 X82.957 Y138.152 E.00932
G1 X83.088 Y138.431 E.00948
G1 X83.376 Y138.636 E.01084
G1 X83.634 Y138.663 E.00797
G1 X83.867 Y138.588 E.00752
G1 X84.113 Y138.344 E.01064
G1 X84.184 Y138.107 E.00762
G2 X83.891 Y137.511 I-.675 J-.038 E.02131
G1 X83.659 Y137.44 E.00748
G1 X83.455 Y137.455 E.00627
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P73 R2
G1 F9547.299
G1 X83.659 Y137.44 E-.07759
G1 X83.891 Y137.511 E-.09245
G1 X84.085 Y137.697 E-.10215
G1 X84.169 Y137.924 E-.09185
G1 X84.184 Y138.107 E-.06975
G1 X84.113 Y138.344 E-.09419
G1 X83.867 Y138.588 E-.13163
G1 X83.634 Y138.663 E-.09305
G1 X83.615 Y138.661 E-.00733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z2 I.528 J-1.097 P1  F36000
G1 X82.178 Y137.97 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.576 Y136.645 I1.395 J.072 E.07048
G1 X83.722 Y136.653 E.00485
G3 X82.176 Y138.03 I-.149 J1.389 E.21376
M204 S10000
G1 X81.782 Y137.961 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.787 Y137.949 E.00038
G3 X83.583 Y136.253 I1.786 J.092 E.08379
G1 X83.758 Y136.262 E.0054
G3 X81.806 Y138.321 I-.185 J1.779 E.24464
G1 X81.786 Y138.02 E.00927
; WIPE_START
G1 F9000
M204 S6000
G1 X81.787 Y137.949 E-.02709
G1 X81.84 Y137.579 E-.14202
G1 X81.975 Y137.228 E-.14319
G1 X82.178 Y136.916 E-.14124
G1 X82.371 Y136.712 E-.10675
G1 X82.674 Y136.492 E-.14221
G1 X82.81 Y136.427 E-.05749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.638 Y137.718 F36000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.571 Y138.062 E.0108
G1 X82.615 Y138.353 E.00903
G1 X82.784 Y138.639 E.01022
G1 X83.042 Y138.89 E.01104
G1 X83.305 Y139.01 E.00888
G1 X83.774 Y139.019 E.01442
G1 X84.206 Y138.817 E.01466
G1 X84.392 Y138.59 E.00901
G1 X84.549 Y138.231 E.01206
G2 X84.351 Y137.436 I-.952 J-.185 E.02598
G1 X84.242 Y137.301 E.00533
G1 X83.878 Y137.09 E.01293
G1 X83.509 Y137.041 E.01143
G1 X83.113 Y137.148 E.0126
G1 X82.789 Y137.411 E.01283
G1 X82.665 Y137.664 E.00864
M204 S10000
G1 X83.672 Y138.226 F36000
; LINE_WIDTH: 0.4591
G1 F1200
M204 S6000
G1 X83.791 Y138.075 E.00652
G1 X83.793 Y138.034 E.00139
G1 X83.731 Y137.899 E.00504
G1 X83.514 Y137.824 E.00778
G1 X83.389 Y137.909 E.00513
G1 X83.359 Y138.121 E.00726
G1 X83.482 Y138.248 E.006
G1 X83.612 Y138.233 E.00443
M204 S10000
G1 X83.902 Y137.54 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.754 Y137.454 E.00529
G1 X83.407 Y137.439 E.01065
G1 X83.176 Y137.557 E.00798
G1 X83.026 Y137.737 E.0072
G1 X82.948 Y138.107 E.01163
G1 X83.017 Y138.331 E.0072
G1 X83.286 Y138.599 E.01164
G1 X83.656 Y138.659 E.01154
G1 X83.978 Y138.511 E.01087
G1 X84.167 Y138.214 E.01083
G1 X84.19 Y138.034 E.00556
G1 X84.116 Y137.744 E.0092
G1 X83.946 Y137.582 E.00722
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.116 Y137.744 E-.08929
G1 X84.19 Y138.034 E-.11384
G1 X84.167 Y138.214 E-.06871
G1 X83.978 Y138.511 E-.13398
G1 X83.656 Y138.659 E-.1344
G1 X83.286 Y138.599 E-.14273
G1 X83.142 Y138.456 E-.07705
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z2.2 I.548 J-1.087 P1  F36000
G1 X82.178 Y137.97 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.578 Y136.645 I1.395 J.073 E.07054
G1 X83.722 Y136.653 E.00479
G3 X82.176 Y138.03 I-.149 J1.389 E.21391
M204 S10000
G1 X81.782 Y137.958 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.786 Y137.949 E.00031
G3 X83.585 Y136.253 I1.787 J.093 E.08385
G1 X83.758 Y136.262 E.00534
G3 X81.794 Y138.229 I-.185 J1.78 E.24769
G1 X81.784 Y138.018 E.00649
; WIPE_START
G1 F9000
M204 S6000
G1 X81.786 Y137.949 E-.02614
G1 X81.84 Y137.579 E-.1421
G1 X81.975 Y137.228 E-.1431
G1 X82.178 Y136.916 E-.14127
G1 X82.371 Y136.712 E-.10676
G1 X82.674 Y136.492 E-.14224
G1 X82.813 Y136.426 E-.0584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.852 Y137.364 F36000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.649 Y137.656 E.01092
G1 X82.571 Y137.937 E.00898
G1 X82.612 Y138.342 E.01248
G1 X82.864 Y138.749 E.01473
G1 X83.266 Y138.998 E.01453
G1 X83.669 Y139.04 E.01244
G1 X84.03 Y138.932 E.0116
G1 X84.345 Y138.678 E.01244
G1 X84.546 Y138.246 E.01462
G1 X84.545 Y137.894 E.01083
G1 X84.462 Y137.585 E.00984
G1 X84.261 Y137.338 E.00978
G1 X83.975 Y137.131 E.01086
G1 X83.509 Y137.041 E.01458
G1 X83.113 Y137.148 E.01259
G1 X82.899 Y137.326 E.00857
M204 S10000
G1 X83.778 Y138.025 F36000
; LINE_WIDTH: 0.46169
G1 F1200
M204 S6000
G1 X83.772 Y137.956 E.00236
G1 X83.658 Y137.843 E.0055
G1 X83.458 Y137.848 E.00681
G1 X83.346 Y138.019 E.00698
G1 X83.415 Y138.198 E.00656
G1 X83.561 Y138.264 E.00547
G1 X83.719 Y138.205 E.00573
G1 X83.759 Y138.082 E.00444
M204 S10000
G1 X84.169 Y137.924 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.719 E.00664
G1 X83.861 Y137.493 E.01012
G1 X83.514 Y137.422 E.01087
G1 X83.247 Y137.511 E.00865
G1 X83.019 Y137.75 E.01013
G1 X82.948 Y138.034 E.00899
G1 X82.998 Y138.264 E.00724
G1 X83.162 Y138.513 E.00916
G1 X83.503 Y138.663 E.01147
G1 X83.871 Y138.587 E.01153
G1 X84.039 Y138.45 E.00665
G1 X84.186 Y138.128 E.01087
M73 P74 R2
G1 X84.174 Y137.984 E.00445
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.186 Y138.128 E-.05503
G1 X84.039 Y138.45 E-.13446
G1 X83.871 Y138.587 E-.0823
G1 X83.503 Y138.663 E-.14255
G1 X83.162 Y138.513 E-.1419
G1 X82.998 Y138.264 E-.1133
G1 X82.948 Y138.034 E-.08951
G1 X82.948 Y138.031 E-.00095
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z2.4 I.097 J-1.213 P1  F36000
G1 X82.179 Y137.97 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.579 Y136.645 I1.395 J.072 E.07057
G1 X83.722 Y136.653 E.00473
G3 X82.177 Y138.03 I-.148 J1.389 E.21379
M204 S10000
G1 X81.781 Y137.955 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.788 Y137.949 E.00027
G3 X83.587 Y136.253 I1.786 J.092 E.08389
G1 X83.758 Y136.262 E.00527
G3 X81.795 Y138.229 I-.184 J1.779 E.24754
G1 X81.784 Y138.015 E.00657
; WIPE_START
G1 F9000
M204 S6000
G1 X81.788 Y137.949 E-.02512
G1 X81.818 Y137.67 E-.10664
G1 X81.934 Y137.314 E-.14215
G1 X82.121 Y136.99 E-.14215
G1 X82.371 Y136.712 E-.1422
G1 X82.674 Y136.492 E-.14232
G1 X82.815 Y136.425 E-.05941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.852 Y137.365 F36000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.649 Y137.654 E.01087
G1 X82.571 Y137.938 E.00903
G1 X82.612 Y138.342 E.01248
G1 X82.863 Y138.748 E.01469
G1 X83.266 Y138.998 E.01457
G1 X83.674 Y139.04 E.0126
G1 X83.995 Y138.932 E.01041
G1 X84.289 Y138.734 E.0109
G1 X84.459 Y138.504 E.00877
G1 X84.567 Y138.042 E.0146
G1 X84.458 Y137.579 E.01462
G1 X84.277 Y137.352 E.00892
G1 X83.975 Y137.131 E.0115
G1 X83.509 Y137.041 E.01459
G1 X83.113 Y137.148 E.01258
G1 X82.899 Y137.326 E.00857
M204 S10000
G1 X82.998 Y138.264 F36000
G1 F1200
M204 S6000
G1 X83.16 Y138.512 E.00909
G1 X83.504 Y138.663 E.01154
G1 X83.742 Y138.64 E.00735
G1 X84.054 Y138.435 E.01149
G1 X84.19 Y138.085 E.01153
G1 X84.089 Y137.703 E.01215
G1 X83.821 Y137.475 E.01079
G1 X83.514 Y137.422 E.0096
G1 X83.247 Y137.511 E.00864
G1 X83.019 Y137.75 E.01015
G1 X82.948 Y138.034 E.00898
G1 X82.985 Y138.205 E.00539
M204 S10000
G1 X83.469 Y138.227 F36000
; LINE_WIDTH: 0.4618
G1 F1200
M204 S6000
G1 X83.607 Y138.26 E.00485
G1 X83.749 Y138.171 E.00573
G1 X83.788 Y138.042 E.00459
G1 X83.705 Y137.883 E.00613
G1 X83.519 Y137.824 E.00665
G1 X83.357 Y137.969 E.00742
G1 X83.363 Y138.102 E.00454
G1 X83.43 Y138.181 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8594.347
G1 X83.363 Y138.102 E-.06178
G1 X83.357 Y137.969 E-.07944
G1 X83.519 Y137.824 E-.12982
G1 X83.705 Y137.883 E-.11632
G1 X83.788 Y138.042 E-.10722
G1 X83.749 Y138.171 E-.08028
G1 X83.607 Y138.26 E-.10034
G1 X83.469 Y138.227 E-.08479
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z2.6 I.238 J-1.194 P1  F36000
G1 X82.178 Y137.97 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.581 Y136.645 I1.395 J.073 E.07064
G1 X83.722 Y136.653 E.00467
G3 X82.176 Y138.03 I-.148 J1.389 E.21392
M204 S10000
G1 X81.781 Y137.953 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.787 Y137.949 E.00021
G3 X83.589 Y136.253 I1.787 J.093 E.08395
G1 X83.758 Y136.262 E.00522
G3 X81.794 Y138.229 I-.184 J1.78 E.24769
G1 X81.784 Y138.013 E.00666
; WIPE_START
G1 F9000
M204 S6000
G1 X81.787 Y137.949 E-.02411
G1 X81.84 Y137.579 E-.14202
G1 X81.975 Y137.228 E-.14316
G1 X82.178 Y136.916 E-.14125
G1 X82.371 Y136.712 E-.10668
G1 X82.674 Y136.492 E-.14233
G1 X82.818 Y136.424 E-.06047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.638 Y137.718 F36000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.571 Y138.043 E.01021
G1 X82.68 Y138.506 E.01462
G1 X82.932 Y138.817 E.01228
G1 X83.266 Y138.998 E.01168
G1 X83.674 Y139.04 E.0126
G1 X84.066 Y138.913 E.01267
G1 X84.348 Y138.671 E.01143
G1 X84.55 Y138.228 E.01495
G2 X84.346 Y137.41 I-1.089 J-.163 E.02659
G1 X83.975 Y137.131 E.01426
G1 X83.508 Y137.041 E.01459
G1 X83.113 Y137.148 E.01258
G1 X82.789 Y137.411 E.01283
G1 X82.665 Y137.664 E.00865
M204 S10000
G1 X83.368 Y138.103 F36000
; LINE_WIDTH: 0.461566
G1 F1200
M204 S6000
G1 X83.405 Y138.192 E.00328
G1 X83.592 Y138.265 E.00687
G1 X83.734 Y138.177 E.0057
G1 X83.792 Y138.02 E.00572
G1 X83.658 Y137.843 E.00757
G1 X83.467 Y137.842 E.00652
G1 X83.379 Y137.947 E.00467
G1 X83.372 Y138.043 E.00328
M204 S10000
G1 X83.962 Y137.579 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.782 Y137.458 E.00666
G1 X83.407 Y137.439 E.01153
G1 X83.176 Y137.557 E.00797
M73 P75 R2
G1 X83.026 Y137.737 E.00721
G1 X82.948 Y138.087 E.011
G1 X83.083 Y138.435 E.01148
G1 X83.398 Y138.641 E.01154
G1 X83.69 Y138.651 E.009
G2 X84.049 Y138.431 I-.208 J-.741 E.01312
G1 X84.19 Y138.108 E.01081
G2 X83.998 Y137.627 I-.729 J.011 E.01628
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.129 Y137.801 E-.08284
G1 X84.19 Y138.02 E-.08627
G1 X84.19 Y138.108 E-.03361
G1 X84.049 Y138.431 E-.13366
G1 X83.911 Y138.55 E-.06932
G1 X83.69 Y138.651 E-.09235
G1 X83.398 Y138.641 E-.11125
G1 X83.083 Y138.435 E-.14269
G1 X83.076 Y138.416 E-.008
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z2.8 I.542 J-1.09 P1  F36000
G1 X82.179 Y137.97 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.583 Y136.645 I1.395 J.072 E.07067
G1 X83.721 Y136.653 E.0046
G3 X82.178 Y138.03 I-.147 J1.389 E.21381
M204 S10000
G1 X81.781 Y137.95 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.788 Y137.949 E.00022
G3 X83.591 Y136.253 I1.786 J.092 E.08399
G1 X83.758 Y136.262 E.00516
G3 X81.796 Y138.229 I-.184 J1.779 E.24756
G1 X81.784 Y138.01 E.00673
; WIPE_START
G1 F9000
M204 S6000
G1 X81.788 Y137.949 E-.02314
G1 X81.84 Y137.579 E-.14202
G1 X81.974 Y137.23 E-.14222
G1 X82.178 Y136.916 E-.14217
G1 X82.371 Y136.712 E-.10678
G1 X82.674 Y136.492 E-.14212
G1 X82.82 Y136.423 E-.06154
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.411 Y138.555 F36000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.55 Y138.228 E.0109
G2 X84.346 Y137.41 I-1.09 J-.163 E.02659
G1 X83.975 Y137.131 E.01427
G1 X83.508 Y137.041 E.0146
G1 X83.113 Y137.148 E.01257
G1 X82.789 Y137.411 E.01282
G1 X82.601 Y137.778 E.01267
G1 X82.592 Y138.248 E.01443
G1 X82.794 Y138.679 E.01465
G1 X83.021 Y138.865 E.00901
G1 X83.365 Y139.019 E.01158
G1 X83.835 Y139.009 E.01447
G1 X84.2 Y138.822 E.0126
G1 X84.374 Y138.602 E.00862
M204 S10000
G1 X83.962 Y137.579 F36000
G1 F1200
M204 S6000
G1 X83.782 Y137.458 E.00666
G1 X83.408 Y137.439 E.01152
G1 X83.176 Y137.557 E.00799
G1 X82.996 Y137.802 E.00933
G1 X82.952 Y138.13 E.01017
G1 X83.1 Y138.451 E.01087
G1 X83.402 Y138.642 E.01099
G1 X83.751 Y138.637 E.01072
G1 X83.994 Y138.495 E.00865
G1 X84.169 Y138.209 E.01031
G2 X83.998 Y137.627 I-.637 J-.129 E.01939
M204 S10000
G1 X83.385 Y138.142 F36000
; LINE_WIDTH: 0.461534
G1 F1200
M204 S6000
G1 X83.525 Y138.257 E.00618
G1 X83.716 Y138.21 E.0067
G1 X83.792 Y138.02 E.00699
G1 X83.658 Y137.843 E.00758
G1 X83.467 Y137.842 E.00652
G1 X83.365 Y137.956 E.00521
G1 X83.378 Y138.082 E.00433
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8599.806
G1 X83.365 Y137.956 E-.07561
G1 X83.467 Y137.842 E-.09103
G1 X83.658 Y137.843 E-.11387
G1 X83.792 Y138.02 E-.13236
G1 X83.716 Y138.21 E-.12214
G1 X83.525 Y138.257 E-.11706
G1 X83.385 Y138.142 E-.10794
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z3 I.172 J-1.205 P1  F36000
G1 X82.179 Y137.97 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.585 Y136.645 I1.395 J.073 E.07072
G1 X83.721 Y136.653 E.00455
G3 X82.177 Y138.03 I-.147 J1.389 E.21395
M204 S10000
G1 X81.782 Y137.947 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.847 Y137.578 E.01151
G3 X83.593 Y136.253 I1.728 J.464 E.07249
G1 X83.758 Y136.262 E.00509
G3 X81.786 Y138.002 I-.183 J1.78 E.25469
; WIPE_START
G1 F9000
M204 S6000
G1 X81.847 Y137.578 E-.16273
G1 X81.934 Y137.315 E-.10559
G1 X82.121 Y136.99 E-.14224
G1 X82.371 Y136.712 E-.14222
G1 X82.674 Y136.492 E-.14223
G1 X82.828 Y136.419 E-.06498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.509 Y138.243 F36000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46172
G1 F1200
M204 S6000
G1 X83.703 Y138.221 E.00667
G1 X83.775 Y138.102 E.00473
G2 X83.752 Y137.922 I-.34 J-.048 E.00626
G1 X83.596 Y137.835 E.00609
G1 X83.444 Y137.858 E.00527
G2 X83.361 Y138.122 I.169 J.197 E.00995
G1 X83.463 Y138.205 E.00448
M204 S10000
G1 X84.15 Y137.867 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.065 Y137.667 E.00668
G1 X83.782 Y137.458 E.01082
G1 X83.407 Y137.439 E.01153
G1 X83.176 Y137.557 E.00797
G1 X82.996 Y137.8 E.00929
G1 X82.953 Y138.13 E.01023
G1 X83.018 Y138.332 E.00651
G1 X83.266 Y138.586 E.01093
G1 X83.609 Y138.664 E.0108
G1 X83.962 Y138.527 E.01162
M73 P76 R2
G1 X84.142 Y138.283 E.00933
G2 X84.157 Y137.926 I-.615 J-.205 E.0111
M204 S10000
G1 X84.551 Y138.118 F36000
G1 F1200
M204 S6000
G1 X84.565 Y137.936 E.00561
G1 X84.405 Y137.497 E.01434
G1 X84.064 Y137.17 E.01451
G1 X83.789 Y137.078 E.00892
G1 X83.392 Y137.06 E.01219
G1 X83.113 Y137.148 E.009
G1 X82.789 Y137.411 E.01283
G1 X82.603 Y137.772 E.01249
G1 X82.572 Y138.155 E.01179
G1 X82.695 Y138.534 E.01226
G1 X83.025 Y138.879 E.01466
G1 X83.472 Y139.04 E.01459
G1 X83.755 Y139.014 E.00876
G1 X84.129 Y138.868 E.01233
G1 X84.349 Y138.674 E.009
G1 X84.536 Y138.307 E.01267
G1 X84.546 Y138.178 E.00398
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.536 Y138.307 E-.04921
G1 X84.349 Y138.674 E-.15672
G1 X84.129 Y138.868 E-.11134
G1 X83.755 Y139.014 E-.15247
G1 X83.472 Y139.04 E-.10829
G1 X83.025 Y138.879 E-.1805
G1 X83.022 Y138.876 E-.00148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z3.2 I.891 J-.829 P1  F36000
G1 X82.179 Y137.97 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.586 Y136.645 I1.395 J.073 E.07077
G1 X83.721 Y136.653 E.00449
G3 X82.177 Y138.03 I-.147 J1.39 E.21399
M204 S10000
G1 X81.782 Y137.945 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.824 Y137.672 E.00851
G3 X83.595 Y136.253 I1.751 J.371 E.07549
G1 X83.758 Y136.262 E.00503
G3 X81.786 Y138.002 I-.183 J1.78 E.25475
; WIPE_START
G1 F9000
M204 S6000
G1 X81.824 Y137.672 E-.12624
G1 X81.934 Y137.314 E-.14198
G1 X82.121 Y136.99 E-.14221
G1 X82.371 Y136.712 E-.14212
G1 X82.674 Y136.492 E-.14229
G1 X82.829 Y136.418 E-.06516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.513 Y137.764 F36000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.461 Y137.589 E.00562
G1 X84.231 Y137.292 E.01154
G1 X83.876 Y137.09 E.01255
G1 X83.508 Y137.041 E.0114
G1 X83.113 Y137.148 E.01257
G1 X82.852 Y137.364 E.01041
G1 X82.649 Y137.654 E.01088
G1 X82.571 Y137.938 E.00904
G1 X82.61 Y138.274 E.01042
G1 X82.742 Y138.602 E.01086
G1 X82.934 Y138.819 E.00887
G1 X83.383 Y139.023 E.01518
G1 X83.668 Y139.041 E.00877
G2 X84.275 Y138.748 I-.247 J-1.285 E.02094
G1 X84.525 Y138.345 E.01455
G1 X84.567 Y138.061 E.00882
G1 X84.524 Y137.823 E.00745
M204 S10000
G1 X83.979 Y137.583 F36000
G1 F1200
M204 S6000
G1 X83.753 Y137.454 E.00798
G1 X83.407 Y137.439 E.01064
G1 X83.193 Y137.546 E.00736
G1 X82.975 Y137.849 E.01148
G1 X82.948 Y138.087 E.00735
G1 X83.084 Y138.435 E.01148
G1 X83.402 Y138.642 E.01167
G1 X83.676 Y138.654 E.00844
G1 X83.977 Y138.512 E.01022
G1 X84.167 Y138.214 E.01086
G1 X84.19 Y138.061 E.00473
G1 X84.12 Y137.764 E.00938
G1 X84.016 Y137.63 E.00522
M204 S10000
G1 X83.714 Y137.888 F36000
; LINE_WIDTH: 0.45929
G1 F1200
M204 S6000
G1 X83.508 Y137.826 E.00732
G1 X83.354 Y137.977 E.00732
G1 X83.396 Y138.187 E.00728
G1 X83.595 Y138.266 E.00725
G1 X83.725 Y138.198 E.00497
G1 X83.793 Y138.061 E.00517
G1 X83.739 Y137.943 E.00442
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8646.155
G1 X83.793 Y138.061 E-.07679
G1 X83.725 Y138.198 E-.08993
G1 X83.595 Y138.266 E-.08633
G1 X83.396 Y138.187 E-.12601
G1 X83.354 Y137.977 E-.12659
G1 X83.508 Y137.826 E-.12721
G1 X83.714 Y137.888 E-.12714
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z3.4 I-.065 J-1.215 P1  F36000
G1 X82.181 Y137.97 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.588 Y136.645 I1.395 J.072 E.07081
G1 X83.721 Y136.653 E.00442
M73 P77 R2
G3 X82.179 Y138.03 I-.146 J1.389 E.21386
M204 S10000
G1 X81.782 Y137.943 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.826 Y137.672 E.00844
G3 X83.597 Y136.253 I1.75 J.37 E.07554
G1 X83.758 Y136.262 E.00496
G3 X81.788 Y138 I-.182 J1.779 E.25465
; WIPE_START
G1 F9000
M204 S6000
G1 X81.826 Y137.672 E-.12533
G1 X81.933 Y137.315 E-.14151
G1 X82.121 Y136.99 E-.14264
G1 X82.371 Y136.712 E-.14222
G1 X82.674 Y136.492 E-.14219
G1 X82.831 Y136.417 E-.06611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.869 Y137.35 F36000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.683 Y137.578 E.00906
G1 X82.571 Y137.946 E.01181
G1 X82.614 Y138.353 E.01258
G1 X82.787 Y138.643 E.01038
G1 X83.042 Y138.89 E.01091
G1 X83.304 Y139.01 E.00887
G1 X83.676 Y139.038 E.01145
G1 X84.113 Y138.879 E.01429
G1 X84.441 Y138.537 E.01455
G1 X84.567 Y138.147 E.0126
G2 X84.461 Y137.588 I-2.26 J.138 E.01752
G1 X84.23 Y137.291 E.01157
G1 X83.876 Y137.09 E.0125
G1 X83.508 Y137.041 E.01142
G1 X83.113 Y137.148 E.01257
G1 X82.916 Y137.312 E.00787
M204 S10000
G1 X83.713 Y137.888 F36000
; LINE_WIDTH: 0.45934
G1 F1200
M204 S6000
G1 X83.508 Y137.826 E.00729
G1 X83.378 Y137.95 E.00608
G1 X83.359 Y138.122 E.00587
G1 X83.482 Y138.247 E.00597
G1 X83.689 Y138.227 E.00707
G1 X83.793 Y138.062 E.00662
G1 X83.738 Y137.942 E.00445
M204 S10000
G1 X83.978 Y137.582 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.754 Y137.454 E.00794
G1 X83.407 Y137.439 E.01065
G1 X83.2 Y137.542 E.00711
G1 X83.022 Y137.759 E.00863
G1 X82.948 Y138.107 E.01094
G1 X83.02 Y138.336 E.00736
G1 X83.285 Y138.599 E.01148
G1 X83.635 Y138.657 E.01089
G1 X83.945 Y138.539 E.01019
G1 X84.163 Y138.235 E.01148
G1 X84.19 Y138.061 E.0054
G1 X84.12 Y137.764 E.00938
G1 X84.015 Y137.629 E.00526
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.12 Y137.764 E-.06499
G1 X84.19 Y138.061 E-.11606
G1 X84.163 Y138.235 E-.06684
G1 X83.945 Y138.539 E-.14196
G1 X83.635 Y138.657 E-.12597
G1 X83.285 Y138.599 E-.13468
G1 X83.08 Y138.396 E-.10951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z3.6 I.521 J-1.1 P1  F36000
G1 X82.181 Y137.97 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.59 Y136.646 I1.395 J.072 E.07086
G1 X83.721 Y136.653 E.00435
G3 X82.179 Y138.03 I-.146 J1.389 E.21387
M204 S10000
G1 X81.782 Y137.942 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.848 Y137.581 E.01126
G3 X83.599 Y136.253 I1.728 J.461 E.07271
G1 X83.758 Y136.262 E.0049
G3 X81.788 Y137.999 I-.182 J1.779 E.25468
; WIPE_START
G1 F9000
M204 S6000
G1 X81.848 Y137.581 E-.16034
G1 X81.974 Y137.23 E-.14191
G1 X82.121 Y136.99 E-.10675
G1 X82.371 Y136.712 E-.1422
G1 X82.674 Y136.492 E-.1421
G1 X82.832 Y136.417 E-.0667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.168 Y138.825 F36000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.406 Y138.586 E.01037
G1 X84.565 Y138.147 E.01434
G2 X84.463 Y137.587 I-1.575 J-.002 E.0176
G1 X84.204 Y137.266 E.01266
G1 X83.878 Y137.09 E.01137
G1 X83.508 Y137.041 E.01149
G1 X83.113 Y137.148 E.01255
G1 X82.789 Y137.411 E.01283
G1 X82.601 Y137.778 E.01266
G1 X82.592 Y138.248 E.01444
G1 X82.794 Y138.679 E.01464
G1 X83.109 Y138.934 E.01243
G1 X83.471 Y139.04 E.01161
G1 X83.879 Y138.997 E.0126
G1 X84.116 Y138.856 E.00848
M204 S10000
G1 X83.385 Y138.143 F36000
; LINE_WIDTH: 0.4618
G1 F1200
M204 S6000
G1 X83.441 Y138.224 E.00336
G1 X83.645 Y138.252 E.00703
G1 X83.77 Y138.102 E.00666
G1 X83.772 Y137.954 E.00505
G1 X83.636 Y137.84 E.00608
G1 X83.454 Y137.851 E.0062
G1 X83.365 Y137.956 E.00471
G1 X83.379 Y138.083 E.00437
M204 S10000
G1 X83.92 Y137.541 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.76 Y137.455 E.00558
G1 X83.408 Y137.439 E.01084
G1 X83.176 Y137.557 E.00799
G1 X82.996 Y137.802 E.00933
G1 X82.952 Y138.13 E.01017
G1 X83.1 Y138.451 E.01087
G1 X83.268 Y138.587 E.00665
G1 X83.634 Y138.663 E.01148
G1 X83.86 Y138.593 E.00727
G1 X84.113 Y138.344 E.01089
G1 X84.184 Y138.107 E.00761
G2 X84.089 Y137.704 I-.778 J-.031 E.01288
G1 X83.963 Y137.583 E.00538
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.089 Y137.704 E-.0665
G1 X84.169 Y137.922 E-.08836
G1 X84.184 Y138.107 E-.0704
G1 X84.113 Y138.344 E-.09412
G1 X83.86 Y138.593 E-.13471
G1 X83.634 Y138.663 E-.08993
G1 X83.268 Y138.587 E-.14195
G1 X83.117 Y138.465 E-.07403
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z3.8 I.569 J-1.076 P1  F36000
G1 X82.18 Y137.97 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
M73 P78 R2
G3 X83.592 Y136.646 I1.395 J.073 E.07092
G1 X83.721 Y136.653 E.00429
G3 X82.179 Y138.03 I-.145 J1.39 E.21404
M204 S10000
G1 X81.783 Y137.94 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.848 Y137.579 E.01128
G3 X83.601 Y136.253 I1.728 J.464 E.07271
G1 X83.758 Y136.262 E.00484
G3 X81.787 Y137.998 I-.182 J1.78 E.25489
; WIPE_START
G1 F9000
M204 S6000
G1 X81.848 Y137.579 E-.161
G1 X81.974 Y137.23 E-.14113
G1 X82.178 Y136.916 E-.14213
G1 X82.371 Y136.712 E-.10673
G1 X82.674 Y136.492 E-.14218
G1 X82.833 Y136.417 E-.06682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.796 Y139.002 F36000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.129 Y138.868 E.01102
G1 X84.345 Y138.678 E.00885
G1 X84.55 Y138.228 E.01517
G1 X84.567 Y138.061 E.00517
G1 X84.485 Y137.67 E.01228
G1 X84.351 Y137.415 E.00885
G1 X83.975 Y137.131 E.01449
G1 X83.507 Y137.041 E.01463
G1 X83.113 Y137.148 E.01255
G1 X82.789 Y137.411 E.01282
G1 X82.603 Y137.773 E.0125
G1 X82.592 Y138.248 E.01462
G1 X82.792 Y138.674 E.01446
G1 X83.074 Y138.914 E.01138
G1 X83.464 Y139.04 E.0126
G1 X83.736 Y139.009 E.00842
M204 S10000
G1 X83.386 Y138.144 F36000
; LINE_WIDTH: 0.46166
G1 F1200
M204 S6000
G1 X83.522 Y138.26 E.0061
G1 X83.719 Y138.206 E.00697
G1 X83.792 Y138.061 E.00553
G1 X83.752 Y137.922 E.00494
G1 X83.596 Y137.835 E.00609
G1 X83.443 Y137.858 E.00527
G1 X83.364 Y137.98 E.00498
G1 X83.378 Y138.085 E.0036
M204 S10000
G1 X82.967 Y137.948 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.969 Y138.211 E.00806
G1 X83.09 Y138.433 E.00776
G1 X83.376 Y138.636 E.01078
G1 X83.609 Y138.664 E.00722
G1 X83.962 Y138.528 E.01161
G1 X84.168 Y138.209 E.01166
G1 X84.19 Y138.061 E.0046
G1 X84.112 Y137.738 E.01022
G1 X83.861 Y137.493 E.01078
G1 X83.513 Y137.422 E.01091
G1 X83.238 Y137.517 E.00894
M73 P78 R1
G1 X83.036 Y137.723 E.00884
G1 X82.985 Y137.891 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.036 Y137.723 E-.06695
G1 X83.238 Y137.517 E-.10936
G1 X83.513 Y137.422 E-.1106
G1 X83.861 Y137.493 E-.13493
G1 X84.112 Y137.738 E-.13333
G1 X84.19 Y138.061 E-.12639
G1 X84.168 Y138.209 E-.05686
G1 X84.137 Y138.257 E-.02158
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z4 I.177 J-1.204 P1  F36000
G1 X82.181 Y137.97 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.594 Y136.646 I1.395 J.073 E.07097
G1 X83.721 Y136.653 E.00423
G3 X82.179 Y138.03 I-.145 J1.39 E.21405
M204 S10000
G1 X81.783 Y137.939 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.847 Y137.581 E.01118
G3 X83.603 Y136.253 I1.729 J.462 E.07283
G1 X83.758 Y136.262 E.00478
G3 X81.787 Y137.997 I-.182 J1.78 E.25493
; WIPE_START
G1 F9000
M204 S6000
G1 X81.847 Y137.581 E-.15978
G1 X81.975 Y137.228 E-.14274
G1 X82.178 Y136.916 E-.14132
G1 X82.371 Y136.712 E-.10669
G1 X82.674 Y136.492 E-.14222
G1 X82.833 Y136.416 E-.06725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.638 Y137.718 F36000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.571 Y138.044 E.01021
G1 X82.679 Y138.504 E.01453
G1 X82.937 Y138.822 E.01259
G2 X83.466 Y139.039 I.882 J-1.4 E.01766
G1 X83.835 Y139.009 E.01137
G1 X84.2 Y138.822 E.0126
G1 X84.458 Y138.505 E.01255
G1 X84.567 Y138.042 E.01464
G1 X84.457 Y137.578 E.01465
G1 X84.277 Y137.352 E.00887
G1 X83.975 Y137.131 E.0115
G1 X83.507 Y137.041 E.01463
G1 X83.113 Y137.148 E.01255
G1 X82.789 Y137.411 E.01284
G1 X82.665 Y137.664 E.00866
M204 S10000
G1 X83.368 Y138.103 F36000
; LINE_WIDTH: 0.46173
G1 F1200
M204 S6000
G1 X83.442 Y138.224 E.00483
G1 X83.671 Y138.242 E.00784
G2 X83.787 Y138.042 I-.156 J-.225 E.00816
G1 X83.705 Y137.883 E.00613
G1 X83.518 Y137.824 E.00667
G1 X83.39 Y137.91 E.00526
G1 X83.375 Y138.043 E.00459
M204 S10000
G1 X83.506 Y138.657 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.852 Y138.599 E.0108
G1 X84.079 Y138.398 E.00929
G1 X84.19 Y138.085 E.0102
G1 X84.089 Y137.702 E.01216
G1 X83.822 Y137.475 E.01077
G1 X83.513 Y137.422 E.00964
G1 X83.238 Y137.517 E.00894
G1 X83.059 Y137.687 E.00757
G1 X82.948 Y138 E.01022
G1 X83.024 Y138.344 E.01084
G1 X83.214 Y138.553 E.00866
G1 X83.449 Y138.637 E.00767
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.214 Y138.553 E-.09486
G1 X83.024 Y138.344 E-.10709
G1 X82.948 Y138 E-.13405
G1 X83.059 Y137.687 E-.12635
G1 X83.238 Y137.517 E-.09357
G1 X83.513 Y137.422 E-.1105
G1 X83.755 Y137.464 E-.09358
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
M73 P79 R1
G3 Z4.2 I-.372 J-1.159 P1  F36000
G1 X82.182 Y137.97 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.595 Y136.646 I1.395 J.072 E.071
G1 X83.721 Y136.653 E.00417
G3 X82.18 Y138.03 I-.144 J1.389 E.21394
M204 S10000
G1 X81.783 Y137.938 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.848 Y137.581 E.01115
G3 X83.605 Y136.253 I1.728 J.461 E.07287
G1 X83.758 Y136.262 E.00472
G3 X81.788 Y137.996 I-.181 J1.779 E.25483
; WIPE_START
G1 F9000
M204 S6000
G1 X81.848 Y137.581 E-.15924
G1 X81.974 Y137.23 E-.14186
G1 X82.121 Y136.99 E-.10676
G1 X82.371 Y136.712 E-.14214
G1 X82.674 Y136.492 E-.14216
G1 X82.835 Y136.415 E-.06785
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.636 Y137.723 F36000
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.572 Y137.94 E.00695
G1 X82.602 Y138.309 E.01137
G1 X82.789 Y138.674 E.0126
G1 X83.105 Y138.932 E.01255
G1 X83.471 Y139.04 E.01172
G1 X83.869 Y138.999 E.01228
G1 X84.206 Y138.817 E.01177
G1 X84.458 Y138.506 E.01232
G1 X84.567 Y138.042 E.01464
G1 X84.46 Y137.585 E.0144
G1 X84.225 Y137.287 E.01165
G1 X83.876 Y137.09 E.01232
G1 X83.507 Y137.041 E.01144
G1 X83.113 Y137.148 E.01255
G1 X82.789 Y137.411 E.01282
G1 X82.663 Y137.669 E.00883
M204 S10000
G1 X83.711 Y137.886 F36000
; LINE_WIDTH: 0.45994
G1 F1200
M204 S6000
G1 X83.509 Y137.826 E.00717
G1 X83.387 Y137.915 E.00513
G1 X83.369 Y138.147 E.0079
G2 X83.75 Y138.173 I.2 J-.131 E.01499
G1 X83.788 Y138.042 E.00463
G1 X83.737 Y137.939 E.00389
M204 S10000
G1 X83.975 Y137.579 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.754 Y137.454 E.00778
G1 X83.408 Y137.439 E.01066
G1 X83.176 Y137.557 E.00799
G1 X83.024 Y137.741 E.00734
G1 X82.954 Y137.979 E.00761
G1 X83.014 Y138.328 E.01089
G1 X83.213 Y138.552 E.00921
G1 X83.526 Y138.663 E.0102
G1 X83.737 Y138.642 E.00653
G1 X84.054 Y138.435 E.01162
G1 X84.19 Y138.085 E.01153
G1 X84.19 Y138.042 E.00133
G1 X84.119 Y137.762 E.00885
G1 X84.012 Y137.626 E.00533
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.119 Y137.762 E-.06594
G1 X84.19 Y138.042 E-.10951
G1 X84.19 Y138.085 E-.01643
G1 X84.054 Y138.435 E-.14265
G1 X83.737 Y138.642 E-.1437
G1 X83.526 Y138.663 E-.08077
G1 X83.213 Y138.552 E-.12609
G1 X83.082 Y138.405 E-.07492
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z4.4 I.53 J-1.096 P1  F36000
G1 X82.182 Y137.97 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.597 Y136.646 I1.395 J.072 E.07105
G1 X83.721 Y136.653 E.0041
G3 X82.18 Y138.03 I-.144 J1.389 E.21392
M204 S10000
G1 X81.783 Y137.938 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.849 Y137.581 E.01114
G3 X83.607 Y136.254 I1.728 J.461 E.07292
G1 X83.758 Y136.262 E.00466
G3 X81.789 Y137.995 I-.181 J1.779 E.25483
; WIPE_START
G1 F9000
M204 S6000
G1 X81.849 Y137.581 E-.15898
G1 X81.975 Y137.228 E-.14257
G1 X82.178 Y136.916 E-.14139
G1 X82.371 Y136.712 E-.1068
G1 X82.674 Y136.492 E-.14211
G1 X82.836 Y136.415 E-.06815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.756 Y137.454 F36000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.408 Y137.439 E.01072
G1 X83.193 Y137.546 E.00737
G1 X82.974 Y137.853 E.01158
G1 X82.948 Y138.087 E.00725
G1 X83.084 Y138.435 E.01148
G1 X83.265 Y138.586 E.00724
G1 X83.506 Y138.657 E.00772
G1 X83.852 Y138.599 E.01079
G1 X84.079 Y138.397 E.00933
G1 X84.19 Y138.085 E.01015
G1 X84.19 Y138.023 E.00192
G1 X84.118 Y137.748 E.00873
G2 X83.808 Y137.484 I-.503 J.276 E.01277
M204 S10000
G1 X83.548 Y138.255 F36000
; LINE_WIDTH: 0.45996
G1 F1200
M204 S6000
G1 X83.722 Y138.206 E.00613
G1 X83.793 Y138.023 E.00669
G1 X83.721 Y137.892 E.00507
G1 X83.509 Y137.826 E.00757
G1 X83.354 Y137.975 E.00732
G1 X83.397 Y138.187 E.00734
G1 X83.493 Y138.231 E.0036
M204 S10000
G1 X83.238 Y138.971 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.466 Y139.039 E.00731
G1 X83.835 Y139.009 E.01138
G1 X84.2 Y138.822 E.0126
G1 X84.46 Y138.502 E.01266
G1 X84.567 Y138.14 E.01161
G2 X84.523 Y137.732 I-1.379 J-.058 E.01265
G2 X84.228 Y137.289 I-1.59 J.74 E.01642
G1 X83.879 Y137.09 E.01235
G1 X83.507 Y137.041 E.01152
G1 X83.113 Y137.148 E.01254
G1 X82.852 Y137.364 E.0104
G1 X82.648 Y137.657 E.01096
G1 X82.571 Y137.937 E.00894
G1 X82.61 Y138.274 E.01041
G1 X82.742 Y138.602 E.01088
G1 X82.937 Y138.822 E.00903
G1 X83.184 Y138.944 E.00847
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X82.937 Y138.822 E-.1047
G1 X82.742 Y138.602 E-.11172
G1 X82.61 Y138.274 E-.13458
M73 P80 R1
G1 X82.571 Y137.937 E-.12874
G1 X82.648 Y137.657 E-.11056
G1 X82.852 Y137.364 E-.13555
G1 X82.922 Y137.307 E-.03414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z4.6 I-.813 J-.906 P1  F36000
G1 X82.182 Y137.97 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.599 Y136.646 I1.394 J.072 E.0711
G1 X83.72 Y136.653 E.00403
G3 X82.181 Y138.03 I-.144 J1.389 E.2139
M204 S10000
G1 X81.783 Y137.937 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.85 Y137.58 E.01118
G3 X83.609 Y136.254 I1.728 J.462 E.07292
G1 X83.758 Y136.262 E.00459
G3 X81.79 Y137.995 I-.181 J1.779 E.25482
; WIPE_START
G1 F9000
M204 S6000
G1 X81.85 Y137.58 E-.1594
G1 X81.934 Y137.314 E-.10574
G1 X82.121 Y136.99 E-.14211
G1 X82.371 Y136.712 E-.14227
G1 X82.674 Y136.492 E-.14225
G1 X82.836 Y136.415 E-.06823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.51 Y138.243 F36000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.461792
G1 F1200
M204 S6000
G1 X83.606 Y138.261 E.00332
G1 X83.782 Y138.112 E.00789
G1 X83.792 Y138.023 E.00304
G1 X83.705 Y137.883 E.00564
G1 X83.518 Y137.824 E.00668
G1 X83.386 Y137.914 E.00543
G1 X83.36 Y138.121 E.00713
G1 X83.463 Y138.205 E.00456
M204 S10000
G1 X83.963 Y137.58 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.782 Y137.458 E.00669
G1 X83.408 Y137.439 E.01153
G1 X83.176 Y137.557 E.00799
G1 X82.996 Y137.8 E.00929
G1 X82.953 Y138.13 E.01021
G1 X83.02 Y138.336 E.00667
G1 X83.265 Y138.586 E.01076
G1 X83.634 Y138.663 E.01158
G1 X83.958 Y138.523 E.01084
G1 X84.163 Y138.235 E.01085
G1 X84.19 Y138.023 E.00657
G1 X84.123 Y137.789 E.00747
G1 X83.999 Y137.627 E.00627
M204 S10000
G1 X83.975 Y137.131 F36000
G1 F1200
M204 S6000
G1 X83.507 Y137.041 E.01464
G1 X83.113 Y137.148 E.01254
G1 X82.789 Y137.411 E.01281
G1 X82.603 Y137.773 E.01252
G1 X82.572 Y138.154 E.01176
G1 X82.698 Y138.54 E.01245
G1 X83.024 Y138.879 E.01445
G1 X83.471 Y139.04 E.01462
G1 X83.872 Y138.998 E.01237
G1 X84.199 Y138.821 E.01144
G1 X84.441 Y138.537 E.01145
G1 X84.567 Y138.147 E.01259
G2 X84.346 Y137.41 I-1.132 J-.062 E.02412
G1 X84.023 Y137.167 E.01242
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.346 Y137.41 E-.15363
G1 X84.524 Y137.737 E-.14151
G1 X84.567 Y138.023 E-.10987
G1 X84.567 Y138.147 E-.04712
G1 X84.441 Y138.537 E-.15572
G1 X84.199 Y138.821 E-.14163
G1 X84.175 Y138.834 E-.01052
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z4.8 I.484 J-1.117 P1  F36000
G1 X82.182 Y137.97 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.601 Y136.646 I1.395 J.072 E.07116
G1 X83.72 Y136.653 E.00397
G3 X82.18 Y138.03 I-.143 J1.389 E.21399
M204 S10000
G1 X81.783 Y137.937 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.849 Y137.581 E.01113
G3 X83.611 Y136.254 I1.728 J.461 E.07304
G1 X83.758 Y136.262 E.00453
G3 X81.789 Y137.995 I-.18 J1.78 E.2549
; WIPE_START
G1 F9000
M204 S6000
G1 X81.849 Y137.581 E-.15878
G1 X81.934 Y137.314 E-.10648
G1 X82.121 Y136.99 E-.1422
G1 X82.371 Y136.712 E-.14213
G1 X82.674 Y136.492 E-.14218
G1 X82.836 Y136.415 E-.06823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.547 Y138.114 F36000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.564 Y137.934 E.00557
G1 X84.462 Y137.589 E.01104
G1 X84.221 Y137.284 E.01193
G1 X83.876 Y137.09 E.01217
G1 X83.507 Y137.041 E.01145
G1 X83.113 Y137.148 E.01254
G1 X82.789 Y137.411 E.01282
G2 X82.572 Y137.937 I1.488 J.919 E.01757
G1 X82.602 Y138.309 E.01146
G1 X82.786 Y138.67 E.01243
G1 X83.074 Y138.914 E.0116
G1 X83.459 Y139.039 E.01245
G1 X83.835 Y139.009 E.0116
G1 X84.2 Y138.822 E.0126
G2 X84.527 Y138.33 I-1.121 J-1.098 E.01825
G1 X84.542 Y138.174 E.00482
M204 S10000
G1 X83.733 Y137.915 F36000
; LINE_WIDTH: 0.46003
G1 F1200
M204 S6000
G1 X83.588 Y137.833 E.00564
G1 X83.44 Y137.859 E.00511
G1 X83.356 Y138.02 E.00618
G1 X83.378 Y138.157 E.00473
G1 X83.515 Y138.258 E.00578
G1 X83.713 Y138.214 E.00688
M73 P81 R1
G1 X83.776 Y138.042 E.00625
G1 X83.752 Y137.971 E.00252
M204 S10000
G1 X83.856 Y137.511 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.611 Y137.435 E.00787
G1 X83.366 Y137.455 E.00756
G1 X83.136 Y137.597 E.00833
G2 X82.954 Y137.978 I.578 J.51 E.01311
G1 X83.012 Y138.326 E.01084
G1 X83.277 Y138.592 E.01153
G1 X83.484 Y138.659 E.00669
G1 X83.852 Y138.599 E.01148
G1 X84.036 Y138.454 E.00717
G1 X84.158 Y138.22 E.0081
G2 X84.045 Y137.669 I-.718 J-.139 E.01775
G1 X83.902 Y137.55 E.00572
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.045 Y137.669 E-.07069
G1 X84.151 Y137.868 E-.08562
G1 X84.172 Y138.079 E-.08059
G1 X84.158 Y138.22 E-.05407
G1 X84.036 Y138.454 E-.10019
G1 X83.852 Y138.599 E-.08873
G1 X83.484 Y138.659 E-.14202
G1 X83.277 Y138.592 E-.08268
G1 X83.174 Y138.488 E-.05541
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z5 I.564 J-1.078 P1  F36000
G1 X82.182 Y137.97 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.603 Y136.646 I1.395 J.073 E.07122
G1 X83.72 Y136.653 E.00391
G3 X82.18 Y138.03 I-.143 J1.39 E.21412
M204 S10000
G1 X81.783 Y137.938 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.827 Y137.672 E.00827
G3 X83.613 Y136.254 I1.751 J.371 E.07598
G1 X83.758 Y136.262 E.00446
G3 X81.789 Y137.995 I-.18 J1.78 E.25504
; WIPE_START
G1 F9000
M204 S6000
G1 X81.827 Y137.672 E-.12366
G1 X81.934 Y137.314 E-.14192
G1 X82.121 Y136.99 E-.14219
G1 X82.371 Y136.712 E-.14218
G1 X82.674 Y136.492 E-.14213
G1 X82.835 Y136.415 E-.06791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.669 Y137.858 F36000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46171
G1 F1200
M204 S6000
G1 X83.509 Y137.826 E.00556
G1 X83.369 Y137.94 E.00616
G1 X83.355 Y138.087 E.00502
G1 X83.469 Y138.227 E.00618
G1 X83.561 Y138.264 E.00336
G1 X83.743 Y138.183 E.00679
G1 X83.783 Y137.986 E.00688
G1 X83.709 Y137.903 E.0038
M204 S10000
G1 X84.18 Y138.017 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.143 Y137.806 E.00658
G1 X83.96 Y137.564 E.00936
G1 X83.76 Y137.455 E.007
G1 X83.408 Y137.439 E.01083
G1 X83.176 Y137.557 E.00799
G1 X82.996 Y137.802 E.00933
G1 X82.952 Y138.13 E.01016
G1 X83.1 Y138.451 E.01087
G1 X83.397 Y138.641 E.01085
G1 X83.614 Y138.663 E.00668
G1 X83.962 Y138.528 E.01148
G1 X84.141 Y138.284 E.00929
G1 X84.171 Y138.077 E.00644
M204 S10000
G1 X84.556 Y138.047 F36000
G1 F1200
M204 S6000
G1 X84.523 Y137.732 E.00973
G2 X84.201 Y137.266 I-1.421 J.637 E.01752
G1 X83.878 Y137.09 E.0113
G1 X83.507 Y137.041 E.01151
G1 X83.113 Y137.148 E.01252
G1 X82.789 Y137.411 E.01283
G1 X82.601 Y137.778 E.01267
G1 X82.592 Y138.248 E.01445
G1 X82.794 Y138.679 E.01463
G1 X83.021 Y138.866 E.00902
G1 X83.38 Y139.023 E.01206
G1 X83.669 Y139.04 E.00887
G1 X84.03 Y138.932 E.0116
G1 X84.349 Y138.674 E.0126
G1 X84.535 Y138.311 E.01253
G1 X84.551 Y138.107 E.00629
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.535 Y138.311 E-.0778
G1 X84.349 Y138.674 E-.15495
G1 X84.03 Y138.932 E-.15581
G1 X83.669 Y139.04 E-.14349
G1 X83.38 Y139.023 E-.10973
G1 X83.095 Y138.898 E-.11822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z5.2 I.868 J-.852 P1  F36000
G1 X82.184 Y137.97 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.203 Y137.752 E.00727
G3 X83.72 Y136.653 I1.367 J.29 E.0681
G3 X83.824 Y139.416 I-.151 J1.389 E.13206
G3 X82.175 Y138.115 I-.254 J-1.374 E.07885
G1 X82.18 Y138.03 E.00282
M204 S10000
G1 X81.783 Y137.939 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.828 Y137.672 E.0083
G3 X83.615 Y136.254 I1.75 J.37 E.07602
G1 X83.758 Y136.262 E.0044
G3 X81.79 Y137.995 I-.18 J1.779 E.25486
; WIPE_START
G1 F9000
M204 S6000
G1 X81.828 Y137.672 E-.1236
G1 X81.934 Y137.314 E-.14178
G1 X82.121 Y136.99 E-.14226
G1 X82.371 Y136.712 E-.1422
M73 P82 R1
G1 X82.674 Y136.492 E-.14223
G1 X82.835 Y136.415 E-.06793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.551 Y138.118 F36000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.565 Y137.936 E.00562
G1 X84.394 Y137.481 E.01492
G1 X84.204 Y137.266 E.00882
G1 X83.878 Y137.09 E.01137
G1 X83.507 Y137.041 E.01151
G1 X83.113 Y137.148 E.01253
G1 X82.789 Y137.411 E.01282
G2 X82.572 Y137.938 I1.489 J.919 E.01758
G1 X82.602 Y138.309 E.01144
G1 X82.784 Y138.666 E.01232
G1 X83.092 Y138.922 E.0123
G1 X83.57 Y139.041 E.01514
G1 X84.03 Y138.932 E.01452
G1 X84.349 Y138.674 E.0126
G1 X84.536 Y138.307 E.01266
G1 X84.546 Y138.178 E.00398
M204 S10000
G1 X84.15 Y137.866 F36000
G1 F1200
M204 S6000
G1 X84.054 Y137.65 E.00726
G1 X83.76 Y137.455 E.01084
G1 X83.408 Y137.439 E.01084
G1 X83.176 Y137.557 E.00799
G1 X83.025 Y137.74 E.0073
G1 X82.954 Y137.978 E.00762
G1 X83.014 Y138.329 E.01095
G1 X83.275 Y138.584 E.01121
G1 X83.61 Y138.664 E.01056
G1 X83.962 Y138.527 E.0116
G1 X84.142 Y138.283 E.00933
G2 X84.157 Y137.925 I-.614 J-.205 E.01114
M204 S10000
G1 X83.779 Y138.059 F36000
; LINE_WIDTH: 0.46031
G1 F1200
M204 S6000
G1 X83.731 Y137.891 E.00593
G1 X83.509 Y137.826 E.00789
G1 X83.388 Y137.913 E.00509
G1 X83.369 Y138.146 E.00793
G1 X83.572 Y138.26 E.00793
G1 X83.744 Y138.184 E.00638
G1 X83.762 Y138.117 E.00238
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8625.027
G1 X83.744 Y138.184 E-.04153
G1 X83.572 Y138.26 E-.11135
G1 X83.369 Y138.146 E-.13849
G1 X83.388 Y137.913 E-.13842
G1 X83.509 Y137.826 E-.08881
G1 X83.731 Y137.891 E-.13779
G1 X83.779 Y138.059 E-.10361
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z5.4 I.068 J-1.215 P1  F36000
G1 X82.183 Y137.97 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.606 Y136.646 I1.395 J.073 E.07132
G1 X83.72 Y136.653 E.00378
G3 X82.181 Y138.03 I-.142 J1.39 E.21409
M204 S10000
G1 X81.783 Y137.94 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.849 Y137.581 E.01121
G3 X83.617 Y136.254 I1.729 J.461 E.07322
G1 X83.758 Y136.262 E.00434
G3 X81.789 Y137.997 I-.18 J1.78 E.25496
; WIPE_START
G1 F9000
M204 S6000
G1 X81.849 Y137.581 E-.15953
G1 X81.953 Y137.273 E-.12376
G1 X82.121 Y136.99 E-.12478
G1 X82.371 Y136.712 E-.14217
G1 X82.674 Y136.492 E-.14227
G1 X82.834 Y136.416 E-.06748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.853 Y137.364 F36000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.65 Y137.654 E.01089
G1 X82.572 Y137.933 E.00889
G1 X82.601 Y138.305 E.01146
G1 X82.786 Y138.67 E.01258
G1 X83.07 Y138.912 E.01146
G1 X83.464 Y139.04 E.01273
G1 X83.872 Y138.998 E.01259
G1 X84.199 Y138.821 E.01144
G1 X84.439 Y138.541 E.01131
G1 X84.566 Y138.152 E.01259
G2 X84.463 Y137.586 I-1.586 J-.003 E.01776
G2 X83.975 Y137.131 I-1.099 J.688 E.02074
G1 X83.506 Y137.041 E.01466
G1 X83.113 Y137.148 E.01253
G1 X82.899 Y137.325 E.00853
M204 S10000
G1 X83.704 Y138.208 F36000
; LINE_WIDTH: 0.46208
G1 F1200
M204 S6000
G1 X83.784 Y138.093 E.00478
G1 X83.773 Y137.959 E.0046
G1 X83.658 Y137.843 E.00557
G1 X83.458 Y137.849 E.00684
G1 X83.354 Y137.992 E.00605
G1 X83.381 Y138.158 E.00576
G1 X83.545 Y138.265 E.00669
G1 X83.647 Y138.228 E.0037
M204 S10000
G1 X83.795 Y138.611 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.958 Y138.523 E.00569
G1 X84.163 Y138.234 E.01086
G1 X84.17 Y137.927 E.00943
G1 X84.1 Y137.72 E.00674
G1 X83.861 Y137.493 E.01012
G1 X83.512 Y137.422 E.01093
G1 X83.246 Y137.511 E.00861
G1 X83.021 Y137.747 E.01001
G1 X82.952 Y137.958 E.00681
G1 X83.013 Y138.327 E.01149
G1 X83.273 Y138.59 E.01139
G1 X83.561 Y138.663 E.00911
G1 X83.737 Y138.624 E.00554
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.561 Y138.663 E-.06848
G1 X83.273 Y138.59 E-.11263
G1 X83.013 Y138.327 E-.14081
G1 X82.952 Y137.958 E-.14209
G1 X83.021 Y137.747 E-.08424
G1 X83.246 Y137.511 E-.12383
G1 X83.466 Y137.438 E-.08792
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z5.6 I-.475 J-1.121 P1  F36000
G1 X82.177 Y137.984 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.202 Y137.752 E.00773
G3 X83.72 Y136.653 I1.367 J.29 E.06813
G3 X83.715 Y139.432 I-.151 J1.389 E.13576
G3 X82.172 Y138.043 I-.146 J-1.39 E.07764
M204 S10000
G1 X81.782 Y137.942 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.849 Y137.581 E.01127
G3 X83.619 Y136.254 I1.729 J.461 E.07328
G1 X83.758 Y136.262 E.00428
G3 X81.789 Y137.998 I-.18 J1.78 E.25493
; WIPE_START
G1 F9000
M204 S6000
G1 X81.849 Y137.581 E-.1599
G1 X81.953 Y137.275 E-.12296
G1 X82.121 Y136.99 E-.12562
G1 X82.371 Y136.712 E-.14213
G1 X82.672 Y136.493 E-.1415
G1 X82.833 Y136.416 E-.0679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P83 R1
G3 Z5.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.23 Y137.117 F36000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.934 Y137.269 E.01023
G1 X82.699 Y137.543 E.0111
G1 X82.572 Y137.933 E.01258
G1 X82.601 Y138.305 E.01147
G1 X82.786 Y138.67 E.01257
G1 X83.07 Y138.912 E.01147
G1 X83.459 Y139.039 E.01258
G1 X83.831 Y139.01 E.01146
G1 X84.2 Y138.822 E.01272
G1 X84.459 Y138.504 E.0126
G1 X84.565 Y138.147 E.01146
G2 X84.463 Y137.586 I-1.57 J-.003 E.01761
G2 X83.975 Y137.131 I-1.099 J.688 E.02074
G1 X83.506 Y137.041 E.01466
G1 X83.288 Y137.101 E.00696
M204 S10000
G1 X83.488 Y137.854 F36000
; LINE_WIDTH: 0.45929
G1 F1200
M204 S6000
G1 X83.353 Y137.978 E.00622
G1 X83.38 Y138.159 E.00622
G1 X83.518 Y138.258 E.00577
G1 X83.71 Y138.218 E.00663
G1 X83.782 Y138.064 E.00579
G1 X83.774 Y137.958 E.00361
G1 X83.659 Y137.842 E.00556
G1 X83.548 Y137.85 E.00377
M204 S10000
G1 X84.17 Y137.927 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00673
G1 X83.861 Y137.493 E.01013
G1 X83.512 Y137.422 E.01093
G1 X83.172 Y137.57 E.01139
G1 X82.975 Y137.85 E.01052
G1 X82.973 Y138.221 E.0114
G1 X83.073 Y138.419 E.0068
G1 X83.377 Y138.636 E.01149
G1 X83.747 Y138.638 E.01139
G1 X84.003 Y138.486 E.00913
G2 X84.174 Y137.987 I-.494 J-.449 E.01668
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.184 Y138.106 E-.04556
G1 X84.13 Y138.287 E-.07168
G1 X84.003 Y138.486 E-.08976
G1 X83.747 Y138.638 E-.11295
G1 X83.377 Y138.636 E-.14087
G1 X83.073 Y138.419 E-.14205
G1 X82.973 Y138.221 E-.08408
G1 X82.974 Y138.029 E-.07305
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z5.8 I.09 J-1.214 P1  F36000
G1 X82.184 Y137.97 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.61 Y136.646 I1.395 J.072 E.07143
G1 X83.72 Y136.653 E.00365
G3 X82.182 Y138.03 I-.142 J1.389 E.214
M204 S10000
G1 X81.782 Y137.944 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.85 Y137.582 E.01134
G3 X83.621 Y136.254 I1.728 J.46 E.07333
G1 X83.758 Y136.262 E.00422
G3 X81.79 Y137.998 I-.179 J1.779 E.25479
; WIPE_START
G1 F9000
M204 S6000
G1 X81.85 Y137.582 E-.15988
G1 X81.952 Y137.277 E-.12225
G1 X82.121 Y136.99 E-.12629
G1 X82.371 Y136.712 E-.14222
G1 X82.674 Y136.492 E-.14222
G1 X82.833 Y136.416 E-.06714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.551 Y137.975 F36000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.536 Y137.785 E.00586
G1 X84.343 Y137.407 E.01303
G1 X83.975 Y137.131 E.01413
G1 X83.506 Y137.041 E.01467
G1 X83.113 Y137.148 E.01252
G1 X82.853 Y137.364 E.01038
G1 X82.65 Y137.652 E.01084
G1 X82.571 Y137.937 E.00909
G1 X82.613 Y138.345 E.01259
G1 X82.787 Y138.667 E.01125
G1 X83.116 Y138.935 E.01303
G1 X83.464 Y139.039 E.01117
G1 X83.831 Y139.01 E.0113
G1 X84.196 Y138.825 E.01259
G1 X84.439 Y138.541 E.01147
G1 X84.566 Y138.152 E.01256
G1 X84.556 Y138.035 E.00362
M204 S10000
G1 X84.101 Y137.763 F36000
G1 F1200
M204 S6000
G2 X83.782 Y137.458 I-.608 J.315 E.01381
G1 X83.408 Y137.439 E.01153
G1 X83.193 Y137.546 E.00738
G1 X82.975 Y137.85 E.0115
G1 X82.957 Y138.152 E.00929
G1 X83.083 Y138.422 E.00914
G1 X83.295 Y138.595 E.00842
G1 X83.505 Y138.657 E.00671
G1 X83.853 Y138.598 E.01085
G1 X84.117 Y138.337 E.0114
G1 X84.185 Y138.128 E.00678
G2 X84.119 Y137.82 I-.729 J-.003 E.00974
M204 S10000
G1 X83.781 Y138.037 F36000
; LINE_WIDTH: 0.4568
G1 F1200
M204 S6000
G1 X83.699 Y137.874 E.00617
G1 X83.508 Y137.824 E.00664
G1 X83.353 Y137.974 E.00728
G1 X83.361 Y138.106 E.00445
G1 X83.484 Y138.238 E.00609
G1 X83.681 Y138.238 E.00667
G1 X83.784 Y138.096 E.0059
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8698.174
G1 X83.681 Y138.238 E-.10376
G1 X83.484 Y138.238 E-.11728
G1 X83.361 Y138.106 E-.10721
G1 X83.353 Y137.974 E-.07835
G1 X83.508 Y137.824 E-.12806
G1 X83.699 Y137.874 E-.11682
G1 X83.781 Y138.037 E-.10852
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z6 I.051 J-1.216 P1  F36000
G1 X82.184 Y137.97 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.612 Y136.646 I1.395 J.072 E.07148
G1 X83.719 Y136.653 E.00358
G3 X82.182 Y138.03 I-.141 J1.389 E.21401
M204 S10000
G1 X81.782 Y137.947 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.85 Y137.582 E.01143
G3 X83.623 Y136.254 I1.728 J.46 E.07339
G1 X83.757 Y136.262 E.00415
G3 X81.79 Y137.999 I-.179 J1.779 E.25478
; WIPE_START
G1 F9000
M204 S6000
G1 X81.85 Y137.582 E-.16011
M73 P84 R1
G1 X81.951 Y137.278 E-.12142
G1 X82.121 Y136.99 E-.12711
G1 X82.371 Y136.712 E-.14216
G1 X82.674 Y136.492 E-.14223
G1 X82.833 Y136.416 E-.06698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.551 Y137.969 F36000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.536 Y137.784 E.00569
G1 X84.366 Y137.438 E.01187
G1 X83.972 Y137.129 E.01538
G1 X83.506 Y137.041 E.01455
G1 X83.113 Y137.148 E.01251
G1 X82.853 Y137.363 E.01038
G1 X82.649 Y137.655 E.01092
G1 X82.572 Y137.93 E.00879
G1 X82.601 Y138.298 E.01133
G1 X82.797 Y138.682 E.01326
G1 X83.107 Y138.932 E.01224
G1 X83.464 Y139.039 E.01145
G1 X83.835 Y139.009 E.01145
G1 X84.196 Y138.825 E.01244
G1 X84.488 Y138.433 E.01502
G1 X84.566 Y138.152 E.00896
G1 X84.556 Y138.029 E.00379
M204 S10000
G1 X83.963 Y137.585 F36000
G1 F1200
M204 S6000
G1 X83.782 Y137.458 E.00679
G1 X83.408 Y137.439 E.01153
G1 X83.193 Y137.546 E.00739
G1 X82.975 Y137.85 E.0115
G1 X82.971 Y138.193 E.01054
G1 X83.176 Y138.528 E.01204
G1 X83.504 Y138.657 E.01084
G1 X83.852 Y138.599 E.01084
G1 X84.119 Y138.334 E.01154
G1 X84.185 Y138.127 E.00669
G2 X84 Y137.633 I-.739 J-.005 E.01659
M204 S10000
G1 X83.709 Y137.889 F36000
; LINE_WIDTH: 0.457365
G1 F1200
M204 S6000
G2 X83.452 Y137.852 I-.156 J.173 E.0093
G1 X83.352 Y137.991 E.00577
G1 X83.429 Y138.22 E.00817
G1 X83.663 Y138.247 E.00795
G1 X83.786 Y138.094 E.00665
G2 X83.736 Y137.942 I-.211 J-.015 E.00553
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8686.32
G1 X83.781 Y138.031 E-.05912
G1 X83.786 Y138.094 E-.03752
G1 X83.663 Y138.247 E-.11698
G1 X83.429 Y138.22 E-.13992
G1 X83.352 Y137.991 E-.14375
G1 X83.452 Y137.852 E-.10147
G1 X83.592 Y137.832 E-.0839
G1 X83.709 Y137.889 E-.07735
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z6.2 I-.065 J-1.215 P1  F36000
G1 X82.183 Y137.97 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.613 Y136.646 I1.395 J.073 E.07155
G1 X83.719 Y136.653 E.00352
G3 X82.181 Y138.03 I-.141 J1.39 E.21412
M204 S10000
G1 X81.781 Y137.95 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.791 Y137.949 E.00031
G3 X83.625 Y136.254 I1.787 J.093 E.08492
G1 X83.757 Y136.262 E.00409
G3 X81.811 Y138.321 I-.179 J1.78 E.24498
G1 X81.786 Y138.01 E.0096
; WIPE_START
G1 F9000
M204 S6000
G1 X81.791 Y137.949 E-.02298
G1 X81.84 Y137.579 E-.14195
G1 X81.974 Y137.23 E-.1422
G1 X82.121 Y136.99 E-.10667
G1 X82.371 Y136.712 E-.14228
G1 X82.672 Y136.493 E-.14135
G1 X82.821 Y136.422 E-.06256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.551 Y137.969 F36000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.536 Y137.784 E.00568
G1 X84.367 Y137.439 E.01182
G1 X83.971 Y137.129 E.01543
G1 X83.506 Y137.041 E.01456
G2 X82.929 Y137.271 I.258 J1.489 E.01921
G1 X82.677 Y137.582 E.0123
G1 X82.572 Y137.94 E.01145
G1 X82.601 Y138.3 E.0111
G1 X82.795 Y138.677 E.01304
G1 X83.07 Y138.912 E.01112
G1 X83.464 Y139.04 E.01272
G2 X84.113 Y138.879 I.016 J-1.319 E.02078
G1 X84.439 Y138.541 E.01442
G1 X84.566 Y138.152 E.01257
G1 X84.556 Y138.029 E.00381
M204 S10000
G1 X83.958 Y137.581 F36000
G1 F1200
M204 S6000
G1 X83.783 Y137.458 E.00659
G1 X83.437 Y137.434 E.01065
G1 X83.083 Y137.65 E.01271
G1 X82.954 Y137.979 E.01088
G1 X82.971 Y138.195 E.00664
G1 X83.097 Y138.439 E.00844
G1 X83.377 Y138.636 E.01052
G1 X83.614 Y138.663 E.00733
G1 X83.945 Y138.538 E.01088
G1 X84.163 Y138.235 E.01148
G2 X83.995 Y137.628 I-.633 J-.151 E.02018
M204 S10000
G1 X83.708 Y137.888 F36000
; LINE_WIDTH: 0.45745
G1 F1200
M204 S6000
G1 X83.598 Y137.833 E.00415
G1 X83.395 Y137.9 E.00721
G1 X83.359 Y138.084 E.00633
G1 X83.495 Y138.255 E.00737
G1 X83.69 Y138.227 E.00667
G1 X83.786 Y138.093 E.00556
G2 X83.735 Y137.941 I-.21 J-.015 E.00555
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8684.535
G1 X83.781 Y138.031 E-.06017
G1 X83.786 Y138.093 E-.03773
G1 X83.69 Y138.227 E-.09874
G1 X83.495 Y138.255 E-.11836
G1 X83.359 Y138.084 E-.13083
G1 X83.395 Y137.9 E-.11247
G1 X83.598 Y137.833 E-.12805
G1 X83.708 Y137.888 E-.07364
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z6.4 I-.065 J-1.215 P1  F36000
G1 X82.183 Y137.97 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.615 Y136.646 I1.395 J.073 E.0716
G1 X83.719 Y136.653 E.00346
G3 X82.181 Y138.03 I-.141 J1.39 E.21414
M204 S10000
G1 X81.782 Y137.953 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.791 Y137.949 E.00032
G3 X83.627 Y136.254 I1.787 J.093 E.08498
M73 P85 R1
G1 X83.757 Y136.262 E.00403
G3 X81.811 Y138.321 I-.179 J1.78 E.24498
G1 X81.786 Y138.013 E.00949
; WIPE_START
G1 F9000
M204 S6000
G1 X81.791 Y137.949 E-.02425
G1 X81.84 Y137.579 E-.14201
G1 X81.949 Y137.282 E-.12022
G1 X82.121 Y136.99 E-.12861
G1 X82.371 Y136.712 E-.14219
G1 X82.672 Y136.493 E-.14141
G1 X82.818 Y136.424 E-.06131
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.23 Y137.117 F36000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01023
G1 X82.699 Y137.543 E.01107
G1 X82.572 Y137.933 E.0126
G1 X82.602 Y138.3 E.01133
G1 X82.795 Y138.677 E.01303
G1 X83.07 Y138.912 E.01112
G1 X83.459 Y139.039 E.01256
G1 X83.827 Y139.01 E.01134
G1 X84.171 Y138.841 E.01177
G1 X84.44 Y138.539 E.01243
G1 X84.566 Y138.152 E.0125
G2 X84.463 Y137.586 I-1.587 J-.003 E.01776
G2 X83.975 Y137.131 I-1.099 J.687 E.02074
G1 X83.506 Y137.041 E.01468
G1 X83.288 Y137.101 E.00696
M204 S10000
G1 X83.487 Y137.853 F36000
; LINE_WIDTH: 0.45667
G1 F1200
M204 S6000
G1 X83.352 Y137.978 E.0062
G1 X83.413 Y138.189 E.00741
G1 X83.518 Y138.26 E.00426
G1 X83.695 Y138.214 E.00616
G1 X83.786 Y138.097 E.00504
G1 X83.776 Y137.958 E.00469
G1 X83.659 Y137.841 E.00557
G1 X83.547 Y137.849 E.0038
M204 S10000
G1 X84.17 Y137.927 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00672
G1 X83.861 Y137.493 E.01012
G1 X83.512 Y137.422 E.01095
G1 X83.172 Y137.57 E.01138
G1 X82.975 Y137.851 E.01053
G1 X82.971 Y138.195 E.01058
G1 X83.097 Y138.439 E.00843
G1 X83.377 Y138.636 E.01053
G1 X83.725 Y138.64 E.01071
G1 X83.938 Y138.535 E.00729
G1 X84.163 Y138.234 E.01153
G1 X84.168 Y137.987 E.00761
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.163 Y138.234 E-.09413
G1 X83.938 Y138.535 E-.14256
G1 X83.725 Y138.64 E-.09018
G1 X83.377 Y138.636 E-.13251
G1 X83.097 Y138.439 E-.13019
G1 X82.971 Y138.195 E-.10426
G1 X82.973 Y138.021 E-.06618
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z6.6 I.078 J-1.214 P1  F36000
G1 X82.184 Y137.97 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.617 Y136.646 I1.395 J.072 E.07165
G1 X83.719 Y136.653 E.00338
G3 X82.182 Y138.03 I-.14 J1.389 E.21404
M204 S10000
G1 X81.781 Y137.957 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.792 Y137.949 E.0004
G3 X83.629 Y136.254 I1.786 J.092 E.08503
G1 X83.757 Y136.262 E.00396
G3 X81.8 Y138.228 I-.179 J1.779 E.24772
G1 X81.785 Y138.017 E.00651
; WIPE_START
G1 F9000
M204 S6000
G1 X81.792 Y137.949 E-.02576
G1 X81.84 Y137.579 E-.14188
G1 X81.948 Y137.284 E-.11958
G1 X82.121 Y136.99 E-.12935
G1 X82.371 Y136.712 E-.14219
G1 X82.674 Y136.492 E-.14217
G1 X82.814 Y136.425 E-.05906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.594 Y137.835 F36000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.461937
G1 F1200
M204 S6000
G1 X83.453 Y137.854 E.00485
G1 X83.354 Y137.992 E.00579
G1 X83.379 Y138.157 E.00571
G1 X83.517 Y138.257 E.00581
G1 X83.684 Y138.231 E.00576
G1 X83.792 Y138.061 E.00687
G1 X83.752 Y137.923 E.00492
G1 X83.646 Y137.864 E.00413
M204 S10000
G1 X83.246 Y137.511 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.021 Y137.747 E.01
G1 X82.952 Y137.957 E.00681
G1 X83.013 Y138.326 E.01148
G1 X83.274 Y138.59 E.01143
G1 X83.484 Y138.659 E.00677
G1 X83.852 Y138.599 E.01147
G1 X84.117 Y138.337 E.01145
G1 X84.19 Y138.061 E.00875
G1 X84.113 Y137.74 E.01014
G1 X83.861 Y137.493 E.01087
M73 P86 R1
G1 X83.511 Y137.422 E.01094
G1 X83.303 Y137.492 E.00675
M204 S10000
G1 X82.853 Y137.363 F36000
G1 F1200
M204 S6000
G1 X82.65 Y137.654 E.0109
G1 X82.572 Y137.933 E.00888
G1 X82.602 Y138.309 E.0116
G1 X82.786 Y138.67 E.01244
G1 X83.071 Y138.912 E.01149
G1 X83.459 Y139.039 E.01255
G1 X83.836 Y139.009 E.01161
G1 X84.196 Y138.825 E.01244
G1 X84.439 Y138.54 E.01148
G1 X84.567 Y138.147 E.0127
G1 X84.567 Y138.061 E.00263
G1 X84.487 Y137.675 E.01214
G1 X84.351 Y137.415 E.009
G1 X83.975 Y137.131 E.0145
G1 X83.506 Y137.041 E.01467
G1 X83.113 Y137.148 E.0125
G1 X82.899 Y137.325 E.00854
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.113 Y137.148 E-.10565
G1 X83.506 Y137.041 E-.15461
G1 X83.975 Y137.131 E-.18144
G1 X84.351 Y137.415 E-.17929
G1 X84.487 Y137.675 E-.11125
G1 X84.502 Y137.746 E-.02777
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z6.8 I-.117 J-1.211 P1  F36000
G1 X82.183 Y137.97 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.619 Y136.646 I1.395 J.073 E.07172
G1 X83.719 Y136.653 E.00331
G3 X82.181 Y138.03 I-.14 J1.39 E.21416
M204 S10000
G1 X81.782 Y137.961 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.791 Y137.949 E.00046
G3 X83.631 Y136.254 I1.787 J.093 E.08511
G1 X83.757 Y136.262 E.0039
G3 X81.811 Y138.321 I-.179 J1.78 E.24499
G1 X81.787 Y138.021 E.00926
; WIPE_START
G1 F9000
M204 S6000
G1 X81.791 Y137.949 E-.02716
G1 X81.84 Y137.579 E-.14189
G1 X81.947 Y137.286 E-.11881
G1 X82.121 Y136.99 E-.13005
G1 X82.371 Y136.712 E-.14223
G1 X82.674 Y136.492 E-.14225
G1 X82.811 Y136.427 E-.05761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.853 Y137.363 F36000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.65 Y137.654 E.01089
G1 X82.572 Y137.933 E.0089
G1 X82.601 Y138.305 E.01149
G1 X82.786 Y138.67 E.01255
G1 X83.071 Y138.912 E.01149
G1 X83.459 Y139.039 E.01255
G1 X83.835 Y139.009 E.01161
G1 X84.196 Y138.825 E.01245
G1 X84.439 Y138.54 E.01149
G1 X84.566 Y138.152 E.01255
G2 X84.463 Y137.586 I-1.588 J-.003 E.01777
G2 X83.975 Y137.131 I-1.1 J.688 E.02073
G1 X83.506 Y137.041 E.01468
G1 X83.113 Y137.148 E.0125
G1 X82.899 Y137.325 E.00854
M204 S10000
G1 X83.658 Y137.843 F36000
; LINE_WIDTH: 0.46197
G1 F1200
M204 S6000
G1 X83.458 Y137.849 E.00685
G1 X83.354 Y137.992 E.00604
G1 X83.381 Y138.158 E.00574
G1 X83.517 Y138.257 E.00575
G1 X83.684 Y138.231 E.00575
G1 X83.784 Y138.093 E.00582
G1 X83.773 Y137.958 E.00464
G1 X83.701 Y137.886 E.00349
M204 S10000
G1 X84.17 Y137.927 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00672
G1 X83.861 Y137.493 E.01013
G1 X83.511 Y137.422 E.01094
G1 X83.246 Y137.511 E.00859
G1 X83.021 Y137.747 E.01
G1 X82.952 Y137.958 E.00683
G1 X83.013 Y138.326 E.01149
G1 X83.274 Y138.59 E.01141
G1 X83.483 Y138.659 E.00677
G1 X83.852 Y138.599 E.01148
G1 X84.117 Y138.337 E.01144
G1 X84.186 Y138.127 E.00678
G1 X84.174 Y137.986 E.00434
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.186 Y138.127 E-.05366
G1 X84.117 Y138.337 E-.08384
G1 X83.852 Y138.599 E-.14146
G1 X83.483 Y138.659 E-.14199
G1 X83.274 Y138.59 E-.08369
G1 X83.013 Y138.326 E-.14115
G1 X82.964 Y138.03 E-.11421
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z7 I.093 J-1.213 P1  F36000
G1 X82.185 Y137.97 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.621 Y136.646 I1.394 J.072 E.07176
G1 X83.719 Y136.653 E.00326
G3 X82.183 Y138.03 I-.14 J1.389 E.21395
M204 S10000
G1 X81.782 Y137.965 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.793 Y137.949 E.00058
G3 X83.633 Y136.254 I1.786 J.092 E.08514
G1 X83.757 Y136.262 E.00384
G3 X81.812 Y138.321 I-.179 J1.779 E.24477
G1 X81.787 Y138.025 E.00913
; WIPE_START
G1 F9000
M204 S6000
G1 X81.793 Y137.949 E-.02869
G1 X81.84 Y137.579 E-.14188
G1 X81.947 Y137.287 E-.11801
G1 X82.121 Y136.99 E-.13091
G1 X82.371 Y136.712 E-.14221
G1 X82.672 Y136.493 E-.14136
G1 X82.807 Y136.429 E-.05694
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.101 Y137.183 F36000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.00578
G1 X82.7 Y137.543 E.01106
G1 X82.572 Y137.933 E.01261
G1 X82.602 Y138.3 E.01133
G1 X82.795 Y138.678 E.01303
G1 X83.074 Y138.915 E.01124
M73 P87 R1
G1 X83.464 Y139.04 E.01259
G1 X83.879 Y138.997 E.01281
G2 X84.416 Y138.57 I-.518 J-1.204 E.02135
G1 X84.536 Y138.307 E.00887
G1 X84.565 Y137.935 E.01144
G1 X84.459 Y137.58 E.01138
G1 X84.204 Y137.266 E.01244
G1 X83.878 Y137.09 E.01138
G1 X83.416 Y137.056 E.01424
G1 X83.156 Y137.16 E.0086
M204 S10000
G1 X83.395 Y138.153 F36000
; LINE_WIDTH: 0.45834
G1 F1200
M204 S6000
G1 X83.503 Y138.258 E.00508
G1 X83.653 Y138.249 E.0051
G1 X83.774 Y138.129 E.00576
G2 X83.732 Y137.89 I-.343 J-.062 E.00841
G1 X83.542 Y137.826 E.00679
G1 X83.357 Y137.967 E.00787
G1 X83.383 Y138.095 E.00441
M204 S10000
G1 X84.175 Y138.087 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G2 X84.054 Y137.649 I-.746 J-.03 E.01419
G1 X83.76 Y137.455 E.01082
G1 X83.437 Y137.434 E.00996
G1 X83.172 Y137.57 E.00915
G1 X82.975 Y137.85 E.01052
G1 X82.971 Y138.195 E.01059
G1 X83.096 Y138.439 E.00842
G1 X83.376 Y138.636 E.01051
G1 X83.634 Y138.663 E.00798
G1 X83.862 Y138.591 E.00736
G1 X84.125 Y138.326 E.01147
G1 X84.163 Y138.146 E.00564
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.125 Y138.326 E-.06973
G1 X83.862 Y138.591 E-.14191
G1 X83.634 Y138.663 E-.09098
G1 X83.376 Y138.636 E-.09868
G1 X83.096 Y138.439 E-.12994
G1 X82.971 Y138.195 E-.10415
G1 X82.975 Y137.867 E-.12459
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z7.2 I-.157 J-1.207 P1  F36000
G1 X82.183 Y137.97 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.622 Y136.646 I1.395 J.073 E.07184
G1 X83.718 Y136.653 E.00319
G3 X82.181 Y138.03 I-.14 J1.39 E.21417
M204 S10000
G1 X81.782 Y137.97 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.791 Y137.949 E.00068
G3 X83.634 Y136.254 I1.787 J.093 E.08523
G1 X83.757 Y136.262 E.00378
G3 X81.811 Y138.321 I-.179 J1.78 E.24499
G1 X81.787 Y138.029 E.00899
; WIPE_START
G1 F9000
M204 S6000
G1 X81.791 Y137.949 E-.03044
G1 X81.84 Y137.579 E-.14199
G1 X81.946 Y137.289 E-.11721
G1 X82.121 Y136.99 E-.13159
G1 X82.371 Y136.712 E-.14226
G1 X82.672 Y136.493 E-.14132
G1 X82.803 Y136.431 E-.0552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.229 Y137.117 F36000
G1 Z7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01023
G1 X82.7 Y137.543 E.01105
G1 X82.572 Y137.933 E.01262
G1 X82.601 Y138.306 E.0115
G1 X82.789 Y138.674 E.01269
G1 X83.109 Y138.934 E.01267
G1 X83.47 Y139.04 E.01155
G1 X83.871 Y138.999 E.0124
G1 X84.199 Y138.821 E.01148
G1 X84.439 Y138.54 E.01134
G1 X84.566 Y138.152 E.01254
G2 X84.463 Y137.586 I-1.589 J-.003 E.01776
G2 X83.975 Y137.131 I-1.098 J.687 E.02074
G1 X83.506 Y137.041 E.01469
G1 X83.287 Y137.101 E.00696
M204 S10000
G1 X83.488 Y137.854 F36000
; LINE_WIDTH: 0.45883
G1 F1200
M204 S6000
G1 X83.353 Y137.978 E.00621
G1 X83.393 Y138.184 E.00712
G1 X83.586 Y138.265 E.00709
G1 X83.731 Y138.178 E.00571
G1 X83.785 Y138.094 E.00341
G1 X83.774 Y137.957 E.00464
G1 X83.659 Y137.842 E.00554
G1 X83.547 Y137.85 E.00379
M204 S10000
G1 X83.33 Y138.606 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.648 Y138.661 E.00993
G1 X83.958 Y138.523 E.01044
G1 X84.163 Y138.235 E.01085
G1 X84.17 Y137.926 E.00948
G1 X84.1 Y137.72 E.00669
G1 X83.861 Y137.493 E.01013
G1 X83.511 Y137.422 E.01095
G1 X83.172 Y137.57 E.01138
G1 X82.975 Y137.851 E.01052
G1 X82.973 Y138.222 E.01141
G1 X83.124 Y138.476 E.00907
G1 X83.279 Y138.574 E.00563
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.124 Y138.476 E-.06962
G1 X82.973 Y138.222 E-.11223
G1 X82.975 Y137.851 E-.14117
G1 X83.172 Y137.57 E-.13009
G1 X83.511 Y137.422 E-.1408
G1 X83.861 Y137.493 E-.13547
G1 X83.919 Y137.548 E-.03063
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z7.4 I-.288 J-1.183 P1  F36000
G1 X82.184 Y137.97 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.624 Y136.646 I1.394 J.072 E.07189
G1 X83.718 Y136.653 E.00312
G3 X82.182 Y138.03 I-.14 J1.389 E.21401
M204 S10000
G1 X81.783 Y137.974 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.792 Y137.949 E.00081
G3 X83.637 Y136.254 I1.786 J.092 E.08528
G1 X83.757 Y136.262 E.00371
G3 X81.812 Y138.321 I-.179 J1.779 E.24481
G1 X81.788 Y138.034 E.00884
; WIPE_START
G1 F9000
M204 S6000
G1 X81.792 Y137.949 E-.03217
G1 X81.84 Y137.579 E-.14197
G1 X81.945 Y137.291 E-.11646
G1 X82.121 Y136.99 E-.13241
G1 X82.371 Y136.712 E-.14206
G1 X82.672 Y136.493 E-.1414
G1 X82.799 Y136.433 E-.05353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.229 Y137.117 F36000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01022
G1 X82.7 Y137.543 E.01106
G1 X82.572 Y137.933 E.01261
G1 X82.601 Y138.306 E.01151
G1 X82.786 Y138.67 E.01254
G1 X83.071 Y138.913 E.01151
G1 X83.464 Y139.04 E.01269
G1 X83.872 Y138.998 E.01259
G1 X84.199 Y138.821 E.01145
M73 P88 R1
G1 X84.439 Y138.54 E.01135
G1 X84.566 Y138.152 E.01254
G2 X84.463 Y137.586 I-1.589 J-.003 E.01776
G2 X83.975 Y137.131 I-1.098 J.687 E.02074
G1 X83.506 Y137.041 E.01469
G1 X83.287 Y137.101 E.00696
M204 S10000
G1 X83.487 Y137.854 F36000
; LINE_WIDTH: 0.458848
G1 F1200
M204 S6000
G1 X83.353 Y137.978 E.00621
G1 X83.379 Y138.159 E.00619
G1 X83.545 Y138.267 E.00671
G1 X83.705 Y138.209 E.00574
G1 X83.785 Y138.094 E.00476
G1 X83.774 Y137.957 E.00465
G1 X83.659 Y137.842 E.00554
G1 X83.547 Y137.85 E.00379
M204 S10000
G1 X84.17 Y137.926 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00669
G1 X83.861 Y137.493 E.01013
G1 X83.511 Y137.422 E.01095
G1 X83.172 Y137.57 E.01138
G1 X82.975 Y137.851 E.01053
G1 X82.973 Y138.222 E.01141
G1 X83.073 Y138.418 E.00676
G1 X83.376 Y138.636 E.01148
G1 X83.679 Y138.654 E.0093
G1 X83.958 Y138.523 E.00949
G1 X84.163 Y138.235 E.01085
G1 X84.168 Y137.986 E.00765
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.163 Y138.235 E-.09457
G1 X83.958 Y138.523 E-.13417
G1 X83.679 Y138.654 E-.11737
G1 X83.376 Y138.636 E-.115
G1 X83.073 Y138.418 E-.14202
G1 X82.973 Y138.222 E-.08366
G1 X82.974 Y138.03 E-.07321
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z7.6 I.091 J-1.214 P1  F36000
G1 X82.184 Y137.97 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.626 Y136.646 I1.395 J.072 E.07196
G1 X83.718 Y136.653 E.00306
G3 X82.182 Y138.03 I-.14 J1.389 E.21406
M204 S10000
G1 X81.783 Y137.979 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.792 Y137.949 E.00095
G3 X83.639 Y136.254 I1.786 J.092 E.08535
G1 X83.757 Y136.262 E.00365
G3 X81.811 Y138.321 I-.179 J1.779 E.24484
G1 X81.788 Y138.039 E.0087
; WIPE_START
G1 F9000
M204 S6000
G1 X81.792 Y137.949 E-.03398
G1 X81.84 Y137.579 E-.14197
G1 X81.944 Y137.293 E-.11572
G1 X82.121 Y136.99 E-.13314
G1 X82.371 Y136.712 E-.14219
G1 X82.672 Y136.493 E-.14133
G1 X82.795 Y136.435 E-.05166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.229 Y137.117 F36000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01023
G1 X82.7 Y137.542 E.01105
G1 X82.572 Y137.933 E.01262
G1 X82.601 Y138.306 E.01151
G1 X82.789 Y138.674 E.01268
G1 X83.109 Y138.934 E.01266
G1 X83.467 Y139.039 E.01146
G1 X83.83 Y139.01 E.01119
G1 X84.196 Y138.825 E.01262
G1 X84.439 Y138.54 E.01151
G1 X84.566 Y138.152 E.01253
G2 X84.463 Y137.586 I-1.589 J-.003 E.01776
G2 X83.975 Y137.131 I-1.098 J.687 E.02074
G1 X83.505 Y137.041 E.01469
G1 X83.287 Y137.101 E.00695
M204 S10000
G1 X83.488 Y137.854 F36000
; LINE_WIDTH: 0.45923
G1 F1200
M204 S6000
G1 X83.353 Y137.978 E.0062
G1 X83.394 Y138.184 E.00712
G1 X83.548 Y138.256 E.00579
G1 X83.686 Y138.23 E.00477
G1 X83.785 Y138.094 E.00571
G1 X83.774 Y137.957 E.00465
G1 X83.659 Y137.842 E.00553
G1 X83.547 Y137.85 E.00379
M204 S10000
G1 X83.33 Y138.605 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.506 Y138.657 E.00567
G1 X83.853 Y138.598 E.01081
G1 X84.117 Y138.336 E.01142
G2 X84.17 Y137.926 I-.467 J-.268 E.01305
G1 X84.1 Y137.72 E.00669
G1 X83.861 Y137.493 E.01013
G1 X83.511 Y137.422 E.01096
G1 X83.172 Y137.57 E.01138
G1 X82.975 Y137.85 E.01052
G1 X82.973 Y138.222 E.01143
G1 X83.124 Y138.476 E.00907
G1 X83.279 Y138.573 E.00562
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.124 Y138.476 E-.06952
G1 X82.973 Y138.222 E-.11213
G1 X82.975 Y137.85 E-.1413
G1 X83.172 Y137.57 E-.13009
G1 X83.511 Y137.422 E-.14069
G1 X83.861 Y137.493 E-.1355
G1 X83.919 Y137.548 E-.03076
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z7.8 I-.287 J-1.183 P1  F36000
G1 X82.183 Y137.97 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.628 Y136.647 I1.395 J.073 E.07203
G1 X83.718 Y136.653 E.00299
G3 X82.181 Y138.03 I-.14 J1.39 E.21418
M204 S10000
G1 X81.783 Y137.983 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.791 Y137.949 E.00107
G3 X83.641 Y136.254 I1.787 J.093 E.08543
G1 X83.757 Y136.262 E.00358
G3 X81.81 Y138.321 I-.179 J1.78 E.24497
G1 X81.788 Y138.043 E.00856
; WIPE_START
G1 F9000
M204 S6000
G1 X81.791 Y137.949 E-.0357
G1 X81.84 Y137.579 E-.14202
G1 X81.943 Y137.295 E-.11497
G1 X82.121 Y136.99 E-.13392
G1 X82.371 Y136.712 E-.1422
G1 X82.672 Y136.493 E-.1413
G1 X82.79 Y136.437 E-.0499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.23 Y137.117 F36000
G1 Z7.6
M73 P89 R1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01024
G1 X82.7 Y137.542 E.01105
G1 X82.572 Y137.933 E.01262
G1 X82.602 Y138.309 E.0116
G1 X82.786 Y138.67 E.01244
G1 X83.071 Y138.913 E.01152
G1 X83.459 Y139.039 E.01253
G1 X83.83 Y139.01 E.01142
G1 X84.196 Y138.825 E.01262
G1 X84.439 Y138.54 E.01152
G1 X84.567 Y138.147 E.01268
G2 X84.347 Y137.412 I-1.133 J-.062 E.02404
G1 X83.975 Y137.131 E.01434
G1 X83.505 Y137.041 E.01469
M73 P89 R0
G1 X83.287 Y137.101 E.00694
M204 S10000
G1 X83.96 Y137.577 F36000
G1 F1200
M204 S6000
G1 X83.783 Y137.458 E.00657
G1 X83.437 Y137.434 E.01065
G1 X83.172 Y137.57 E.00916
G1 X82.975 Y137.851 E.01052
G1 X82.974 Y138.225 E.01149
G1 X83.073 Y138.418 E.00669
G1 X83.376 Y138.636 E.01149
G1 X83.746 Y138.639 E.01137
G1 X83.945 Y138.538 E.00683
G1 X84.163 Y138.235 E.01148
G1 X84.19 Y138.023 E.00657
G1 X84.124 Y137.791 E.0074
G1 X83.996 Y137.625 E.00644
M204 S10000
G1 X83.703 Y137.879 F36000
; LINE_WIDTH: 0.45923
G1 F1200
M204 S6000
G1 X83.541 Y137.826 E.00575
G1 X83.357 Y137.967 E.00786
G1 X83.379 Y138.158 E.00651
G1 X83.518 Y138.259 E.00583
G1 X83.686 Y138.23 E.0058
G1 X83.793 Y138.066 E.00665
G2 X83.735 Y137.93 I-.137 J-.022 E.00529
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8647.402
G1 X83.793 Y138.023 E-.06485
G1 X83.793 Y138.066 E-.02551
G1 X83.686 Y138.23 E-.11598
G1 X83.518 Y138.259 E-.10117
G1 X83.379 Y138.158 E-.10157
G1 X83.357 Y137.967 E-.11354
G1 X83.541 Y137.826 E-.1371
G1 X83.703 Y137.879 E-.10028
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/50
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z8 I-.076 J-1.215 P1  F36000
G1 X82.173 Y137.975 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.183 Y137.97 E.00037
G3 X83.63 Y136.647 I1.395 J.073 E.0721
G1 X83.718 Y136.653 E.00292
G3 X82.198 Y138.26 I-.14 J1.39 E.20653
G1 X82.178 Y138.035 E.00748
M204 S10000
G1 X81.784 Y137.996 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.82 Y137.671 E.01007
G3 X83.757 Y136.262 I1.751 J.372 E.0806
G3 X83.756 Y139.822 I-.191 J1.78 E.1611
G3 X81.781 Y138.056 I-.185 J-1.78 E.09164
; WIPE_START
G1 F9000
M204 S6000
G1 X81.82 Y137.671 E-.14727
G1 X81.942 Y137.296 E-.14961
G1 X82.121 Y136.99 E-.1346
G1 X82.371 Y136.712 E-.14217
G1 X82.672 Y136.493 E-.14139
G1 X82.78 Y136.445 E-.04497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.602 Y137.834 F36000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45922
G1 F1200
M204 S6000
G1 X83.422 Y137.888 E.00634
G1 X83.353 Y137.992 E.00427
G1 X83.378 Y138.158 E.00568
G1 X83.517 Y138.259 E.00582
G1 X83.686 Y138.23 E.00581
G1 X83.793 Y138.061 E.00678
G1 X83.753 Y137.922 E.00491
G1 X83.654 Y137.864 E.00391
M204 S10000
G1 X83.172 Y137.57 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.975 Y137.851 E.01052
G1 X82.974 Y138.224 E.01148
G1 X83.073 Y138.418 E.00669
G1 X83.376 Y138.636 E.01149
G1 X83.746 Y138.639 E.01137
G1 X83.945 Y138.539 E.00683
G1 X84.163 Y138.235 E.01149
G1 X84.19 Y138.061 E.00539
G1 X84.113 Y137.74 E.01014
G1 X83.861 Y137.493 E.01087
G1 X83.511 Y137.422 E.01096
G1 X83.227 Y137.546 E.00953
M204 S10000
G1 X83.23 Y137.117 F36000
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01023
G1 X82.7 Y137.542 E.01104
G1 X82.572 Y137.933 E.01262
G1 X82.602 Y138.309 E.0116
G1 X82.786 Y138.67 E.01245
G1 X83.072 Y138.913 E.01153
G1 X83.459 Y139.039 E.01253
G1 X83.83 Y139.01 E.01142
G1 X84.196 Y138.825 E.01262
G1 X84.44 Y138.539 E.01153
G1 X84.567 Y138.147 E.01268
G1 X84.567 Y138.061 E.00263
G1 X84.487 Y137.675 E.01213
G1 X84.351 Y137.415 E.009
G1 X83.975 Y137.131 E.01449
G1 X83.505 Y137.041 E.0147
G1 X83.287 Y137.101 E.00694
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.505 Y137.041 E-.08586
G1 X83.975 Y137.131 E-.18176
G1 X84.351 Y137.415 E-.17921
G1 X84.487 Y137.675 E-.11125
G1 X84.567 Y138.061 E-.15004
G1 X84.567 Y138.147 E-.03256
G1 X84.551 Y138.195 E-.01932
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/50
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z8.2 I.113 J-1.212 P1  F36000
G1 X82.173 Y137.973 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.183 Y137.97 E.00034
G3 X83.631 Y136.647 I1.395 J.073 E.07215
G1 X83.718 Y136.653 E.00286
G3 X82.198 Y138.26 I-.139 J1.39 E.20654
G1 X82.178 Y138.033 E.00756
M204 S10000
G1 X81.784 Y137.993 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.79 Y137.949 E.00137
G3 X83.644 Y136.255 I1.787 J.093 E.08558
G1 X83.757 Y136.262 E.00346
G3 X81.809 Y138.321 I-.18 J1.78 E.24496
M73 P90 R0
G1 X81.788 Y138.053 E.00826
; WIPE_START
G1 F9000
M204 S6000
G1 X81.79 Y137.949 E-.03947
G1 X81.84 Y137.579 E-.14202
G1 X81.941 Y137.298 E-.11345
G1 X82.121 Y136.99 E-.13535
G1 X82.371 Y136.712 E-.14216
G1 X82.594 Y136.541 E-.10684
G1 X82.783 Y136.445 E-.08071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.853 Y137.363 F36000
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.651 Y137.652 E.01082
G1 X82.571 Y137.937 E.00911
G1 X82.613 Y138.345 E.0126
G1 X82.786 Y138.667 E.01122
G1 X83.117 Y138.936 E.01311
G1 X83.466 Y139.039 E.01118
G1 X83.835 Y139.009 E.01138
G1 X84.196 Y138.825 E.01245
G1 X84.44 Y138.539 E.01153
G1 X84.566 Y138.152 E.01251
G2 X84.463 Y137.587 I-1.591 J-.003 E.01775
G1 X84.261 Y137.338 E.00985
G1 X83.975 Y137.131 E.01084
G1 X83.505 Y137.041 E.0147
G1 X83.113 Y137.148 E.01249
G1 X82.899 Y137.325 E.00853
M204 S10000
G1 X83.394 Y138.164 F36000
; LINE_WIDTH: 0.458836
G1 F1200
M204 S6000
G1 X83.547 Y138.256 E.00606
G1 X83.685 Y138.233 E.00473
G1 X83.785 Y138.095 E.00578
G1 X83.774 Y137.954 E.00478
G1 X83.659 Y137.842 E.00545
G1 X83.456 Y137.848 E.00687
G1 X83.344 Y138.019 E.00693
G1 X83.375 Y138.107 E.00316
M204 S10000
G1 X84.169 Y137.922 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00657
G1 X83.861 Y137.493 E.01013
G1 X83.511 Y137.422 E.01097
G1 X83.246 Y137.511 E.00858
G1 X83.022 Y137.746 E.00998
G1 X82.948 Y138.034 E.00914
G2 X83.506 Y138.657 I.651 J-.022 E.0279
G1 X83.852 Y138.599 E.0108
G1 X84.117 Y138.336 E.01147
G1 X84.185 Y138.128 E.00674
G1 X84.174 Y137.982 E.00448
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.185 Y138.128 E-.05541
G1 X84.117 Y138.336 E-.08331
G1 X83.852 Y138.599 E-.14186
G1 X83.506 Y138.657 E-.13351
G1 X83.296 Y138.596 E-.08293
G1 X83.083 Y138.422 E-.10478
G1 X83 Y138.269 E-.06573
G1 X82.948 Y138.034 E-.09151
G1 X82.948 Y138.032 E-.00095
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/50
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z8.4 I.084 J-1.214 P1  F36000
G1 X82.173 Y137.978 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X82.182 Y137.97 E.0004
G3 X83.633 Y136.647 I1.395 J.073 E.07223
G1 X83.717 Y136.653 E.0028
G3 X82.198 Y138.26 I-.14 J1.39 E.20653
G1 X82.179 Y138.038 E.00739
M204 S10000
G1 X81.784 Y137.998 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.79 Y137.949 E.00152
G3 X83.646 Y136.255 I1.787 J.093 E.08565
G1 X83.757 Y136.262 E.0034
G3 X81.809 Y138.321 I-.18 J1.78 E.24495
G1 X81.789 Y138.058 E.0081
; WIPE_START
G1 F9000
M204 S6000
G1 X81.79 Y137.949 E-.04143
G1 X81.84 Y137.579 E-.14207
G1 X81.934 Y137.314 E-.10667
G1 X82.121 Y136.99 E-.14209
G1 X82.371 Y136.712 E-.14229
G1 X82.672 Y136.493 E-.14128
G1 X82.777 Y136.443 E-.04419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.229 Y137.117 F36000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.933 Y137.269 E.01023
G1 X82.697 Y137.547 E.01122
G1 X82.572 Y137.932 E.01244
G1 X82.602 Y138.301 E.01136
G1 X82.795 Y138.678 E.01303
G1 X83.072 Y138.913 E.01115
G1 X83.464 Y139.04 E.01266
G1 X83.872 Y138.998 E.0126
G1 X84.199 Y138.821 E.01144
G1 X84.441 Y138.537 E.01145
G1 X84.566 Y138.152 E.01244
G2 X84.464 Y137.589 I-1.589 J-.003 E.01768
G1 X84.26 Y137.337 E.00994
G1 X83.975 Y137.131 E.01081
G1 X83.505 Y137.041 E.0147
G1 X83.287 Y137.101 E.00694
M204 S10000
G1 X83.487 Y137.854 F36000
; LINE_WIDTH: 0.4584
G1 F1200
M204 S6000
G1 X83.352 Y137.983 E.00632
G1 X83.413 Y138.188 E.00727
G1 X83.561 Y138.267 E.00565
M73 P91 R0
G2 X83.785 Y138.096 I-.021 J-.261 E.0101
G1 X83.774 Y137.953 E.00485
G1 X83.659 Y137.841 E.00542
G1 X83.547 Y137.85 E.0038
M204 S10000
G1 X84.169 Y137.921 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.1 Y137.72 E.00652
G1 X83.861 Y137.493 E.01015
G1 X83.511 Y137.422 E.01096
G1 X83.172 Y137.57 E.01136
G1 X82.975 Y137.85 E.0105
G1 X82.971 Y138.195 E.01062
G1 X83.097 Y138.439 E.00843
G1 X83.376 Y138.636 E.01051
G1 X83.679 Y138.654 E.00931
G1 X83.958 Y138.523 E.00947
G1 X84.163 Y138.235 E.01085
G1 X84.168 Y137.981 E.00781
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.163 Y138.235 E-.09659
G1 X83.958 Y138.523 E-.13414
G1 X83.679 Y138.654 E-.11716
G1 X83.376 Y138.636 E-.11514
G1 X83.097 Y138.439 E-.12992
G1 X82.971 Y138.195 E-.10421
G1 X82.973 Y138.03 E-.06284
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/50
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z8.6 I-.019 J-1.217 P1  F36000
G1 X82.164 Y138.042 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J-.001 E.07308
G1 X83.626 Y136.646 E.00191
G3 X82.165 Y138.102 I-.066 J1.395 E.21415
M204 S10000
G1 X81.781 Y138.01 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.793 Y137.761 E.00767
G3 X83.569 Y136.252 I1.767 J.28 E.07797
G1 X83.645 Y136.254 E.00236
G3 X81.771 Y138.068 I-.086 J1.787 E.25553
; WIPE_START
G1 F9000
M204 S6000
G1 X81.793 Y137.761 E-.11712
G1 X81.897 Y137.402 E-.1422
G1 X82.068 Y137.067 E-.14249
G1 X82.303 Y136.777 E-.14225
G1 X82.515 Y136.596 E-.10577
G1 X82.766 Y136.451 E-.11017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.371 Y138.113 F36000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46148
G1 F1200
M204 S6000
G1 X83.502 Y138.256 E.00661
G1 X83.662 Y138.243 E.00547
G1 X83.793 Y138.054 E.00784
G1 X83.695 Y137.858 E.00747
G1 X83.52 Y137.826 E.00608
G1 X83.383 Y137.921 E.00571
G1 X83.375 Y138.053 E.00452
M204 S10000
G1 X84.07 Y138.405 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.192 Y138.075 E.01082
G1 X84.19 Y138.029 E.00141
G1 X84.096 Y137.712 E.01014
G1 X83.897 Y137.515 E.00861
G1 X83.57 Y137.42 E.01048
G1 X83.365 Y137.454 E.00638
G1 X83.064 Y137.675 E.01149
G1 X82.946 Y138.033 E.01156
G1 X83.041 Y138.373 E.01083
G1 X83.306 Y138.607 E.01086
G1 X83.593 Y138.663 E.00899
G1 X83.834 Y138.604 E.00759
G1 X84.024 Y138.443 E.00766
M204 S10000
G1 X84.217 Y138.785 F36000
G1 F1200
M204 S6000
G1 X84.38 Y138.629 E.00694
G1 X84.539 Y138.295 E.01139
G1 X84.566 Y138.009 E.00882
G1 X84.473 Y137.645 E.01155
G1 X84.314 Y137.371 E.00973
G1 X83.984 Y137.13 E.01257
G1 X83.492 Y137.046 E.01534
G1 X83.214 Y137.104 E.00871
G1 X82.892 Y137.302 E.01161
G1 X82.657 Y137.625 E.01226
G1 X82.572 Y138.096 E.01473
G1 X82.704 Y138.55 E.01452
G1 X82.896 Y138.768 E.00892
G1 X83.23 Y138.981 E.01216
G1 X83.517 Y139.044 E.00903
G1 X83.928 Y138.979 E.01281
G1 X84.167 Y138.819 E.00884
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.299
G1 X83.928 Y138.979 E-.10929
G1 X83.517 Y139.044 E-.15845
G1 X83.23 Y138.981 E-.11167
G1 X82.896 Y138.768 E-.15042
G1 X82.704 Y138.55 E-.11028
G1 X82.616 Y138.247 E-.11988
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/50
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z8.8 I.503 J-1.108 P1  F36000
G1 X82.165 Y138.042 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07305
G1 X83.628 Y136.646 E.00197
G3 X82.166 Y138.102 I-.066 J1.396 E.21426
M204 S10000
G1 X81.781 Y138.015 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.794 Y137.761 E.00782
G3 X83.569 Y136.252 I1.767 J.281 E.07795
G1 X83.647 Y136.254 E.00242
G3 X81.772 Y138.073 I-.086 J1.787 E.2555
; WIPE_START
G1 F9000
M204 S6000
G1 X81.794 Y137.761 E-.11894
G1 X81.897 Y137.402 E-.14218
G1 X82.068 Y137.067 E-.14251
G1 X82.303 Y136.777 E-.14215
G1 X82.594 Y136.541 E-.14226
G1 X82.763 Y136.455 E-.07197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.312 Y137.394 F36000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.069 Y137.179 E.00998
G1 X83.605 Y137.04 E.01489
G1 X83.215 Y137.104 E.01211
G1 X82.892 Y137.302 E.01165
G1 X82.66 Y137.619 E.01209
G1 X82.567 Y137.998 E.01197
G1 X82.631 Y138.397 E.01242
G1 X82.91 Y138.793 E.01489
G1 X83.162 Y138.959 E.00927
G2 X83.846 Y139.001 I.419 J-1.236 E.02131
G1 X84.111 Y138.886 E.00887
G1 X84.38 Y138.63 E.01143
G1 X84.539 Y138.295 E.01138
G2 X84.506 Y137.683 I-1.089 J-.248 E.0191
G1 X84.345 Y137.444 E.00882
M204 S10000
G1 X83.722 Y137.899 F36000
; LINE_WIDTH: 0.46146
G1 F1200
M204 S6000
G1 X83.543 Y137.822 E.00664
G1 X83.384 Y137.919 E.00637
G1 X83.352 Y138.092 E.00598
G1 X83.487 Y138.25 E.0071
G1 X83.662 Y138.243 E.00597
G1 X83.793 Y138.054 E.00785
G2 X83.751 Y137.951 I-.125 J-.009 E.00391
M204 S10000
G1 X84.069 Y138.405 F36000
; LINE_WIDTH: 0.41999
M73 P92 R0
G1 F1200
M204 S6000
G1 X84.192 Y138.075 E.01082
G1 X84.188 Y138.002 E.00224
G1 X84.102 Y137.72 E.00905
G1 X83.843 Y137.484 E.01076
G1 X83.472 Y137.425 E.01154
G1 X83.136 Y137.595 E.01158
G1 X83.013 Y137.762 E.00638
G1 X82.952 Y138.14 E.01177
G1 X83.122 Y138.476 E.01157
G1 X83.361 Y138.628 E.00869
G1 X83.688 Y138.653 E.01008
G2 X84.026 Y138.446 I-.08 J-.51 E.01251
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X83.89 Y138.575 E-.07114
G1 X83.688 Y138.653 E-.08256
G1 X83.361 Y138.628 E-.12465
G1 X83.122 Y138.476 E-.10743
G1 X82.952 Y138.14 E-.14306
G1 X83.013 Y137.762 E-.14553
G1 X83.136 Y137.595 E-.07888
G1 X83.152 Y137.587 E-.00674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/50
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z9 I-.51 J-1.105 P1  F36000
G1 X82.165 Y138.042 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07303
G1 X83.63 Y136.646 E.00203
G3 X82.166 Y138.102 I-.068 J1.396 E.21421
M204 S10000
G1 X81.781 Y138.02 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.812 Y137.669 E.01083
G3 X83.569 Y136.252 I1.75 J.373 E.07504
G1 X83.649 Y136.255 E.00248
G3 X81.773 Y138.078 I-.088 J1.787 E.25532
; WIPE_START
G1 F9000
M204 S6000
G1 X81.812 Y137.669 E-.15622
G1 X81.934 Y137.314 E-.14267
G1 X82.068 Y137.067 E-.10656
G1 X82.303 Y136.777 E-.1422
G1 X82.594 Y136.541 E-.14239
G1 X82.756 Y136.453 E-.06996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.82 Y138.684 F36000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.982 Y138.854 E.00719
G1 X83.316 Y139.013 E.01138
G1 X83.726 Y139.033 E.01261
G2 X84.311 Y138.71 I-.326 J-1.279 E.02076
G1 X84.539 Y138.295 E.01456
G2 X84.507 Y137.688 I-1.081 J-.247 E.01893
G1 X84.309 Y137.366 E.0116
G1 X83.984 Y137.129 E.01236
G1 X83.606 Y137.04 E.01192
G1 X83.214 Y137.104 E.01221
G1 X82.893 Y137.302 E.01159
G1 X82.655 Y137.629 E.0124
G1 X82.567 Y137.997 E.01166
G1 X82.632 Y138.402 E.01259
G1 X82.787 Y138.634 E.00858
M204 S10000
G1 X83.732 Y138.189 F36000
; LINE_WIDTH: 0.46169
G1 F1200
M204 S6000
G1 X83.79 Y138.012 E.00637
G1 X83.689 Y137.856 E.00633
G1 X83.52 Y137.826 E.00588
G1 X83.381 Y137.924 E.00578
G1 X83.364 Y138.132 E.00711
G1 X83.557 Y138.266 E.00804
G1 X83.677 Y138.213 E.00447
M204 S10000
G1 X84.113 Y137.768 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.936 Y137.537 E.00894
G1 X83.573 Y137.42 E.01173
G1 X83.365 Y137.454 E.00647
G1 X83.064 Y137.676 E.01148
G1 X82.946 Y138.032 E.01153
G1 X83.007 Y138.307 E.00865
G1 X83.206 Y138.543 E.00949
G1 X83.536 Y138.666 E.01082
G1 X83.773 Y138.631 E.00734
G1 X84.06 Y138.425 E.01086
G1 X84.192 Y138.075 E.01149
G2 X84.132 Y137.825 I-.483 J-.017 E.008
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.188 Y137.991 E-.06654
G1 X84.192 Y138.075 E-.03201
G1 X84.06 Y138.425 E-.14215
G1 X83.773 Y138.631 E-.13429
G1 X83.536 Y138.666 E-.09083
G1 X83.206 Y138.543 E-.13379
G1 X83.007 Y138.307 E-.11739
G1 X82.983 Y138.197 E-.04301
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/50
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z9.2 I.226 J-1.196 P1  F36000
G1 X82.166 Y138.042 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07299
G1 X83.632 Y136.646 E.0021
G3 X82.168 Y138.102 I-.068 J1.396 E.21418
M204 S10000
G1 X81.78 Y138.024 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.796 Y137.761 E.0081
G3 X83.569 Y136.252 I1.767 J.281 E.0779
G1 X83.652 Y136.255 E.00254
G3 X81.774 Y138.083 I-.088 J1.787 E.25514
; WIPE_START
G1 F9000
M204 S6000
G1 X81.796 Y137.761 E-.1225
G1 X81.898 Y137.401 E-.14217
G1 X82.068 Y137.068 E-.1424
G1 X82.303 Y136.777 E-.14222
G1 X82.594 Y136.541 E-.14239
G1 X82.752 Y136.455 E-.06832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.779 Y138.047 F36000
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46172
G1 F1200
M204 S6000
G1 X83.719 Y137.877 E.00615
G1 X83.51 Y137.827 E.00731
G1 X83.381 Y137.932 E.00568
G1 X83.353 Y138.092 E.00554
G1 X83.479 Y138.232 E.00644
G1 X83.619 Y138.26 E.00487
G1 X83.777 Y138.107 E.00751
M204 S10000
G1 X84.176 Y138.056 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.124 Y137.789 E.00836
G1 X83.999 Y137.594 E.00712
G1 X83.843 Y137.484 E.00588
G1 X83.472 Y137.425 E.01153
G1 X83.248 Y137.509 E.00735
G1 X83.012 Y137.764 E.01069
G1 X82.952 Y138.14 E.01168
G1 X83.121 Y138.475 E.01152
G1 X83.429 Y138.649 E.01086
M73 P93 R0
G1 X83.722 Y138.644 E.00901
G1 X83.937 Y138.531 E.00748
G1 X84.139 Y138.296 E.0095
G1 X84.167 Y138.116 E.00561
M204 S10000
G1 X84.553 Y138.065 F36000
G1 F1200
M204 S6000
G1 X84.558 Y137.884 E.00558
G1 X84.434 Y137.535 E.01138
G1 X84.159 Y137.231 E.0126
G1 X83.849 Y137.097 E.01037
G1 X83.494 Y137.047 E.01101
G1 X83.209 Y137.105 E.00893
G2 X82.706 Y137.54 I.593 J1.195 E.02065
G1 X82.567 Y137.998 E.01469
G1 X82.631 Y138.397 E.01242
G1 X82.901 Y138.784 E.01451
G1 X83.316 Y139.013 E.01455
G1 X83.726 Y139.034 E.0126
G1 X84.111 Y138.886 E.01268
G1 X84.384 Y138.626 E.01159
G1 X84.549 Y138.255 E.01245
G1 X84.552 Y138.125 E.004
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.549 Y138.255 E-.04943
G1 X84.384 Y138.626 E-.15402
G1 X84.111 Y138.886 E-.14339
G1 X83.726 Y139.034 E-.15678
G1 X83.316 Y139.013 E-.15586
G1 X83.084 Y138.885 E-.10053
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/50
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z9.4 I.823 J-.896 P1  F36000
G1 X82.167 Y138.042 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07297
G1 X83.634 Y136.646 E.00216
G3 X82.168 Y138.102 I-.069 J1.396 E.21415
M204 S10000
G1 X81.78 Y138.029 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.815 Y137.66 E.01139
G3 X83.569 Y136.252 I1.748 J.382 E.07471
G1 X83.654 Y136.255 E.0026
G3 X81.775 Y138.088 I-.09 J1.787 E.25496
; WIPE_START
G1 F9000
M204 S6000
G1 X81.815 Y137.66 E-.16322
G1 X81.934 Y137.314 E-.13895
G1 X82.068 Y137.067 E-.10676
G1 X82.303 Y136.777 E-.14214
G1 X82.594 Y136.541 E-.14237
G1 X82.748 Y136.457 E-.06656
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.928 Y137.292 F36000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.693 Y137.563 E.01102
G1 X82.59 Y137.822 E.00855
G1 X82.58 Y138.207 E.01182
G1 X82.725 Y138.585 E.01244
G1 X83.07 Y138.907 E.01452
G1 X83.524 Y139.044 E.01456
G1 X83.928 Y138.979 E.01258
G1 X84.211 Y138.791 E.01044
G1 X84.443 Y138.524 E.01086
G1 X84.549 Y138.256 E.00888
G2 X84.507 Y137.688 I-1.486 J-.176 E.01761
G1 X84.309 Y137.366 E.0116
G1 X83.983 Y137.129 E.01237
G1 X83.609 Y137.04 E.01182
G1 X83.209 Y137.106 E.01246
G1 X82.978 Y137.259 E.00852
M204 S10000
G1 X83.521 Y138.247 F36000
; LINE_WIDTH: 0.46178
G1 F1200
M204 S6000
G1 X83.663 Y138.243 E.00486
G1 X83.777 Y138.118 E.00576
G1 X83.78 Y137.985 E.00453
G1 X83.689 Y137.856 E.00541
G1 X83.48 Y137.837 E.00715
G1 X83.362 Y137.963 E.00588
G1 X83.368 Y138.136 E.00591
G1 X83.472 Y138.211 E.00439
M204 S10000
G1 X84.134 Y137.801 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.936 Y137.537 E.01012
G1 X83.575 Y137.42 E.01165
G1 X83.304 Y137.48 E.00853
G1 X83.053 Y137.695 E.01016
G1 X82.966 Y137.887 E.0065
G1 X82.986 Y138.266 E.01166
G1 X83.221 Y138.558 E.01152
G1 X83.558 Y138.665 E.01087
G1 X83.834 Y138.604 E.00866
G1 X84.085 Y138.39 E.01015
G2 X84.149 Y137.859 I-.589 J-.341 E.01691
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.179 Y137.967 E-.04267
G1 X84.173 Y138.191 E-.08533
G1 X84.085 Y138.39 E-.08264
G1 X83.834 Y138.604 E-.12548
G1 X83.558 Y138.665 E-.10705
G1 X83.221 Y138.558 E-.13444
G1 X82.986 Y138.266 E-.14251
G1 X82.98 Y138.161 E-.03989
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/50
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z9.6 I.176 J-1.204 P1  F36000
G1 X82.168 Y138.042 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07293
G1 X83.635 Y136.646 E.00221
G3 X82.169 Y138.102 I-.07 J1.396 E.21413
M204 S10000
G1 X81.78 Y138.034 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.798 Y137.762 E.00838
G3 X83.569 Y136.252 I1.767 J.28 E.07784
G1 X83.655 Y136.255 E.00266
G3 X81.776 Y138.093 I-.09 J1.787 E.2548
; WIPE_START
G1 F9000
M204 S6000
G1 X81.798 Y137.762 E-.126
G1 X81.898 Y137.401 E-.14213
G1 X82.068 Y137.068 E-.1423
G1 X82.303 Y136.777 E-.14213
G1 X82.517 Y136.594 E-.10688
G1 X82.746 Y136.462 E-.10055
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.52 Y138.246 F36000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46188
G1 F1200
M204 S6000
G1 X83.618 Y138.258 E.00337
G1 X83.759 Y138.132 E.00645
G1 X83.791 Y138.023 E.00388
G1 X83.721 Y137.898 E.00487
G1 X83.54 Y137.82 E.00673
G1 X83.38 Y137.932 E.00667
G1 X83.364 Y138.132 E.00683
G1 X83.472 Y138.211 E.00457
M204 S10000
G1 X84.188 Y138.002 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.102 Y137.72 E.00905
G1 X83.842 Y137.483 E.01079
G1 X83.472 Y137.425 E.01153
G1 X83.247 Y137.51 E.00738
G1 X83.011 Y137.767 E.01073
M73 P94 R0
G1 X82.952 Y138.14 E.01161
G1 X83.036 Y138.364 E.00735
G1 X83.297 Y138.602 E.01085
G1 X83.666 Y138.659 E.0115
G1 X84.001 Y138.49 E.01152
G1 X84.175 Y138.182 E.01086
G1 X84.184 Y138.062 E.00371
M204 S10000
G1 X84.312 Y137.394 F36000
G1 F1200
M204 S6000
G1 X84.068 Y137.178 E.01
G1 X83.611 Y137.04 E.01469
G1 X83.209 Y137.105 E.0125
G2 X82.705 Y137.541 I.588 J1.189 E.02069
G1 X82.567 Y137.998 E.01465
G1 X82.632 Y138.402 E.01258
G2 X83.07 Y138.907 I1.184 J-.585 E.02076
G1 X83.524 Y139.044 E.01457
G1 X83.923 Y138.981 E.01243
G1 X84.311 Y138.71 E.01452
G1 X84.539 Y138.295 E.01455
G2 X84.506 Y137.683 I-1.089 J-.247 E.01909
G1 X84.345 Y137.444 E.00883
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9547.299
G1 X84.506 Y137.683 E-.10917
G1 X84.565 Y137.982 E-.11603
G1 X84.539 Y138.295 E-.11926
G1 X84.311 Y138.71 E-.17998
G1 X83.923 Y138.981 E-.17954
G1 X83.778 Y139.004 E-.05603
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/50
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z9.8 I.624 J-1.045 P1  F36000
G1 X82.169 Y138.042 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.0729
G1 X83.638 Y136.646 E.00228
G3 X82.17 Y138.102 I-.071 J1.396 E.2141
M204 S10000
G1 X81.779 Y138.038 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.798 Y137.762 E.0085
G3 X83.569 Y136.252 I1.768 J.28 E.07782
G1 X83.658 Y136.255 E.00273
G3 X81.777 Y138.097 I-.092 J1.787 E.25463
; WIPE_START
G1 F9000
M204 S6000
G1 X81.798 Y137.762 E-.12759
G1 X81.898 Y137.401 E-.14214
G1 X82.068 Y137.067 E-.14232
G1 X82.303 Y136.777 E-.14213
G1 X82.517 Y136.594 E-.10675
G1 X82.742 Y136.464 E-.09906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X82.927 Y137.293 F36000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X82.705 Y137.542 E.01024
G1 X82.567 Y137.998 E.01462
G1 X82.611 Y138.287 E.00901
G1 X82.761 Y138.629 E.01147
G1 X83.12 Y138.939 E.01457
G1 X83.517 Y139.044 E.01261
G1 X83.92 Y138.982 E.01254
G1 X84.311 Y138.709 E.01464
G1 X84.539 Y138.295 E.01454
G2 X84.507 Y137.688 I-1.08 J-.247 E.01891
G1 X84.309 Y137.366 E.01162
G1 X83.983 Y137.129 E.01237
G1 X83.612 Y137.04 E.01172
G1 X83.209 Y137.105 E.01256
G1 X82.977 Y137.26 E.00857
M204 S10000
G1 X83.365 Y137.995 F36000
; LINE_WIDTH: 0.46182
G1 F1200
M204 S6000
G1 X83.392 Y138.171 E.00609
G1 X83.557 Y138.266 E.00652
G1 X83.732 Y138.188 E.00653
G1 X83.79 Y138.011 E.00635
G1 X83.688 Y137.855 E.00637
G1 X83.479 Y137.838 E.00715
G1 X83.4 Y137.946 E.00458
M204 S10000
G1 X84.114 Y137.768 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.936 Y137.537 E.00895
G1 X83.578 Y137.42 E.01157
G1 X83.304 Y137.48 E.00862
G1 X83.052 Y137.695 E.01016
G1 X82.946 Y138.032 E.01087
G1 X83.041 Y138.372 E.01084
G1 X83.306 Y138.607 E.01087
G1 X83.593 Y138.663 E.00899
G1 X83.823 Y138.599 E.00731
G1 X84.06 Y138.425 E.00906
G1 X84.192 Y138.075 E.01149
G2 X84.133 Y137.825 I-.482 J-.017 E.00799
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.188 Y137.991 E-.06632
G1 X84.192 Y138.075 E-.03205
G1 X84.06 Y138.425 E-.14212
G1 X83.823 Y138.599 E-.112
G1 X83.593 Y138.663 E-.09046
G1 X83.306 Y138.607 E-.11123
G1 X83.041 Y138.372 E-.13441
G1 X82.991 Y138.191 E-.07141
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/50
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z10 I.217 J-1.197 P1  F36000
G1 X82.17 Y138.042 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G3 X83.569 Y136.645 I1.397 J0 E.07288
G1 X83.639 Y136.646 E.00234
G3 X82.171 Y138.102 I-.072 J1.396 E.21406
M204 S10000
G1 X81.777 Y138.042 F36000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X83.569 Y136.252 I1.79 J0 E.08644
G1 X83.659 Y136.255 E.00279
G3 X81.778 Y138.102 I-.092 J1.787 E.25444
; WIPE_START
G1 F9000
M204 S6000
G1 X81.801 Y137.762 E-.1294
G1 X81.898 Y137.401 E-.14218
G1 X82.068 Y137.068 E-.14219
G1 X82.303 Y136.777 E-.1422
G1 X82.594 Y136.541 E-.1422
G1 X82.737 Y136.464 E-.06182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.205 Y138.542 F36000
G1 Z9.8
M73 P95 R0
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X83.536 Y138.666 E.01086
G1 X83.771 Y138.631 E.00729
G1 X84.06 Y138.425 E.01092
G1 X84.192 Y138.075 E.01149
G1 X84.188 Y138.002 E.00225
G1 X84.102 Y137.721 E.00905
G1 X83.842 Y137.483 E.0108
G1 X83.471 Y137.426 E.01153
G1 X83.247 Y137.509 E.00736
G1 X83.009 Y137.769 E.01082
G1 X82.952 Y138.14 E.01153
G1 X83.036 Y138.364 E.00736
G1 X83.164 Y138.499 E.0057
M204 S10000
G1 X83.721 Y137.898 F36000
; LINE_WIDTH: 0.46197
G1 F1200
M204 S6000
G1 X83.542 Y137.82 E.00665
G1 X83.379 Y137.933 E.00676
G1 X83.364 Y138.132 E.00681
G1 X83.557 Y138.266 E.00803
G1 X83.732 Y138.188 E.00652
G1 X83.791 Y138.023 E.00601
G1 X83.75 Y137.95 E.00283
M204 S10000
G1 X84.312 Y137.395 F36000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X84.068 Y137.178 E.01002
G1 X83.614 Y137.04 E.01459
G1 X83.209 Y137.105 E.01259
G2 X82.705 Y137.543 I.586 J1.186 E.02074
G1 X82.567 Y137.998 E.0146
G1 X82.632 Y138.402 E.01258
G2 X82.98 Y138.853 I1.461 J-.769 E.01759
G1 X83.316 Y139.013 E.01145
G1 X83.726 Y139.033 E.01259
G2 X84.311 Y138.71 I-.329 J-1.285 E.02077
G1 X84.539 Y138.295 E.01454
G2 X84.506 Y137.683 I-1.089 J-.247 E.01908
G1 X84.345 Y137.444 E.00883
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X84.506 Y137.683 E-.10919
G1 X84.565 Y137.982 E-.11597
G1 X84.539 Y138.295 E-.11928
G1 X84.311 Y138.71 E-.17986
G1 X84.039 Y138.909 E-.12818
G1 X83.776 Y139.014 E-.10753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/50
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change

; OBJECT_ID: 136
M204 S10000
G17
G3 Z10.2 I.531 J-1.095 P1  F36000
G1 X81.779 Y138.046 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X81.778 Y138.042 E.00012
G3 X83.569 Y136.252 I1.79 J0 E.08641
G1 X83.661 Y136.255 E.00284
G3 X81.8 Y138.322 I-.093 J1.787 E.24761
G1 X81.784 Y138.106 E.00667
; WIPE_START
G1 F9000
M204 S6000
G1 X81.778 Y138.042 E-.02422
G1 X81.818 Y137.67 E-.14215
G1 X81.934 Y137.314 E-.14229
G1 X82.068 Y137.067 E-.10667
G1 X82.303 Y136.777 E-.14218
G1 X82.517 Y136.594 E-.10677
G1 X82.735 Y136.468 E-.09573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F36000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.11 Y138.368 F36000
G1 Z10
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X83.894 Y139.583 E.05282
G1 X83.345 Y139.599
G1 X85.132 Y137.813 E.07764
G1 X85.006 Y137.405
G1 X82.925 Y139.486 E.09047
G1 X82.595 Y139.282
G1 X84.807 Y137.071 E.0961
G1 X84.542 Y136.802
G1 X82.328 Y139.016 E.0962
G1 X82.129 Y138.682
G1 X84.213 Y136.598 E.09054
G1 X83.796 Y136.482
G1 X82.006 Y138.272 E.0778
G1 X82.028 Y137.717
G1 X83.243 Y136.501 E.05281
; WIPE_START
G1 F9547.055
M204 S6000
G1 X82.028 Y137.717 E-.6531
G1 X82.017 Y137.998 E-.10691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.921 Y138.851 Z10.4 F36000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11463
G1 F1200
M204 S6000
G3 X84.377 Y139.397 I-2.742 J-2.192 E.00451
; WIPE_START
G1 F13200
G1 X84.609 Y139.198 E-.3006
G1 X84.921 Y138.851 E-.4594
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.986 Y137.358 Z10.4 F36000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.105575
G1 F1200
M204 S6000
G1 X84.926 Y137.271 E.00054
G1 X84.936 Y137.217 E.00028
; WIPE_START
G1 F13200
G1 X84.926 Y137.271 E-.26123
G1 X84.986 Y137.358 E-.49877
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.76 Y136.688 Z10.4 F36000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.114749
G1 F1200
M204 S6000
G2 X82.226 Y137.224 I2.07 J2.597 E.00443
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F13200
G1 X82.528 Y136.886 E-.45418
G1 X82.76 Y136.688 E-.30582
; WIPE_END
G1 E-.04 F1800
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
M73 P96 R0
G1 E-0.8 F1800 ; retract
G1 Z10.5 F900 ; lower z a little
G1 X0 Y138.042 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z110 F600
    G1 Z108

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

