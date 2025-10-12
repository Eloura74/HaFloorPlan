; HEADER_BLOCK_START
; BambuStudio 02.02.02.56
; model printing time: 7m 23s; total estimated time: 13m 27s
; total layer number: 40
; total filament length [mm] : 683.09
; total filament volume [cm^3] : 1643.03
; total filament weight [g] : 2.04
; filament_density: 1.24,1.24,1.24,1.24
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 8.00
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
; brim_width = 5
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
; different_settings_to_system = brim_type;sparse_infill_density;sparse_infill_pattern;;;;;change_filament_gcode;machine_max_speed_x;machine_max_speed_y
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
; gap_infill_speed = 250
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
; inner_wall_speed = 300
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
; internal_solid_infill_speed = 250
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
; outer_wall_speed = 200
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
; sparse_infill_speed = 270
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
; travel_speed = 700
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
M73 P0 R13
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
M73 P3 R12
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
    M104 S240
    G92 E0
    G1 E50 F299.339
    M400
    M106 P1 S178
    G92 E0
M73 P5 R12
    G1 E5 F299.339
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
M73 P6 R12
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
M73 P7 R12
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
M73 P39 R8
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
M73 P40 R8
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
    G29 A1 X40.1502 Y82.8293 I100.02 J14.3414
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
    G0 X88 E10  F720
    G0 X93 E.3742  F1200
    G0 X98 E.3742  F4800
    G0 X103 E.3742  F1200
    G0 X108 E.3742  F4800
    G0 X113 E.3742  F1200
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F300
    M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
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
        M983 F5 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
M73 P40 R7
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P41 R7
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F5 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
M73 P42 R7
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
G0 X88 E10  F720
G0 X93 E.3742  F1200
G0 X98 E.3742  F4800
G0 X103 E.3742  F1200
G0 X108 E.3742  F4800
G0 X113 E.3742  F1200
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
; layer num/total_layer_count: 1/40
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
; OBJECT_ID: 91
G1 X43.491 Y84.958 F42000
M204 S6000
G1 Z.4
G1 Z.2
M73 P43 R7
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X43.677 Y84.869 E.00768
G1 X44.406 Y84.598 E.02894
G1 X44.603 Y84.544 E.00763
G1 X45.374 Y84.403 E.0292
M73 P44 R7
G1 X45.579 Y84.384 E.00768
G1 X46.342 Y84.379 E.02842
G1 X46.708 Y84.414 E.01368
G1 X62.022 Y83.075 E.57256
G1 X62.41 Y83.058 E.01448
G1 X135.491 Y83.058 E2.72199
G1 X136.14 Y83.106 E.02422
G1 X136.763 Y83.246 E.02377
G1 X137.606 Y83.603 E.0341
G1 X138.224 Y84 E.02737
G1 X138.703 Y84.426 E.02386
G1 X139.114 Y84.919 E.0239
G1 X139.447 Y85.464 E.0238
G1 X139.758 Y86.25 E.03148
G1 X139.904 Y86.93 E.02589
G1 X139.942 Y87.508 E.02157
G1 X139.942 Y92.491 E.18563
G1 X139.894 Y93.14 E.02422
M73 P45 R7
G1 X139.754 Y93.763 E.02377
G1 X139.397 Y94.606 E.0341
G1 X139 Y95.224 E.02737
G1 X138.574 Y95.703 E.02386
G1 X138.081 Y96.114 E.0239
G1 X137.536 Y96.447 E.0238
G1 X136.75 Y96.758 E.03148
G1 X136.07 Y96.904 E.02589
G1 X135.492 Y96.942 E.02157
G1 X61.921 Y96.942 E2.74025
G1 X61.532 Y96.925 E.0145
G1 X46.515 Y95.611 E.56147
G1 X45.653 Y95.621 E.03209
G1 X45.449 Y95.605 E.00763
G1 X44.678 Y95.475 E.02915
G1 X44.479 Y95.423 E.00764
G1 X43.747 Y95.162 E.02894
G1 X43.56 Y95.076 E.00768
G1 X42.882 Y94.69 E.02903
G1 X42.713 Y94.573 E.00765
G1 X42.118 Y94.08 E.02879
G1 X41.972 Y93.936 E.00763
G1 X41.472 Y93.348 E.02876
G1 X41.352 Y93.181 E.00765
G1 X40.958 Y92.509 E.02903
G1 X40.869 Y92.323 E.00768
G1 X40.598 Y91.594 E.02894
G1 X40.544 Y91.397 E.00763
G1 X40.403 Y90.626 E.0292
G1 X40.384 Y90.421 E.00768
G1 X40.379 Y89.654 E.02854
G1 X40.395 Y89.449 E.00766
G1 X40.525 Y88.678 E.02915
G1 X40.577 Y88.479 E.00764
G1 X40.838 Y87.747 E.02894
G1 X40.924 Y87.56 E.00768
G1 X41.31 Y86.882 E.02903
G1 X41.427 Y86.713 E.00765
G1 X41.92 Y86.118 E.02879
G1 X42.064 Y85.972 E.00763
G1 X42.652 Y85.472 E.02876
G1 X42.819 Y85.352 E.00765
G1 X43.439 Y84.988 E.0268
M204 S6000
G1 X43.677 Y85.379 F42000
G1 F3000
M204 S500
G1 X43.698 Y85.366 E.00093
G1 X44.539 Y85.037 E.03362
G1 X45.429 Y84.858 E.0338
G1 X45.596 Y84.841 E.00628
G1 X46.315 Y84.836 E.02676
G1 X46.759 Y84.869 E.01659
G1 X62.049 Y83.532 E.57166
G1 X62.423 Y83.515 E.01397
G1 X135.48 Y83.515 E2.72106
G1 X136.062 Y83.558 E.02177
G1 X136.61 Y83.681 E.0209
G1 X137.381 Y84.005 E.03115
G1 X137.938 Y84.36 E.02461
G1 X138.366 Y84.738 E.02128
G1 X138.747 Y85.194 E.02213
G1 X139.041 Y85.68 E.02114
G1 X139.321 Y86.394 E.02859
G1 X139.448 Y86.983 E.02245
G1 X139.485 Y87.518 E.01997
G1 X139.485 Y92.469 E.18441
G1 X139.442 Y93.062 E.02214
G1 X139.312 Y93.633 E.02181
G1 X138.985 Y94.401 E.0311
G1 X138.64 Y94.938 E.02375
G1 X138.247 Y95.38 E.02203
G1 X137.806 Y95.747 E.02137
G1 X137.32 Y96.041 E.02114
G1 X136.628 Y96.315 E.02775
G1 X135.997 Y96.451 E.02403
G1 X135.473 Y96.485 E.01957
G1 X61.934 Y96.485 E2.73903
G1 X61.565 Y96.469 E.01376
G1 X46.561 Y95.156 E.561
G1 X45.522 Y95.152 E.03869
G1 X44.606 Y94.983 E.03468
G1 X43.783 Y94.675 E.03274
G1 X43.113 Y94.294 E.0287
G1 X42.414 Y93.729 E.03346
G1 X41.838 Y93.073 E.03253
G1 X41.366 Y92.302 E.03368
G1 X41.037 Y91.461 E.03362
G1 X40.858 Y90.571 E.0338
G1 X40.841 Y90.404 E.00628
G1 X40.848 Y89.521 E.03287
G1 X41.011 Y88.629 E.03377
G1 X41.325 Y87.783 E.03363
G1 X41.706 Y87.113 E.0287
G1 X42.271 Y86.414 E.03346
G1 X42.946 Y85.823 E.03342
G1 X43.626 Y85.41 E.02963
M204 S6000
G1 X43.864 Y85.8 F42000
G1 F3000
M204 S500
G1 X43.892 Y85.783 E.00121
G1 X44.657 Y85.481 E.03064
G1 X45.626 Y85.298 E.03675
G1 X46.294 Y85.293 E.02488
G1 X46.809 Y85.323 E.01919
G1 X62.076 Y83.988 E.5708
G1 X62.437 Y83.972 E.01345
G1 X135.468 Y83.973 E2.72013
G1 X135.985 Y84.011 E.01934
G1 X136.459 Y84.115 E.01805
M73 P46 R7
G1 X137.157 Y84.406 E.0282
G1 X137.653 Y84.72 E.02185
G1 X138.03 Y85.051 E.01866
G1 X138.367 Y85.452 E.01954
G1 X138.634 Y85.894 E.01921
G1 X138.885 Y86.538 E.02574
G1 X138.992 Y87.038 E.01905
G1 X139.027 Y87.529 E.01836
G1 X139.028 Y92.448 E.18319
G1 X138.989 Y92.984 E.02004
G1 X138.871 Y93.503 E.01983
G1 X138.573 Y94.197 E.0281
G1 X138.281 Y94.652 E.02015
G1 X137.921 Y95.057 E.02018
G1 X137.531 Y95.379 E.01881
G1 X137.106 Y95.634 E.01848
G1 X136.505 Y95.872 E.02407
G1 X135.923 Y95.997 E.02216
G1 X135.453 Y96.028 E.01755
G1 X61.947 Y96.028 E2.73782
G1 X61.598 Y96.013 E.01301
G1 X46.606 Y94.701 E.56053
G1 X45.577 Y94.695 E.03834
G1 X44.717 Y94.536 E.03254
G1 X43.987 Y94.263 E.02903
G1 X43.363 Y93.908 E.02678
G1 X42.741 Y93.406 E.02976
G1 X42.215 Y92.81 E.0296
G1 X41.783 Y92.108 E.0307
G1 X41.481 Y91.343 E.03062
G1 X41.299 Y90.376 E.03665
G1 X41.307 Y89.553 E.03067
G1 X41.451 Y88.763 E.02991
G1 X41.737 Y87.987 E.03078
G1 X42.092 Y87.363 E.02676
G1 X42.594 Y86.741 E.02974
G1 X43.208 Y86.201 E.03047
G1 X43.813 Y85.832 E.0264
M204 S6000
G1 X44.051 Y86.224 F42000
G1 F3000
M204 S500
G1 X44.108 Y86.19 E.00245
G1 X44.797 Y85.92 E.02758
G1 X45.683 Y85.755 E.03356
G1 X46.278 Y85.751 E.02216
G1 X46.858 Y85.778 E.02161
G1 X62.108 Y84.444 E.57019
G1 X62.45 Y84.429 E.01272
G1 X135.446 Y84.43 E2.71882
G1 X135.909 Y84.464 E.01732
G1 X136.309 Y84.55 E.01521
G1 X136.956 Y84.82 E.02611
G1 X137.369 Y85.081 E.01823
G1 X137.694 Y85.364 E.01604
G1 X137.987 Y85.711 E.01691
G1 X138.226 Y86.108 E.01725
G1 X138.448 Y86.68 E.02287
G1 X138.539 Y87.112 E.01644
G1 X138.57 Y87.541 E.01602
G1 X138.571 Y92.426 E.18195
G1 X138.536 Y92.906 E.01792
G1 X138.429 Y93.373 E.01783
G1 X138.162 Y93.991 E.02511
G1 X137.908 Y94.383 E.01739
G1 X137.61 Y94.719 E.01674
G1 X137.275 Y94.998 E.01622
G1 X136.912 Y95.217 E.01577
G1 X136.382 Y95.429 E.02128
G1 X135.87 Y95.541 E.01953
G1 X135.443 Y95.571 E.01595
G1 X61.96 Y95.571 E2.73696
G1 X61.631 Y95.557 E.01226
G1 X46.651 Y94.246 E.56007
G1 X45.632 Y94.238 E.03798
G1 X44.852 Y94.096 E.02953
G1 X44.192 Y93.852 E.0262
G1 X43.612 Y93.522 E.02485
G1 X43.067 Y93.082 E.0261
G1 X42.591 Y92.546 E.02668
G1 X42.2 Y91.913 E.02773
G1 X41.927 Y91.228 E.02746
G1 X41.756 Y90.322 E.03433
G1 X41.764 Y89.608 E.0266
G1 X41.892 Y88.895 E.02697
G1 X42.149 Y88.191 E.02792
G1 X42.478 Y87.612 E.02481
G1 X42.934 Y87.051 E.02692
G1 X43.49 Y86.565 E.02754
G1 X44 Y86.255 E.02221
M204 S6000
G1 X44.237 Y86.648 F42000
G1 F3000
M204 S500
G1 X44.322 Y86.596 E.0037
G1 X44.936 Y86.359 E.02452
G1 X45.739 Y86.212 E.03041
G1 X46.272 Y86.208 E.01984
M73 P47 R7
G1 X46.906 Y86.232 E.02365
G1 X62.141 Y84.9 E.56961
G1 X62.463 Y84.886 E.01198
G1 X135.424 Y84.887 E2.71753
G1 X135.834 Y84.917 E.01534
G1 X136.183 Y84.993 E.01328
G1 X136.754 Y85.233 E.02308
G1 X137.087 Y85.443 E.01466
G1 X137.36 Y85.679 E.01344
G1 X137.62 Y85.988 E.01504
G1 X137.819 Y86.321 E.01444
G1 X138.011 Y86.822 E.01998
G1 X138.086 Y87.185 E.01384
G1 X138.113 Y87.562 E.01407
G1 X138.114 Y92.405 E.18036
G1 X138.081 Y92.848 E.01657
G1 X137.988 Y93.241 E.01502
G1 X137.762 Y93.765 E.02125
G1 X137.549 Y94.097 E.01469
G1 X137.298 Y94.382 E.01416
G1 X137.017 Y94.618 E.01366
G1 X136.698 Y94.811 E.01389
G1 X136.258 Y94.986 E.01764
G1 X135.815 Y95.086 E.01691
G1 X135.432 Y95.113 E.0143
G1 X61.972 Y95.114 E2.73609
G1 X61.664 Y95.101 E.01151
G1 X46.696 Y93.792 E.55961
G1 X45.686 Y93.782 E.03762
G1 X44.985 Y93.656 E.02654
G1 X44.396 Y93.44 E.02335
G1 X43.862 Y93.136 E.0229
G1 X43.376 Y92.741 E.02331
G1 X42.967 Y92.281 E.02293
G1 X42.616 Y91.717 E.02476
G1 X42.373 Y91.112 E.02427
G1 X42.214 Y90.268 E.03198
G1 X42.222 Y89.64 E.02341
G1 X42.332 Y89.027 E.0232
G1 X42.561 Y88.395 E.02503
G1 X42.864 Y87.862 E.02281
G1 X43.273 Y87.362 E.02407
G1 X43.772 Y86.929 E.02461
G1 X44.186 Y86.679 E.01801
M204 S6000
G1 X44.422 Y87.067 F42000
G1 F3000
M204 S500
G1 X44.572 Y86.976 E.00656
G1 X44.867 Y86.853 E.01191
G1 X45.182 Y86.757 E.01226
G1 X45.914 Y86.665 E.02747
G1 X46.626 Y86.716 E.02658
G1 X62.386 Y85.345 E.58923
G1 X135.636 Y85.357 E2.72826
G1 X135.998 Y85.419 E.01368
G1 X136.357 Y85.539 E.01411
G1 X136.541 Y85.639 E.00778
G1 X136.912 Y85.904 E.01698
G1 X137.128 Y86.118 E.01135
G1 X137.301 Y86.353 E.01085
G1 X137.565 Y86.926 E.02351
G1 X137.611 Y87.113 E.00719
G1 X137.644 Y87.417 E.01138
G1 X137.632 Y92.745 E.19843
G1 X137.561 Y93.079 E.01274
G1 X137.473 Y93.324 E.00968
G1 X137.376 Y93.521 E.0082
G1 X137.022 Y93.989 E.02185
G1 X136.877 Y94.132 E.00757
G1 X136.545 Y94.363 E.01508
G1 X136.221 Y94.516 E.01332
G1 X135.853 Y94.615 E.01422
G1 X135.465 Y94.657 E.01453
G1 X61.94 Y94.657 E2.73854
G1 X46.45 Y93.311 E.57909
G1 X45.96 Y93.339 E.01829
G1 X45.371 Y93.282 E.02205
G1 X44.995 Y93.187 E.01445
G1 X44.583 Y93.028 E.01645
G1 X44.478 Y92.972 E.00443
G1 X43.66 Y92.387 E.03743
G1 X43.36 Y92.049 E.01685
G1 X43.109 Y91.678 E.01667
G1 X42.908 Y91.272 E.01688
G1 X42.766 Y90.842 E.01685
M73 P48 R7
G1 X42.665 Y90.169 E.02536
G1 X42.706 Y89.46 E.02645
G1 X42.863 Y88.858 E.02315
G1 X43.13 Y88.296 E.02319
G1 X43.488 Y87.8 E.02278
G1 X44.016 Y87.313 E.02675
G1 X44.37 Y87.099 E.01542
M204 S6000
G1 X44.601 Y87.484 F42000
G1 F3000
M204 S500
G1 X44.738 Y87.402 E.00594
G1 X45.049 Y87.273 E.01255
G1 X45.321 Y87.193 E.01056
G1 X45.978 Y87.118 E.02464
G1 X46.613 Y87.176 E.02373
G1 X62.432 Y85.8 E.59142
G1 X135.557 Y85.807 E2.72364
G1 X135.854 Y85.853 E.01121
G1 X136.145 Y85.944 E.01132
G1 X136.268 Y86.006 E.00517
G1 X136.655 Y86.282 E.01771
M73 P48 R6
G1 X136.8 Y86.436 E.00785
G1 X136.935 Y86.626 E.00869
G1 X137.123 Y87.04 E.01693
G1 X137.157 Y87.163 E.00474
G1 X137.187 Y87.41 E.00927
G1 X137.186 Y92.644 E.19496
G1 X137.13 Y92.927 E.01076
G1 X137.067 Y93.115 E.00737
G1 X136.96 Y93.331 E.00898
G1 X136.659 Y93.711 E.01805
G1 X136.562 Y93.802 E.00496
G1 X136.283 Y93.988 E.01249
G1 X136.027 Y94.102 E.01042
G1 X135.81 Y94.16 E.0084
G1 X135.473 Y94.2 E.01264
G1 X61.934 Y94.2 E2.73904
G1 X46.442 Y92.852 E.5792
G1 X46.008 Y92.885 E.01622
G1 X45.492 Y92.841 E.01927
G1 X45.098 Y92.742 E.01514
G1 X44.745 Y92.601 E.01414
G1 X44.002 Y92.084 E.03371
G1 X43.744 Y91.8 E.01431
G1 X43.483 Y91.414 E.01735
G1 X43.318 Y91.068 E.01428
G1 X43.198 Y90.694 E.01464
G1 X43.121 Y90.2 E.01861
G1 X43.148 Y89.577 E.02323
G1 X43.27 Y89.066 E.01956
G1 X43.548 Y88.481 E.02414
G1 X43.86 Y88.065 E.01937
G1 X44.329 Y87.647 E.02339
G1 X44.55 Y87.515 E.00957
M204 S6000
G1 X44.787 Y87.901 F42000
G1 F3000
M204 S500
G1 X44.911 Y87.825 E.00539
G1 X45.171 Y87.714 E.01054
G1 X45.461 Y87.628 E.01128
G1 X46.036 Y87.571 E.0215
G1 X46.592 Y87.636 E.02086
G1 X62.426 Y86.257 E.59198
G1 X135.477 Y86.257 E2.72088
G1 X135.795 Y86.306 E.01198
G1 X136.003 Y86.378 E.00819
G1 X136.331 Y86.603 E.01483
G1 X136.421 Y86.692 E.00471
G1 X136.569 Y86.901 E.00953
G1 X136.704 Y87.222 E.01299
G1 X136.73 Y87.402 E.00676
G1 X136.738 Y92.555 E.19191
G1 X136.699 Y92.773 E.00827
G1 X136.631 Y92.978 E.00804
G1 X136.552 Y93.126 E.00626
G1 X136.304 Y93.424 E.01445
G1 X136.097 Y93.571 E.00943
G1 X135.9 Y93.663 E.0081
G1 X135.758 Y93.706 E.00552
G1 X135.481 Y93.743 E.01044
G1 X61.928 Y93.743 E2.73956
G1 X46.426 Y92.391 E.57957
G1 X46.047 Y92.429 E.01419
G1 X45.614 Y92.401 E.01614
G1 X45.201 Y92.296 E.01589
G1 X44.916 Y92.177 E.01148
G1 X44.343 Y91.78 E.02598
G1 X44.123 Y91.546 E.01195
G1 X43.895 Y91.218 E.0149
G1 X43.756 Y90.938 E.01162
G1 X43.63 Y90.545 E.01539
G1 X43.572 Y90.126 E.01574
G1 X43.604 Y89.594 E.01987
G1 X43.715 Y89.171 E.01628
G1 X43.962 Y88.675 E.02065
M73 P49 R6
G1 X44.226 Y88.338 E.01592
G1 X44.559 Y88.042 E.0166
G1 X44.736 Y87.933 E.00776
M204 S6000
G1 X44.981 Y88.314 F42000
G1 F3000
M204 S500
G1 X45.082 Y88.249 E.00447
G1 X45.359 Y88.13 E.01122
G1 X45.592 Y88.066 E.00903
G1 X46.086 Y88.025 E.01845
G1 X46.561 Y88.098 E.01788
G1 X62.42 Y86.714 E.59293
G1 X135.488 Y86.714 E2.7215
G1 X135.721 Y86.757 E.00884
G1 X135.839 Y86.804 E.00475
G1 X136.061 Y86.973 E.01037
G1 X136.152 Y87.086 E.00541
G1 X136.255 Y87.306 E.00906
G1 X136.273 Y87.393 E.00331
G1 X136.286 Y92.491 E.18989
G1 X136.27 Y92.618 E.00474
G1 X136.194 Y92.843 E.00884
G1 X136.027 Y93.061 E.01023
G1 X135.914 Y93.152 E.00541
G1 X135.697 Y93.254 E.00892
G1 X135.489 Y93.286 E.00782
G1 X61.922 Y93.286 E2.74011
G1 X46.408 Y91.931 E.58002
G1 X45.987 Y91.976 E.0158
G1 X45.648 Y91.945 E.01268
G1 X45.314 Y91.854 E.0129
G1 X45.092 Y91.755 E.00904
G1 X44.681 Y91.471 E.0186
G1 X44.449 Y91.225 E.0126
G1 X44.271 Y90.958 E.01194
G1 X44.165 Y90.735 E.00922
G1 X44.065 Y90.404 E.01289
G1 X44.025 Y90.062 E.01281
G1 X44.061 Y89.62 E.01652
G1 X44.157 Y89.287 E.01288
G1 X44.321 Y88.958 E.01371
G1 X44.53 Y88.68 E.01296
G1 X44.798 Y88.432 E.0136
G1 X44.93 Y88.346 E.00588
M204 S6000
G1 X45.183 Y88.723 F42000
G1 F3000
M204 S500
G1 X45.265 Y88.668 E.00366
G1 X45.471 Y88.573 E.00843
G1 X45.726 Y88.503 E.00986
G1 X46.028 Y88.479 E.0113
G1 X46.274 Y88.503 E.00921
G1 X46.498 Y88.562 E.0086
G1 X62.414 Y87.171 E.59507
G1 X135.5 Y87.171 E2.72218
G1 X135.611 Y87.2 E.00426
G1 X135.695 Y87.247 E.00361
G1 X135.804 Y87.384 E.00651
G1 X135.829 Y87.5 E.00442
G1 X135.829 Y92.5 E.18623
G1 X135.8 Y92.611 E.00426
G1 X135.753 Y92.695 E.00361
G1 X135.616 Y92.804 E.00651
G1 X135.5 Y92.829 E.00442
G1 X61.916 Y92.829 E2.74073
G1 X46.379 Y91.47 E.5809
G1 X46.028 Y91.521 E.01321
G1 X45.765 Y91.503 E.00981
G1 X45.508 Y91.44 E.00987
G1 X45.265 Y91.332 E.0099
G1 X45.014 Y91.159 E.01135
G1 X44.828 Y90.97 E.0099
G1 X44.688 Y90.771 E.00904
G1 X44.573 Y90.529 E.00997
G1 X44.503 Y90.274 E.00986
G1 X44.479 Y90.01 E.0099
G1 X44.5 Y89.745 E.00988
G1 X44.567 Y89.489 E.00986
G1 X44.688 Y89.23 E.01063
G1 X44.842 Y89.013 E.00992
G1 X45.045 Y88.816 E.01054
G1 X45.134 Y88.756 E.00398
; WIPE_START
G1 X45.265 Y88.668 E-.06017
G1 X45.471 Y88.573 E-.08601
G1 X45.726 Y88.503 E-.10058
G1 X46.028 Y88.479 E-.11525
M73 P50 R6
G1 X46.274 Y88.503 E-.09399
G1 X46.498 Y88.562 E-.08778
G1 X47.065 Y88.512 E-.21623
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X46.602 Y89.134 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X62.425 Y87.75 E.5916
G1 X135.25 Y87.75 E2.71246
G1 X135.25 Y92.25 E.16761
G1 X61.927 Y92.25 E2.73101
G1 X46.329 Y90.885 E.58318
G3 X46.402 Y89.151 I-.328 J-.882 E.13802
G1 X46.542 Y89.139 E.00521
M204 S6000
G1 X46.398 Y89.61 F42000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X62.445 Y88.207 E.59996
G1 X134.793 Y88.207 E2.69469
G1 X134.793 Y91.793 E.13356
G1 X61.947 Y91.793 E2.71324
G1 X46.289 Y90.422 E.58544
G3 X45.689 Y90.371 I-.257 J-.532 E.02354
G3 X46.165 Y89.545 I.319 J-.366 E.04986
G1 X46.32 Y89.617 E.00637
G1 X46.338 Y89.615 E.00067
; WIPE_START
G1 X48.331 Y89.441 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X48.154 Y90.021 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.634372
G1 F3000
M204 S500
G1 X47.844 Y90.021 E.01494
; LINE_WIDTH: 0.589251
G1 X47.534 Y90.021 E.0138
; LINE_WIDTH: 0.544129
G1 X47.224 Y90.021 E.01266
; LINE_WIDTH: 0.499008
G1 X46.914 Y90.021 E.01152
; LINE_WIDTH: 0.453887
G1 X46.604 Y90.021 E.01038
; LINE_WIDTH: 0.405819
G1 X46.283 Y90.021 E.00948
G3 X45.746 Y89.991 I.26 J-9.386 E.01592
; WIPE_START
G1 X46.283 Y90.021 E-.47627
G1 X46.604 Y90.021 E-.28373
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X54.236 Y89.96 Z.6 F42000
G1 X134.61 Y89.319 Z.6
G1 Z.2
M73 P51 R6
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50249
G1 F6300
M204 S500
G1 X133.887 Y88.596 E.03832
G1 X133.237 Y88.596 E.02434
G1 X134.404 Y89.763 E.06185
G1 X134.404 Y90.413 E.02434
G1 X132.587 Y88.596 E.09627
G1 X131.937 Y88.596 E.02434
G1 X134.404 Y91.063 E.13069
G1 X134.404 Y91.404 E.01278
G1 X134.096 Y91.404 E.01156
G1 X131.287 Y88.596 E.14876
G1 X130.637 Y88.596 E.02434
G1 X133.446 Y91.404 E.14876
G1 X132.796 Y91.404 E.02434
G1 X129.987 Y88.596 E.14876
G1 X129.337 Y88.596 E.02434
G1 X132.146 Y91.404 E.14876
G1 X131.496 Y91.404 E.02434
G1 X128.687 Y88.596 E.14876
G1 X128.037 Y88.596 E.02434
G1 X130.846 Y91.404 E.14876
G1 X130.196 Y91.404 E.02434
G1 X127.387 Y88.596 E.14876
G1 X126.737 Y88.596 E.02434
G1 X129.546 Y91.404 E.14876
G1 X128.896 Y91.404 E.02434
G1 X126.087 Y88.596 E.14876
G1 X125.437 Y88.596 E.02434
G1 X128.246 Y91.404 E.14876
G1 X127.596 Y91.404 E.02434
G1 X124.788 Y88.596 E.14876
G1 X124.138 Y88.596 E.02434
G1 X126.946 Y91.404 E.14876
G1 X126.297 Y91.404 E.02434
G1 X123.488 Y88.596 E.14876
G1 X122.838 Y88.596 E.02434
G1 X125.647 Y91.404 E.14876
G1 X124.997 Y91.404 E.02434
G1 X122.188 Y88.596 E.14876
G1 X121.538 Y88.596 E.02434
G1 X124.347 Y91.404 E.14876
G1 X123.697 Y91.404 E.02434
G1 X120.888 Y88.596 E.14876
G1 X120.238 Y88.596 E.02434
G1 X123.047 Y91.404 E.14876
G1 X122.397 Y91.404 E.02434
G1 X119.588 Y88.596 E.14876
G1 X118.938 Y88.596 E.02434
G1 X121.747 Y91.404 E.14876
G1 X121.097 Y91.404 E.02434
G1 X118.288 Y88.596 E.14876
G1 X117.638 Y88.596 E.02434
G1 X120.447 Y91.404 E.14876
G1 X119.797 Y91.404 E.02434
G1 X116.988 Y88.596 E.14876
G1 X116.338 Y88.596 E.02434
G1 X119.147 Y91.404 E.14876
G1 X118.497 Y91.404 E.02434
G1 X115.689 Y88.596 E.14876
G1 X115.039 Y88.596 E.02434
G1 X117.847 Y91.404 E.14876
G1 X117.197 Y91.404 E.02434
G1 X114.389 Y88.596 E.14876
G1 X113.739 Y88.596 E.02434
G1 X116.548 Y91.404 E.14876
G1 X115.898 Y91.404 E.02434
G1 X113.089 Y88.596 E.14876
G1 X112.439 Y88.596 E.02434
G1 X115.248 Y91.404 E.14876
G1 X114.598 Y91.404 E.02434
G1 X111.789 Y88.596 E.14876
G1 X111.139 Y88.596 E.02434
G1 X113.948 Y91.404 E.14876
G1 X113.298 Y91.404 E.02434
M73 P52 R6
G1 X110.489 Y88.596 E.14876
G1 X109.839 Y88.596 E.02434
G1 X112.648 Y91.404 E.14876
G1 X111.998 Y91.404 E.02434
G1 X109.189 Y88.596 E.14876
G1 X108.539 Y88.596 E.02434
G1 X111.348 Y91.404 E.14876
G1 X110.698 Y91.404 E.02434
G1 X107.889 Y88.596 E.14876
G1 X107.239 Y88.596 E.02434
G1 X110.048 Y91.404 E.14876
G1 X109.398 Y91.404 E.02434
G1 X106.589 Y88.596 E.14876
G1 X105.94 Y88.596 E.02434
G1 X108.748 Y91.404 E.14876
G1 X108.098 Y91.404 E.02434
G1 X105.29 Y88.596 E.14876
G1 X104.64 Y88.596 E.02434
G1 X107.449 Y91.404 E.14876
G1 X106.799 Y91.404 E.02434
G1 X103.99 Y88.596 E.14876
G1 X103.34 Y88.596 E.02434
G1 X106.149 Y91.404 E.14876
G1 X105.499 Y91.404 E.02434
G1 X102.69 Y88.596 E.14876
G1 X102.04 Y88.596 E.02434
G1 X104.849 Y91.404 E.14876
G1 X104.199 Y91.404 E.02434
G1 X101.39 Y88.596 E.14876
G1 X100.74 Y88.596 E.02434
G1 X103.549 Y91.404 E.14876
G1 X102.899 Y91.404 E.02434
G1 X100.09 Y88.596 E.14876
G1 X99.44 Y88.596 E.02434
G1 X102.249 Y91.404 E.14876
G1 X101.599 Y91.404 E.02434
G1 X98.79 Y88.596 E.14876
G1 X98.14 Y88.596 E.02434
G1 X100.949 Y91.404 E.14876
G1 X100.299 Y91.404 E.02434
G1 X97.49 Y88.596 E.14876
G1 X96.841 Y88.596 E.02434
G1 X99.649 Y91.404 E.14876
G1 X98.999 Y91.404 E.02434
G1 X96.191 Y88.596 E.14876
G1 X95.541 Y88.596 E.02434
G1 X98.35 Y91.404 E.14876
G1 X97.7 Y91.404 E.02434
G1 X94.891 Y88.596 E.14876
G1 X94.241 Y88.596 E.02434
G1 X97.05 Y91.404 E.14876
G1 X96.4 Y91.404 E.02434
G1 X93.591 Y88.596 E.14876
G1 X92.941 Y88.596 E.02434
G1 X95.75 Y91.404 E.14876
G1 X95.1 Y91.404 E.02434
G1 X92.291 Y88.596 E.14876
G1 X91.641 Y88.596 E.02434
G1 X94.45 Y91.404 E.14876
G1 X93.8 Y91.404 E.02434
G1 X90.991 Y88.596 E.14876
G1 X90.341 Y88.596 E.02434
G1 X93.15 Y91.404 E.14876
G1 X92.5 Y91.404 E.02434
G1 X89.691 Y88.596 E.14876
G1 X89.041 Y88.596 E.02434
G1 X91.85 Y91.404 E.14876
G1 X91.2 Y91.404 E.02434
G1 X88.391 Y88.596 E.14876
G1 X87.742 Y88.596 E.02434
G1 X90.55 Y91.404 E.14876
G1 X89.9 Y91.404 E.02434
G1 X87.092 Y88.596 E.14876
G1 X86.442 Y88.596 E.02434
G1 X89.25 Y91.404 E.14876
G1 X88.601 Y91.404 E.02434
G1 X85.792 Y88.596 E.14876
G1 X85.142 Y88.596 E.02434
G1 X87.951 Y91.404 E.14876
G1 X87.301 Y91.404 E.02434
G1 X84.492 Y88.596 E.14876
G1 X83.842 Y88.596 E.02434
G1 X86.651 Y91.404 E.14876
G1 X86.001 Y91.404 E.02434
M73 P53 R6
G1 X83.192 Y88.596 E.14876
G1 X82.542 Y88.596 E.02434
G1 X85.351 Y91.404 E.14876
G1 X84.701 Y91.404 E.02434
G1 X81.892 Y88.596 E.14876
G1 X81.242 Y88.596 E.02434
G1 X84.051 Y91.404 E.14876
G1 X83.401 Y91.404 E.02434
G1 X80.592 Y88.596 E.14876
G1 X79.942 Y88.596 E.02434
G1 X82.751 Y91.404 E.14876
G1 X82.101 Y91.404 E.02434
G1 X79.292 Y88.596 E.14876
G1 X78.642 Y88.596 E.02434
G1 X81.451 Y91.404 E.14876
G1 X80.801 Y91.404 E.02434
G1 X77.993 Y88.596 E.14876
G1 X77.343 Y88.596 E.02434
G1 X80.151 Y91.404 E.14876
G1 X79.502 Y91.404 E.02434
G1 X76.693 Y88.596 E.14876
G1 X76.043 Y88.596 E.02434
G1 X78.852 Y91.404 E.14876
G1 X78.202 Y91.404 E.02434
G1 X75.393 Y88.596 E.14876
G1 X74.743 Y88.596 E.02434
G1 X77.552 Y91.404 E.14876
G1 X76.902 Y91.404 E.02434
G1 X74.093 Y88.596 E.14876
G1 X73.443 Y88.596 E.02434
G1 X76.252 Y91.404 E.14876
G1 X75.602 Y91.404 E.02434
G1 X72.793 Y88.596 E.14876
G1 X72.143 Y88.596 E.02434
G1 X74.952 Y91.404 E.14876
G1 X74.302 Y91.404 E.02434
G1 X71.493 Y88.596 E.14876
G1 X70.843 Y88.596 E.02434
G1 X73.652 Y91.404 E.14876
G1 X73.002 Y91.404 E.02434
G1 X70.193 Y88.596 E.14876
G1 X69.543 Y88.596 E.02434
G1 X72.352 Y91.404 E.14876
G1 X71.702 Y91.404 E.02434
G1 X68.894 Y88.596 E.14876
G1 X68.244 Y88.596 E.02434
G1 X71.052 Y91.404 E.14876
G1 X70.403 Y91.404 E.02434
G1 X67.594 Y88.596 E.14876
G1 X66.944 Y88.596 E.02434
G1 X69.753 Y91.404 E.14876
G1 X69.103 Y91.404 E.02434
G1 X66.294 Y88.596 E.14876
G1 X65.644 Y88.596 E.02434
G1 X68.453 Y91.404 E.14876
G1 X67.803 Y91.404 E.02434
G1 X64.994 Y88.596 E.14876
G1 X64.344 Y88.596 E.02434
G1 X67.153 Y91.404 E.14876
G1 X66.503 Y91.404 E.02434
G1 X63.694 Y88.596 E.14876
G1 X63.044 Y88.596 E.02434
G1 X65.853 Y91.404 E.14876
G1 X65.203 Y91.404 E.02434
G1 X62.4 Y88.601 E.14847
G1 X61.802 Y88.653 E.02247
G1 X64.553 Y91.404 E.1457
G1 X63.903 Y91.404 E.02434
G1 X61.204 Y88.706 E.14294
G1 X60.607 Y88.758 E.02247
G1 X63.253 Y91.404 E.14017
G1 X62.603 Y91.404 E.02434
G1 X60.009 Y88.81 E.1374
G1 X59.411 Y88.862 E.02247
G1 X61.952 Y91.403 E.13458
G1 X61.24 Y91.341 E.02678
G1 X58.814 Y88.915 E.12851
G1 X58.216 Y88.967 E.02247
G1 X60.528 Y91.279 E.12244
G1 X59.816 Y91.216 E.02678
G1 X57.618 Y89.019 E.11637
M73 P54 R6
G1 X57.021 Y89.071 E.02247
G1 X59.103 Y91.154 E.1103
G1 X58.391 Y91.092 E.02678
G1 X56.423 Y89.124 E.10423
G1 X55.825 Y89.176 E.02247
G1 X57.679 Y91.029 E.09816
G1 X56.966 Y90.967 E.02678
G1 X55.228 Y89.228 E.09209
G1 X54.63 Y89.28 E.02247
G1 X56.254 Y90.905 E.08602
G1 X55.542 Y90.842 E.02678
G1 X54.032 Y89.333 E.07995
G1 X53.435 Y89.385 E.02247
G1 X54.83 Y90.78 E.07388
G1 X54.117 Y90.718 E.02678
G1 X52.837 Y89.437 E.06781
G1 X52.239 Y89.489 E.02247
G1 X53.405 Y90.655 E.06174
G1 X52.693 Y90.593 E.02678
G1 X51.642 Y89.542 E.05567
G1 X51.044 Y89.594 E.02247
G1 X51.98 Y90.531 E.0496
G1 X51.268 Y90.468 E.02678
G1 X50.446 Y89.646 E.04353
G1 X49.849 Y89.699 E.02247
G1 X50.556 Y90.406 E.03746
G1 X49.844 Y90.343 E.02678
G1 X49.251 Y89.751 E.03139
G1 X48.653 Y89.803 E.02247
G1 X49.358 Y90.507 E.0373
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X48.653 Y89.803 E-.37853
G1 X49.251 Y89.751 E-.22798
G1 X49.537 Y90.036 E-.15349
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/40
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 91
M204 S10000
G17
G3 Z.6 I.264 J-1.188 P1  F42000
G1 X46.933 Y89.458 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X62.44 Y88.102 E.51637
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.518 Y90.548 E.5136
G3 X45.875 Y90.707 I-.564 J-.901 E.02236
G3 X46.524 Y89.494 I.135 J-.708 E.08958
G1 X46.873 Y89.463 E.01164
M204 S10000
G1 X46.515 Y89.018 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9489
M204 S5000
G1 X46.556 Y89.037 E.00138
G1 X46.58 Y89.054 E.00091
G1 X46.632 Y89.091 E.00195
G1 X62.423 Y87.71 E.48706
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.987 Y90.982 E.46076
G1 X46.589 Y90.948 E.01229
G1 F5001.417
G1 X46.514 Y90.982 E.00252
G1 F4229.858
G1 X46.38 Y91.045 E.00455
G1 F3000
G3 X46.38 Y88.955 I-.378 J-1.045 E.13094
G1 F3713.691
G1 X46.461 Y88.993 E.00274
; WIPE_START
M204 S6000
G1 X46.556 Y89.037 E-.03992
G1 X46.58 Y89.054 E-.01122
G1 X46.632 Y89.091 E-.02417
G1 X48.427 Y88.934 E-.68469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X62.523 Y91.506 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9489
M204 S6000
G1 X134.506 Y91.506 E2.21177
G1 X134.506 Y88.494 E.09254
G1 X62.457 Y88.494 E2.21379
G1 X61.895 Y88.543 E.01735
; LINE_WIDTH: 0.40583
G1 X54.195 Y89.202 E.22853
; LINE_WIDTH: 0.377853
G1 X46.356 Y89.862 E.21471
; LINE_WIDTH: 0.448949
G1 F8866.376
G1 X46.236 Y89.823 E.00419
; LINE_WIDTH: 0.486145
G1 F8122.285
G1 X46.115 Y89.784 E.00457
; LINE_WIDTH: 0.539239
G1 F7253.404
G1 X45.995 Y89.745 E.00512
G1 X45.802 Y89.834 E.00857
G1 X45.742 Y90 E.00713
G1 X45.802 Y90.166 E.00712
G1 X45.954 Y90.254 E.00712
; LINE_WIDTH: 0.519567
G1 F7552.771
G1 X46.082 Y90.236 E.005
; LINE_WIDTH: 0.474779
G1 F8336.058
G1 X46.209 Y90.218 E.00453
; LINE_WIDTH: 0.429992
G1 F9300.613
G1 X46.337 Y90.199 E.00406
; LINE_WIDTH: 0.38086
G1 F9489
M73 P55 R6
G3 X46.496 Y90.181 I.156 J.642 E.00442
; LINE_WIDTH: 0.37751
G1 X54.195 Y90.84 E.2107
; LINE_WIDTH: 0.4068
G1 X61.895 Y91.5 E.22914
G1 X62.463 Y91.505 E.01685
M204 S10000
G1 X62.024 Y90.022 F42000
; LINE_WIDTH: 0.415027
G1 F9489
M204 S6000
G1 X62.523 Y90 E.01514
G1 X132.94 Y90 E2.13518
M204 S10000
G1 X62.507 Y89.625 F42000
; LINE_WIDTH: 0.41999
G1 F9489
M204 S6000
G1 X57.975 Y90.022 E.13977
G1 X62.009 Y90.375 E.12441
G1 X133.375 Y90.375 E2.19282
G1 X133.375 Y89.625 E.02302
G1 X62.567 Y89.625 E2.17567
M204 S10000
G1 X62.49 Y89.248 F42000
G1 F9489
M204 S6000
G1 X53.649 Y90.021 E.2727
G1 X61.992 Y90.752 E.25734
G1 X133.752 Y90.752 E2.20491
G1 X133.752 Y89.248 E.0462
G1 X62.55 Y89.248 E2.18776
M204 S10000
G1 X62.474 Y88.871 F42000
G1 F9489
M204 S6000
G1 X49.323 Y90.021 E.40563
G1 X61.976 Y91.129 E.39028
G1 X134.129 Y91.129 E2.217
G1 X134.129 Y88.871 E.06937
G1 X62.534 Y88.871 E2.19986
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X64.534 Y88.871 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/40
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z.8 I-.024 J-1.217 P1  F42000
G1 X46.235 Y89.229 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X46.277 Y89.24 E.00144
G3 X46.404 Y89.299 I-.276 J.76 E.00467
G1 X46.664 Y89.482 E.01053
G1 X62.44 Y88.102 E.52532
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.611 Y90.556 E.51051
G3 X45.596 Y90.701 I-.606 J-.616 E.03643
M73 P55 R5
G3 X46.141 Y89.204 I.405 J-.7 E.0749
G1 X46.177 Y89.213 E.00125
M204 S10000
G1 X46.57 Y88.944 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9300
M204 S5000
G1 X46.601 Y88.959 E.00107
G1 F9402
G1 X46.72 Y89.042 E.00446
G1 X46.772 Y89.079 E.00196
G1 X62.423 Y87.71 E.48274
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.719 Y90.959 E.46903
G1 X46.667 Y90.995 E.00196
G1 F9300
G3 X46.411 Y88.87 I-.665 J-.998 E.15032
G1 X46.515 Y88.918 E.00353
; WIPE_START
M204 S6000
G1 X46.601 Y88.959 E-.03604
G1 X46.72 Y89.042 E-.0552
G1 X46.772 Y89.079 E-.0242
G1 X48.462 Y88.931 E-.64455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X62.523 Y91.506 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.416038
G1 F9402
M204 S6000
G1 X134.506 Y91.506 E2.18859
G1 X134.506 Y88.494 E.09157
G1 X62.457 Y88.494 E2.19059
G1 X46.622 Y89.856 E.48323
G1 X46.467 Y89.811 E.00491
G1 X46.08 Y89.596 E.01347
G1 X45.86 Y89.615 E.00673
G1 X45.686 Y89.737 E.00644
G1 X45.597 Y89.929 E.00643
G1 X45.615 Y90.14 E.00646
M73 P56 R5
G1 X45.737 Y90.314 E.00644
G1 X45.929 Y90.403 E.00643
G1 X46.145 Y90.384 E.0066
G1 X46.478 Y90.188 E.01176
G1 X46.622 Y90.186 E.00438
G1 X61.895 Y91.5 E.46607
G1 X62.463 Y91.505 E.01728
M204 S10000
G1 X62.024 Y90.022 F42000
; LINE_WIDTH: 0.415027
G1 F9402
M204 S6000
G1 X62.523 Y90 E.01514
G1 X132.94 Y90 E2.13518
M204 S10000
G1 X62.507 Y89.625 F42000
; LINE_WIDTH: 0.41999
G1 F9402
M204 S6000
G1 X57.975 Y90.022 E.13977
G1 X62.009 Y90.375 E.12441
G1 X133.375 Y90.375 E2.19282
G1 X133.375 Y89.625 E.02302
G1 X62.567 Y89.625 E2.17567
M204 S10000
G1 X62.49 Y89.248 F42000
G1 F9402
M204 S6000
G1 X53.649 Y90.021 E.2727
G1 X61.992 Y90.752 E.25735
G1 X133.752 Y90.752 E2.20491
G1 X133.752 Y89.248 E.0462
G1 X62.55 Y89.248 E2.18776
M204 S10000
G1 X62.474 Y88.871 F42000
G1 F9402
M204 S6000
G1 X49.323 Y90.021 E.40563
G1 X61.976 Y91.129 E.39028
G1 X134.129 Y91.129 E2.217
G1 X134.129 Y88.871 E.06937
G1 X62.534 Y88.871 E2.19986
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X64.534 Y88.871 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/40
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z1 I-.034 J-1.216 P1  F42000
G1 X46.597 Y89.369 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4081
M204 S6000
G1 X46.748 Y89.474 E.0061
G1 X62.44 Y88.102 E.52253
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.695 Y90.563 E.50773
G3 X46 Y90.862 I-.762 J-.814 E.02559
G3 X46.432 Y89.254 I.002 J-.861 E.10462
G1 X46.548 Y89.335 E.00468
M204 S10000
G1 X46.608 Y88.903 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4081
M204 S5000
G1 X46.628 Y88.913 E.00071
G1 X46.803 Y89.035 E.00654
G1 X46.856 Y89.071 E.00196
G1 X62.423 Y87.71 E.48018
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.802 Y90.966 E.46647
G1 X46.75 Y91.003 E.00197
G3 X46.429 Y88.82 I-.748 J-1.005 E.15897
G1 X46.553 Y88.878 E.00421
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.628 Y88.913 E-.03155
M73 P57 R5
G1 X46.803 Y89.035 E-.08092
G1 X46.856 Y89.071 E-.02429
G1 X48.489 Y88.928 E-.62323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X50.269 Y90.527 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4081
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X88.45 Y88.45 E.35422
G1 X91.55 Y91.55 E.1454
G1 X89.585 Y91.55 E.06518
G1 X90.415 Y88.45 E.10644
G1 X92.044 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4081
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X100.6 Y91.55 F42000
G1 F4081
M204 S6000
G1 X102.228 Y91.55 E.05401
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.345 Y88.45 E.10644
G1 X134.55 Y88.45 E.20583
G1 X134.55 Y90.706 E.07483
G1 X131.402 Y91.55 E.10811
G1 X129.773 Y91.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X131.402 Y91.55 E-.61876
G1 X131.761 Y91.453 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/40
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z1.2 I.032 J-1.217 P1  F42000
G1 X46.444 Y89.232 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4270
M204 S6000
G1 X46.785 Y89.471 E.01383
G1 X62.44 Y88.102 E.52129
M73 P58 R5
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.731 Y90.566 E.50651
G3 X46.303 Y90.834 I-.974 J-1.084 E.01682
G3 X46.391 Y89.204 I-.301 J-.833 E.11583
M204 S10000
G1 X46.653 Y88.9 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4270
M204 S5000
G1 X46.893 Y89.068 E.009
G1 X62.423 Y87.71 E.47902
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.839 Y90.969 E.46532
G3 X46.601 Y88.87 I-.835 J-.969 E.17056
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.893 Y89.068 E-.134
G1 X48.534 Y88.924 E-.626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X50.269 Y90.527 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4270
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4270
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.784 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F4270
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.345 Y88.45 E.10644
G1 X128.645 Y88.45 E.00996
G1 X128.746 Y88.827 E.01295
M73 P59 R5
G1 X134.173 Y88.827 E.18
G1 X134.173 Y90.807 E.06567
G1 X132.809 Y91.173 E.04682
G1 X131.181 Y91.173 E.05401
M204 S10000
G1 X129.024 Y88.465 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383598
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X134.376 Y88.465 E.14857
G1 X134.508 Y88.492 E.00374
G1 X134.535 Y88.624 E.00374
G1 X134.535 Y91.376 E.0764
G1 X134.508 Y91.508 E.00374
G1 X134.376 Y91.535 E.00374
G1 X129.907 Y91.535 E.12406
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X131.907 Y91.535 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/40
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z1.4 I.033 J-1.217 P1  F42000
G1 X46.443 Y89.232 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4549
M204 S6000
G1 X46.785 Y89.471 E.01383
G1 X62.44 Y88.102 E.52129
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.732 Y90.566 E.50649
G3 X46.303 Y90.834 I-.98 J-1.095 E.01684
G3 X46.39 Y89.204 I-.302 J-.833 E.11599
M204 S10000
G1 X46.674 Y88.915 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4549
M204 S5000
G1 X46.893 Y89.068 E.0082
G1 X62.423 Y87.71 E.47902
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.84 Y90.969 E.46531
G3 X46.624 Y88.882 I-.837 J-.968 E.1715
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.893 Y89.068 E-.12419
G1 X48.56 Y88.922 E-.63582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X50.269 Y90.527 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4549
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4549
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F4549
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
M73 P60 R5
G1 X128.345 Y88.45 E.10644
G1 X128.645 Y88.45 E.00996
G1 X128.989 Y89.733 E.04405
M204 S10000
G1 X129.056 Y88.269 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.42907
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.929 Y91.528 E.19876
G1 X130.425 Y91.528 E.02922
G1 X129.606 Y88.472 E.18641
G1 X130.102 Y88.472 E.02922
G1 X130.921 Y91.528 E.18641
G1 X131.417 Y91.528 E.02922
G1 X130.598 Y88.472 E.18641
G1 X131.094 Y88.472 E.02922
G1 X131.913 Y91.528 E.18641
G1 X132.409 Y91.528 E.02922
G1 X131.59 Y88.472 E.18641
G1 X132.086 Y88.472 E.02922
G1 X132.905 Y91.528 E.18641
G1 X133.401 Y91.528 E.02922
G1 X132.582 Y88.472 E.18641
G1 X133.078 Y88.472 E.02922
G1 X133.896 Y91.528 E.18641
G1 X134.392 Y91.528 E.02922
G1 X133.574 Y88.472 E.18641
G1 X134.069 Y88.472 E.02922
G1 X134.731 Y90.94 E.15051
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X134.213 Y89.008 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/40
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z1.6 I-.003 J-1.217 P1  F42000
G1 X46.432 Y89.254 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4546
M204 S6000
G1 X46.748 Y89.474 E.01278
G1 X62.44 Y88.102 E.52252
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.694 Y90.563 E.50774
G3 X46 Y90.862 I-.76 J-.81 E.02558
G3 X46.379 Y89.226 I.002 J-.861 E.10263
M204 S10000
G1 X46.682 Y88.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4546
M204 S5000
G1 X46.856 Y89.071 E.00652
G1 X62.423 Y87.71 E.48017
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.802 Y90.966 E.46648
G3 X46.632 Y88.907 I-.797 J-.971 E.16803
G1 X46.636 Y88.911 E.00018
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.856 Y89.071 E-.10336
G1 X48.577 Y88.921 E-.65664
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X47.809 Y89.794 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.439363
G1 F4546
M204 S6000
G1 X47.258 Y89.823 E.01782
; LINE_WIDTH: 0.413387
G1 X46.707 Y89.852 E.01666
G1 X46.542 Y89.802 E.00523
G1 X46.154 Y89.561 E.01377
G1 X45.917 Y89.548 E.00716
G1 X45.699 Y89.643 E.00718
G1 X45.568 Y89.843 E.00722
G1 X45.541 Y90.081 E.00723
G1 X45.648 Y90.295 E.00723
G1 X45.841 Y90.438 E.00726
G1 X46.072 Y90.454 E.007
G1 X46.541 Y90.201 E.01606
; LINE_WIDTH: 0.418585
G1 X47.062 Y90.215 E.01596
; LINE_WIDTH: 0.45245
G3 X47.809 Y90.248 I.105 J6.073 E.02498
G1 X47.809 Y89.854 E.01313
M204 S10000
G1 X46.063 Y90 F42000
; LINE_WIDTH: 0.57642
G1 F4546
M204 S6000
G3 X45.969 Y89.943 I-.063 J-.003 E.01133
M204 S10000
G1 X50.269 Y90.527 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4546
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
M73 P61 R5
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4546
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F4546
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.345 Y88.45 E.10644
G1 X126.716 Y88.45 E.05401
M204 S10000
G1 X134.506 Y91.506 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4546
M204 S6000
G1 X134.506 Y88.494 E.09254
G1 X129.104 Y88.494 E.16599
G1 X129.104 Y91.506 E.09254
G1 X134.446 Y91.506 E.16414
M204 S10000
G1 X134.129 Y91.129 F42000
G1 F4546
M204 S6000
G1 X134.129 Y88.871 E.06937
G1 X129.481 Y88.871 E.14281
G1 X129.481 Y91.129 E.06937
G1 X134.069 Y91.129 E.14097
M204 S10000
G1 X133.752 Y90.752 F42000
G1 F4546
M204 S6000
G1 X133.752 Y89.248 E.0462
G1 X129.858 Y89.248 E.11964
G1 X129.858 Y90.752 E.0462
G1 X133.692 Y90.752 E.1178
M204 S10000
G1 X133.375 Y90.375 F42000
G1 F4546
M204 S6000
G1 X133.375 Y89.625 E.02302
G1 X130.235 Y89.625 E.09647
G1 X130.235 Y90.375 E.02302
G1 X133.315 Y90.375 E.09463
M204 S10000
G1 X130.61 Y90 F42000
; LINE_WIDTH: 0.41518
G1 F4546
M204 S6000
G1 X132.94 Y90 E.07069
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9670.66
G1 X130.94 Y90 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/40
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z1.8 I.01 J-1.217 P1  F42000
G1 X46.404 Y89.299 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4556
M204 S6000
G1 X46.664 Y89.482 E.01053
G1 X62.44 Y88.102 E.52532
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.611 Y90.556 E.51052
G3 X45.596 Y90.701 I-.606 J-.615 E.03642
G3 X46.351 Y89.271 I.405 J-.7 E.08226
M204 S10000
G1 X46.673 Y89.009 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4556
M204 S5000
G1 X46.772 Y89.079 E.00373
G1 X62.423 Y87.71 E.48274
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.719 Y90.959 E.46903
G3 X46.601 Y88.959 I-.719 J-.961 E.15889
G1 X46.624 Y88.974 E.00085
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.772 Y89.079 E-.06895
G1 X48.584 Y88.92 E-.69105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X46.623 Y89.856 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.405362
G1 F4556
M204 S6000
G1 X46.467 Y89.811 E.00479
G1 X46.116 Y89.622 E.01176
G1 X45.929 Y89.599 E.00557
G1 X45.686 Y89.737 E.00825
G1 X45.597 Y89.929 E.00625
G1 X45.615 Y90.14 E.00627
G1 X45.737 Y90.314 E.00626
G1 X45.929 Y90.403 E.00625
G1 X46.145 Y90.384 E.00641
G1 X46.478 Y90.188 E.01143
G1 X46.623 Y90.186 E.00426
G3 X49.779 Y90.44 I-13.68 J190.139 E.09352
G1 X49.779 Y89.603 E.02472
G3 X46.682 Y89.851 I-16.525 J-186.568 E.09175
M204 S10000
G1 X49.444 Y90.021 F42000
; LINE_WIDTH: 0.43268
G1 F4556
M204 S6000
G1 X49.42 Y90.063 E.00155
G1 X49.347 Y90.021 E.00268
G1 X49.368 Y90.009 E.00077
M204 S10000
G1 X46.026 Y89.955 F42000
; LINE_WIDTH: 0.45666
G1 F4556
M204 S6000
G2 X46.018 Y90.045 I-.026 J.043 E.00681
M204 S10000
G1 X50.269 Y90.527 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P62 R5
G1 F4556
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4556
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F4556
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.345 Y88.45 E.10644
G1 X126.716 Y88.45 E.05401
M204 S10000
G1 X134.506 Y90 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4556
M204 S6000
G1 X134.506 Y88.494 E.04627
G1 X129.088 Y88.494 E.16647
G1 X129.088 Y91.506 E.09254
G1 X134.506 Y91.506 E.16647
G1 X134.506 Y90.06 E.04443
M204 S10000
G1 X134.129 Y90 F42000
G1 F4556
M204 S6000
G1 X134.129 Y88.871 E.03468
G1 X129.465 Y88.871 E.1433
G1 X129.465 Y91.129 E.06937
G1 X134.129 Y91.129 E.1433
G1 X134.129 Y90.06 E.03284
M204 S10000
G1 X133.752 Y90 F42000
G1 F4556
M204 S6000
G1 X133.752 Y89.248 E.0231
G1 X129.842 Y89.248 E.12013
G1 X129.842 Y90.752 E.0462
G1 X133.752 Y90.752 E.12013
G1 X133.752 Y90.06 E.02125
M204 S10000
G1 X133.375 Y90 F42000
G1 F4556
M204 S6000
G1 X133.375 Y89.625 E.01151
G1 X130.219 Y89.625 E.09696
G1 X130.219 Y90.375 E.02302
G1 X133.375 Y90.375 E.09696
G1 X133.375 Y90.06 E.00967
M204 S10000
G1 X130.594 Y90 F42000
; LINE_WIDTH: 0.41518
G1 F4556
M204 S6000
G1 X132.94 Y90 E.07117
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9670.66
G1 X130.94 Y90 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/40
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z2 I.007 J-1.217 P1  F42000
G1 X46.636 Y89.484 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4587
M204 S6000
G1 X62.44 Y88.102 E.52628
G1 X134.898 Y88.102 E2.40355
G1 X134.898 Y91.898 E.12592
G1 X61.942 Y91.898 E2.42007
G1 X46.518 Y90.548 E.5136
G3 X45.875 Y90.707 I-.564 J-.901 E.02237
G3 X46.524 Y89.494 I.135 J-.708 E.08958
G1 X46.576 Y89.489 E.00171
M204 S10000
G1 X46.632 Y89.091 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4587
M204 S5000
G1 X62.423 Y87.71 E.48706
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.589 Y90.948 E.47305
G3 X46.582 Y89.058 I-.586 J-.943 E.14489
; WIPE_START
G1 F9547.055
M204 S6000
G1 X48.575 Y88.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X46.496 Y89.861 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38003
G1 F4587
M204 S6000
G1 X46.426 Y89.861 E.00191
; LINE_WIDTH: 0.41337
G1 X46.357 Y89.861 E.0021
; LINE_WIDTH: 0.44869
G1 X46.236 Y89.823 E.00419
; LINE_WIDTH: 0.48599
G1 X46.115 Y89.784 E.00458
; LINE_WIDTH: 0.539227
G1 X45.995 Y89.746 E.00513
G1 X45.802 Y89.834 E.00858
G1 X45.742 Y90 E.00712
G1 X45.802 Y90.166 E.00713
G1 X45.954 Y90.254 E.00712
; LINE_WIDTH: 0.51957
G1 X46.082 Y90.236 E.005
; LINE_WIDTH: 0.47479
G1 X46.209 Y90.218 E.00453
; LINE_WIDTH: 0.43001
G1 X46.337 Y90.199 E.00406
; LINE_WIDTH: 0.3809
G3 X46.496 Y90.181 I.156 J.637 E.00442
; LINE_WIDTH: 0.377518
G1 X48.27 Y90.322 E.04852
; LINE_WIDTH: 0.413208
G3 X50.526 Y90.505 I-10.389 J141.849 E.06829
G1 X50.526 Y89.537 E.02919
G1 X50.044 Y89.58 E.0146
; LINE_WIDTH: 0.405833
G1 X48.3 Y89.718 E.05174
; LINE_WIDTH: 0.377518
M73 P63 R4
G1 X46.556 Y89.857 E.0477
M204 S10000
G1 X50.146 Y90.021 F42000
; LINE_WIDTH: 0.5524
G1 F4587
M204 S6000
G3 X50.054 Y89.966 I-.06 J-.004 E.01023
M204 S10000
G1 X53.513 Y90.81 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4587
M204 S6000
G1 X51.891 Y90.668 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4587
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F4587
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.345 Y88.45 E.10644
G1 X126.716 Y88.45 E.05401
M204 S10000
G1 X134.506 Y91.506 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4587
M204 S6000
G1 X134.506 Y88.494 E.09254
G1 X128.741 Y88.494 E.17713
G1 X128.741 Y91.506 E.09254
G1 X134.446 Y91.506 E.17528
M204 S10000
G1 X134.129 Y91.129 F42000
G1 F4587
M204 S6000
G1 X134.129 Y88.871 E.06937
G1 X129.118 Y88.871 E.15395
G1 X129.118 Y91.129 E.06937
G1 X134.069 Y91.129 E.15211
M204 S10000
G1 X133.752 Y90.752 F42000
G1 F4587
M204 S6000
G1 X133.752 Y89.248 E.0462
G1 X129.495 Y89.248 E.13078
G1 X129.495 Y90.752 E.0462
G1 X133.692 Y90.752 E.12894
M204 S10000
G1 X133.375 Y90.375 F42000
G1 F4587
M204 S6000
G1 X133.375 Y89.625 E.02302
G1 X129.873 Y89.625 E.10761
G1 X129.873 Y90.375 E.02302
G1 X133.315 Y90.375 E.10577
M204 S10000
G1 X130.247 Y90 F42000
; LINE_WIDTH: 0.41518
G1 F4587
M204 S6000
G1 X132.94 Y90 E.08169
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9670.66
G1 X130.94 Y90 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/40
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z2.2 I.007 J-1.217 P1  F42000
G1 X46.431 Y89.502 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5059
M204 S6000
G1 X62.44 Y88.102 E.53308
G1 X129.139 Y88.102 E2.21253
G1 X129.139 Y91.898 E.12592
G1 X61.942 Y91.898 E2.22905
G1 X47.028 Y90.592 E.49663
G1 X47.028 Y90.333 E.00861
G1 X46.103 Y90.581 E.03176
G3 X46.339 Y89.51 I-.094 J-.582 E.07619
G1 X46.371 Y89.507 E.00107
; WIPE_START
G1 F8843.478
G1 X48.364 Y89.333 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.993 Y89.565 Z2.4 F42000
G1 X132.861 Y91.898 Z2.4
G1 Z2
G1 E.8 F1800
G1 F5059
M204 S6000
G1 X132.861 Y88.102 E.12592
G1 X134.898 Y88.102 E.06758
G1 X134.898 Y91.898 E.12592
G1 X132.921 Y91.898 E.06559
; WIPE_START
G1 F8843.478
G1 X132.889 Y89.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.257 Y89.828 Z2.4 F42000
G1 X46.542 Y89.099 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5059
M204 S5000
G1 X62.423 Y87.71 E.48984
G1 X135.29 Y87.71 E2.23899
G1 X135.29 Y92.29 E.14073
G1 X61.925 Y92.29 E2.25429
G1 X46.636 Y90.952 E.4716
G1 X46.636 Y90.844 E.00331
G1 X46.171 Y90.968 E.01478
G3 X46.41 Y89.11 I-.171 J-.966 E.11303
G1 X46.482 Y89.104 E.00224
; WIPE_START
G1 F9547.055
M204 S6000
G1 X48.475 Y88.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P64 R4
G1 Z2.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X48.763 Y89.692 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5059
M204 S6000
G1 X48.764 Y90.192 E.01537
G1 X48.738 Y90.348 E.00488
G1 X51.272 Y90.57 E.07817
G1 X51.272 Y89.472 E.03374
G1 X48.823 Y89.686 E.07554
M204 S10000
G1 X49.111 Y90.008 F42000
; LINE_WIDTH: 0.35751
G1 F5059
M204 S6000
G1 X49.124 Y90.035 E.00076
G1 X50.926 Y90.193 E.04637
G1 X50.926 Y89.85 E.0088
G1 X49.171 Y90.003 E.04517
M204 S10000
G1 X48.559 Y90.113 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5059
M204 S2000
G1 X48.201 Y90.472 E.01559
G1 X47.71 Y90.429
G1 X48.559 Y89.58 E.0369
G1 X48.02 Y89.586
G1 X47.25 Y90.356 E.03344
G1 X46.949 Y90.124
G1 X47.435 Y89.637 E.02113
G1 X46.851 Y89.688
G1 X46.22 Y90.319 E.0274
G1 X45.749 Y90.257
G1 X46.281 Y89.726 E.0231
M204 S10000
G1 X45.996 Y89.623 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230434
G1 F5059
M204 S6000
G2 X45.622 Y90.028 I.965 J1.266 E.00846
; WIPE_START
G1 F15000
G1 X45.783 Y89.818 E-.36351
G1 X45.996 Y89.623 E-.39649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.513 Y90.81 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5059
M204 S6000
G1 X51.891 Y90.669 E.05401
G1 X52.246 Y89.343 E.04552
G1 X54.596 Y89.138 E.07823
G1 X56.533 Y91.075 E.09088
G1 X61.958 Y91.55 E.18063
G1 X64.298 Y91.55 E.07765
G1 X65.129 Y88.45 E.10644
G1 X71.179 Y88.45 E.20071
G1 X74.279 Y91.55 E.1454
G1 X76.942 Y91.55 E.08833
G1 X77.772 Y88.45 E.10644
G1 X79.4 Y88.45 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F5059
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X87.956 Y91.55 F42000
G1 F5059
M204 S6000
G1 X89.585 Y91.55 E.05401
G1 X90.415 Y88.45 E.10644
G1 X88.45 Y88.45 E.06518
G1 X91.55 Y91.55 E.1454
G1 X102.228 Y91.55 E.35422
G1 X103.058 Y88.45 E.10644
G1 X105.721 Y88.45 E.08833
G1 X108.821 Y91.55 E.1454
G1 X114.871 Y91.55 E.20071
G1 X115.702 Y88.45 E.10644
G1 X122.992 Y88.45 E.24184
G1 X126.092 Y91.55 E.1454
G1 X127.514 Y91.55 E.0472
G1 X128.099 Y89.367 E.07496
G1 X128.099 Y88.45 E.0304
G1 X127.387 Y88.45 E.02361
M204 S10000
G1 X128.778 Y91.536 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.35953
G1 F5059
M204 S6000
G1 X128.778 Y88.464 E.07926
G1 X128.461 Y88.464 E.00817
G1 X128.461 Y91.536 E.07926
G1 X128.718 Y91.536 E.00662
; WIPE_START
G1 F11370.457
G1 X128.461 Y91.536 E-.09752
G1 X128.461 Y89.793 E-.66248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.911 Y92.083 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5059
M204 S2000
G1 X132.638 Y91.356 E.03159
G1 X132.638 Y90.822
G1 X131.378 Y92.083 E.05477
G1 X130.845 Y92.083
G1 X132.638 Y90.289 E.07794
G1 X132.638 Y89.756
G1 X130.311 Y92.083 E.10111
G1 X129.778 Y92.083
G1 X132.638 Y89.223 E.12428
G1 X132.638 Y88.689
G1 X129.362 Y91.966 E.14237
G1 X129.362 Y91.432
G1 X132.638 Y88.156 E.14237
G1 X132.344 Y87.917
G1 X129.362 Y90.899 E.12957
G1 X129.362 Y90.366
G1 X131.81 Y87.917 E.10639
M73 P65 R4
G1 X131.277 Y87.917
G1 X129.362 Y89.832 E.08322
G1 X129.362 Y89.299
G1 X130.744 Y87.917 E.06005
G1 X130.21 Y87.917
G1 X129.362 Y88.766 E.03688
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.21 Y87.917 E-.45603
G1 X130.744 Y87.917 E-.20264
G1 X130.555 Y88.106 E-.10134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.253 Y91.506 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F5059
M204 S6000
G1 X134.506 Y91.506 E.03851
G1 X134.506 Y88.494 E.09254
G1 X133.253 Y88.494 E.03851
G1 X133.253 Y91.446 E.0907
M204 S10000
G1 X133.66 Y91.098 F42000
; LINE_WIDTH: 0.48099
G1 F5059
M204 S6000
G1 X134.098 Y91.098 E.01564
G1 X134.098 Y88.902 E.07841
G1 X133.66 Y88.902 E.01564
G1 X133.66 Y91.038 E.07627
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8217.865
G1 X133.66 Y89.038 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/40
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z2.4 I-.009 J-1.217 P1  F42000
G1 X46.26 Y89.692 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5000
M204 S6000
G1 X46.313 Y89.736 E.0023
G3 X46 Y89.591 I-.312 J.263 E.07323
G1 X46.071 Y89.597 E.00238
G3 X46.205 Y89.646 I-.07 J.402 E.00474
G1 X46.214 Y89.653 E.00039
M204 S10000
G1 X46.512 Y89.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5000
M204 S5000
G3 X45.726 Y89.246 I-.518 J.61 E.12876
G3 X46.035 Y89.201 I.281 J.846 E.00966
G3 X46.465 Y89.353 I-.042 J.799 E.0142
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.615 Y89.484 E-.07555
G1 X46.695 Y89.599 E-.05319
G1 X46.754 Y89.726 E-.05321
G1 X46.791 Y89.861 E-.05324
G1 X46.802 Y90 E-.05309
G1 X46.791 Y90.139 E-.05311
G1 X46.754 Y90.274 E-.05317
G1 X46.695 Y90.401 E-.05326
G1 X46.615 Y90.516 E-.0532
G1 X46.516 Y90.615 E-.05293
G1 X46.401 Y90.695 E-.05319
G1 X46.274 Y90.754 E-.05328
G1 X46.139 Y90.791 E-.05316
G1 X46.017 Y90.791 E-.0464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.646 Y90.545 Z2.6 F42000
G1 X129.615 Y88.102 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5000
M204 S6000
G1 X129.615 Y91.898 E.12592
G1 X61.942 Y91.898 E2.24483
G1 X48.997 Y90.765 E.43107
G1 X48.997 Y89.278 E.04933
G1 X62.44 Y88.102 E.44765
G1 X129.555 Y88.102 E2.22632
M204 S10000
G1 X130.007 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5000
M204 S5000
G1 X130.007 Y92.29 E.14073
G1 X61.925 Y92.29 E2.09197
G1 X47.382 Y91.017 E.44857
G1 X47.382 Y89.025 E.0612
G1 X62.423 Y87.71 E.46393
G1 X129.947 Y87.71 E2.07482
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.973 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X129.223 Y91.506 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F5000
M204 S6000
G1 X129.223 Y88.494 E.09254
G1 X128.288 Y88.494 E.02872
G1 X128.288 Y91.506 E.09254
G1 X129.163 Y91.506 E.02688
M204 S10000
G1 X128.756 Y91.039 F42000
; LINE_WIDTH: 0.60052
G1 F5000
M204 S6000
G1 X128.756 Y89.021 E.09165
M204 S10000
G1 X127.896 Y88.495 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5000
M204 S6000
G1 X127.896 Y90.124 E.05401
G1 X127.514 Y91.55 E.04897
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X97.412 Y88.45 F42000
G1 F5000
M204 S6000
G1 X95.784 Y88.45 E.05401
G1 X84.217 Y91.55 E.39723
G1 X82.588 Y91.55 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F5000
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
G1 X56.533 Y91.075 E.18063
G1 X54.596 Y89.138 E.09088
G1 X56.218 Y88.996 E.05401
M204 S10000
G1 X52.019 Y90.021 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
M73 P66 R4
G1 F5000
M204 S6000
G1 X52.019 Y89.407 E.01888
G1 X49.389 Y89.637 E.08112
G1 X49.389 Y90.405 E.02362
G1 X52.019 Y90.636 E.08112
G1 X52.019 Y90.081 E.01704
M204 S10000
G1 X49.765 Y89.981 F42000
; LINE_WIDTH: 0.41737
G1 F5000
M204 S6000
G1 X49.765 Y90.061 E.00244
G1 X51.643 Y90.226 E.05753
G1 X51.643 Y89.817 E.01247
G1 X49.824 Y89.976 E.0557
; WIPE_START
G1 F9614.1
G1 X51.643 Y89.817 E-.6937
G1 X51.643 Y89.991 E-.0663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.354 Y89.148 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5000
M204 S2000
G1 X48.774 Y89.569 E.01826
G1 X48.774 Y90.102
G1 X47.864 Y89.191 E.03956
G1 X47.59 Y89.451
G1 X48.774 Y90.635 E.05147
G1 X48.514 Y90.908
G1 X47.59 Y89.984 E.04015
; WIPE_START
G1 F9547.055
M204 S6000
G1 X48.514 Y90.908 E-.49659
G1 X48.774 Y90.635 E-.14333
G1 X48.551 Y90.412 E-.12009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.18 Y90.201 Z2.6 F42000
G1 X132.385 Y88.102 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5000
M204 S6000
G1 X134.898 Y88.102 E.08336
G1 X134.898 Y91.898 E.12592
G1 X132.385 Y91.898 E.08336
G1 X132.385 Y88.162 E.12393
M204 S10000
G1 X131.993 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5000
M204 S5000
G1 X135.29 Y87.71 E.10131
G1 X135.29 Y92.29 E.14073
G1 X131.993 Y92.29 E.10131
G1 X131.993 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.992 Y87.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.641 Y90.641 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64062
G1 F5000
M204 S6000
G1 X133.641 Y89.419 E.05956
M204 S10000
G1 X133.154 Y91.129 F42000
; LINE_WIDTH: 0.41999
G1 F5000
M204 S6000
G1 X134.129 Y91.129 E.02995
G1 X134.129 Y88.871 E.06937
G1 X133.154 Y88.871 E.02995
G1 X133.154 Y91.069 E.06753
M204 S10000
G1 X132.777 Y91.506 F42000
G1 F5000
M204 S6000
G1 X134.506 Y91.506 E.05312
G1 X134.506 Y88.494 E.09254
G1 X132.777 Y88.494 E.05312
G1 X132.777 Y91.446 E.0907
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X132.777 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/40
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z2.6 I-.005 J-1.217 P1  F42000
G1 X46.505 Y89.816 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4609
M204 S5000
G3 X46 Y89.463 I-.504 J.183 E.08335
G1 X46.093 Y89.471 E.00286
G3 X46.481 Y89.761 I-.091 J.528 E.01546
; WIPE_START
G1 F9547.055
M204 S6000
G1 X46.529 Y89.907 E-.05838
G1 X46.529 Y90.093 E-.07094
G1 X46.466 Y90.269 E-.07082
G1 X46.412 Y90.345 E-.03555
G1 X46.269 Y90.466 E-.07116
G1 X46.093 Y90.529 E-.07083
G1 X45.907 Y90.529 E-.07097
G1 X45.732 Y90.466 E-.07079
G1 X45.655 Y90.412 E-.03555
G1 X45.534 Y90.269 E-.07116
G1 X45.471 Y90.093 E-.07082
G1 X45.471 Y89.927 E-.06303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X46.235 Y89.771 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F4609
M204 S2000
G1 X45.771 Y90.235 E.02015
M204 S10000
G1 X46.346 Y89.983 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.183786
G1 F4609
M204 S6000
G3 X45.983 Y90.346 I-.802 J-.439 E.00598
M204 S10000
G1 X46.024 Y89.654 F42000
; LINE_WIDTH: 0.192617
G1 F4609
M204 S6000
G2 X45.654 Y90.024 I.441 J.811 E.00647
; WIPE_START
G1 F15000
G1 X45.829 Y89.795 E-.41386
G1 X46.024 Y89.654 E-.34614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.655 Y89.512 Z2.8 F42000
G1 X129.124 Y88.102 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X129.124 Y91.898 E.12592
G1 X61.942 Y91.898 E2.22852
G1 X49.743 Y90.83 E.40621
G1 X49.743 Y89.212 E.05366
G1 X62.44 Y88.102 E.42279
G1 X129.064 Y88.102 E2.21001
M204 S10000
G1 X129.516 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4609
M204 S5000
G1 X129.516 Y92.29 E.14073
G1 X61.925 Y92.29 E2.07686
G1 X48.129 Y91.082 E.42554
G1 X48.129 Y88.96 E.06522
G1 X62.423 Y87.71 E.4409
G1 X129.456 Y87.71 E2.05972
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.482 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.683 Y88.779 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51663
G1 F4609
M204 S6000
G1 X128.683 Y88.542 E.00914
G1 X128.209 Y88.542 E.01829
G1 X128.209 Y91.458 E.11253
G1 X128.683 Y91.458 E.01829
G1 X128.683 Y88.839 E.10107
M204 S10000
G1 X127.769 Y88.97 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X127.769 Y90.599 E.05401
G1 X127.514 Y91.55 E.03266
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4609
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F4609
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
G1 X56.533 Y91.075 E.18063
M73 P67 R4
G1 X54.596 Y89.138 E.09088
G1 X56.218 Y88.996 E.05401
M204 S10000
G1 X50.135 Y89.572 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4609
M204 S6000
G1 X50.135 Y90.471 E.02763
G1 X52.765 Y90.701 E.08112
G1 X52.765 Y89.342 E.04177
G1 X50.195 Y89.566 E.07927
M204 S10000
G1 X52.124 Y89.805 F42000
; LINE_WIDTH: 0.455194
G1 F4609
M204 S6000
G1 X51.62 Y89.827 E.01693
; LINE_WIDTH: 0.41114
G1 X51.116 Y89.849 E.01512
; LINE_WIDTH: 0.355556
G2 X50.475 Y89.883 I.068 J7.349 E.01637
G1 X50.475 Y90.16 E.00705
G1 X50.613 Y90.172 E.00353
; LINE_WIDTH: 0.367087
G1 X51.116 Y90.194 E.01331
; LINE_WIDTH: 0.41114
G1 X51.62 Y90.216 E.01512
; LINE_WIDTH: 0.469244
G3 X52.36 Y90.258 I-.118 J8.481 E.02574
G1 X52.36 Y89.784 E.01646
G1 X52.183 Y89.8 E.00615
; WIPE_START
G1 F8444.282
G1 X52.36 Y89.784 E-.09663
G1 X52.36 Y90.258 E-.25881
G1 X51.62 Y90.216 E-.40456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X48.806 Y90.933 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4609
M204 S2000
G1 X49.521 Y90.218 E.03108
G1 X49.521 Y89.685
G1 X48.336 Y90.869 E.05147
G1 X48.336 Y90.336
G1 X49.521 Y89.152 E.05147
G1 X49.052 Y89.087
G1 X48.336 Y89.803 E.03109
; WIPE_START
G1 F9547.055
M204 S6000
G1 X49.052 Y89.087 E-.3845
G1 X49.521 Y89.152 E-.17989
G1 X49.157 Y89.516 E-.19561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.788 Y89.387 Z2.8 F42000
G1 X132.876 Y88.102 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4609
M204 S6000
G1 X134.898 Y88.102 E.06706
G1 X134.898 Y91.898 E.12592
G1 X132.876 Y91.898 E.06706
G1 X132.876 Y88.162 E.12393
M204 S10000
G1 X132.484 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4609
M204 S5000
G1 X135.29 Y87.71 E.08621
G1 X135.29 Y92.29 E.14073
G1 X132.484 Y92.29 E.08621
G1 X132.484 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.484 Y87.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.269 Y91.506 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4609
M204 S6000
G1 X134.506 Y91.506 E.03802
G1 X134.506 Y88.494 E.09254
G1 X133.269 Y88.494 E.03802
G1 X133.269 Y91.446 E.0907
M204 S10000
G1 X133.672 Y91.102 F42000
; LINE_WIDTH: 0.47306
G1 F4609
M204 S6000
G1 X134.102 Y91.102 E.01508
G1 X134.102 Y88.898 E.07727
G1 X133.672 Y88.898 E.01508
G1 X133.672 Y91.042 E.07517
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8369.368
G1 X133.672 Y89.042 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/40
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z2.8 I.23 J-1.195 P1  F42000
G1 X128.777 Y88.102 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4495
M204 S6000
G1 X128.777 Y91.898 E.12592
G1 X61.942 Y91.898 E2.21702
G1 X50.49 Y90.895 E.38135
G1 X50.49 Y89.147 E.058
G1 X62.44 Y88.102 E.39793
G1 X128.717 Y88.102 E2.19851
M204 S10000
G1 X129.169 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4495
M204 S5000
G1 X129.169 Y92.29 E.14073
G1 X61.925 Y92.29 E2.06621
G1 X48.876 Y91.148 E.40251
G1 X48.876 Y88.895 E.06923
G1 X62.423 Y87.71 E.41787
G1 X129.109 Y87.71 E2.04907
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.135 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X126.716 Y88.45 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4495
M204 S6000
G1 X128.345 Y88.45 E.05401
G1 X127.514 Y91.55 E.10644
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4495
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F4495
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
M73 P68 R4
G1 X56.533 Y91.075 E.18063
G1 X54.596 Y89.138 E.09088
G1 X56.218 Y88.996 E.05401
M204 S10000
G1 X50.882 Y89.506 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4495
M204 S6000
G1 X50.882 Y90.536 E.03164
G1 X53.512 Y90.766 E.08112
G1 X53.512 Y89.276 E.04578
G1 X50.942 Y89.501 E.07927
M204 S10000
G1 X51.318 Y89.905 F42000
; LINE_WIDTH: 0.53708
G1 F4495
M204 S6000
G1 X51.318 Y90.137 E.00932
G1 X53.076 Y90.291 E.07109
G1 X53.076 Y89.752 E.02172
G1 X51.377 Y89.9 E.06867
; WIPE_START
G1 F7285.09
G1 X53.076 Y89.752 E-.64804
G1 X53.076 Y90.046 E-.11196
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X49.825 Y89.02 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4495
M204 S2000
G1 X50.267 Y89.462 E.01921
G1 X50.267 Y89.995
G1 X49.335 Y89.063 E.04052
G1 X49.083 Y89.344
G1 X50.267 Y90.528 E.05147
G1 X50.267 Y91.061
G1 X49.083 Y89.877 E.05145
G1 X49.083 Y90.41
G1 X49.683 Y91.01 E.02606
; WIPE_START
G1 F9547.055
M204 S6000
G1 X49.083 Y90.41 E-.32227
G1 X49.083 Y89.877 E-.20264
G1 X49.52 Y90.315 E-.23509
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.15 Y90.113 Z3 F42000
G1 X133.223 Y88.102 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4495
M204 S6000
G1 X134.898 Y88.102 E.05556
G1 X134.898 Y91.898 E.12592
G1 X133.223 Y91.898 E.05556
G1 X133.223 Y88.162 E.12393
M204 S10000
G1 X132.831 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4495
M204 S5000
G1 X135.29 Y87.71 E.07556
G1 X135.29 Y92.29 E.14073
G1 X132.831 Y92.29 E.07556
G1 X132.831 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X134.83 Y87.721 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.615 Y91.506 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4495
M204 S6000
G1 X134.506 Y91.506 E.02737
G1 X134.506 Y88.494 E.09254
G1 X133.615 Y88.494 E.02737
G1 X133.615 Y91.446 E.0907
M204 S10000
G1 X134.061 Y91.061 F42000
; LINE_WIDTH: 0.55652
G1 F4495
M204 S6000
G1 X134.061 Y88.999 E.08626
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7009.346
G1 X134.061 Y90.999 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/40
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z3 I.564 J-1.078 P1  F42000
G1 X128.527 Y88.102 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4424
M204 S6000
G1 X128.527 Y91.898 E.12592
G1 X61.942 Y91.898 E2.20873
G1 X51.237 Y90.961 E.35649
G1 X51.237 Y89.082 E.06233
G1 X62.44 Y88.102 E.37307
G1 X128.467 Y88.102 E2.19022
M204 S10000
G1 X128.919 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4424
M204 S5000
G1 X128.919 Y92.29 E.14073
G1 X61.925 Y92.29 E2.05853
G1 X49.622 Y91.213 E.37949
G1 X49.622 Y88.829 E.07325
G1 X62.423 Y87.71 E.39484
G1 X128.859 Y87.71 E2.04138
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.885 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.171 Y88.45 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4424
M204 S6000
G1 X128.179 Y88.45 E.03343
G1 X128.179 Y89.071 E.02059
G1 X127.514 Y91.55 E.08512
G1 X126.092 Y91.55 E.0472
M73 P69 R4
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4424
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.784 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F4424
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
G1 X56.533 Y91.075 E.18063
G1 X54.65 Y89.192 E.08831
G1 X54.65 Y89.133 E.00197
G1 X56.213 Y88.996 E.05204
M204 S10000
G1 X51.629 Y89.441 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4424
M204 S6000
G1 X51.629 Y90.602 E.03566
G1 X54.258 Y90.832 E.08112
G1 X54.258 Y89.211 E.0498
G1 X51.688 Y89.436 E.07927
M204 S10000
G1 X53.492 Y89.745 F42000
; LINE_WIDTH: 0.578724
G1 F4424
M204 S6000
G1 X53.075 Y89.764 E.0182
; LINE_WIDTH: 0.54229
G1 X52.659 Y89.782 E.01696
; LINE_WIDTH: 0.493804
G2 X52.039 Y89.818 I.1 J7.096 E.0228
G1 X52.039 Y90.225 E.01497
G1 X52.242 Y90.243 E.00749
; LINE_WIDTH: 0.505857
G1 X52.659 Y90.261 E.01572
; LINE_WIDTH: 0.54229
G1 X53.075 Y90.279 E.01696
; LINE_WIDTH: 0.592092
G3 X53.793 Y90.324 I-.15 J8.227 E.03218
G1 X53.793 Y89.719 E.02706
G1 X53.552 Y89.74 E.01084
; WIPE_START
G1 F6555.333
G1 X53.793 Y89.719 E-.11759
G1 X53.793 Y90.324 E-.29345
G1 X53.075 Y90.279 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.277 Y91.062 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4424
M204 S2000
G1 X51.014 Y90.325 E.03204
G1 X51.014 Y89.791
G1 X49.83 Y90.976 E.05147
G1 X49.83 Y90.443
G1 X51.014 Y89.258 E.05147
G1 X50.805 Y88.934
G1 X49.83 Y89.909 E.04238
G1 X49.83 Y89.376
G1 X50.221 Y88.985 E.01699
; WIPE_START
G1 F9547.055
M204 S6000
G1 X49.83 Y89.376 E-.21013
G1 X49.83 Y89.909 E-.20264
G1 X50.476 Y89.263 E-.34723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X58.107 Y89.157 Z3.2 F42000
G1 X133.473 Y88.102 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4424
M204 S6000
G1 X134.898 Y88.102 E.04726
G1 X134.898 Y91.898 E.12592
G1 X133.473 Y91.898 E.04726
M73 P70 R4
G1 X133.473 Y88.162 E.12393
M204 S10000
G1 X133.081 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4424
M204 S5000
G1 X135.29 Y87.71 E.06787
G1 X135.29 Y92.29 E.14073
G1 X133.081 Y92.29 E.06787
G1 X133.081 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.08 Y87.716 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.931 Y91.44 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55173
G1 F4424
M204 S6000
G1 X134.44 Y91.44 E.0211
G1 X134.44 Y88.56 E.11941
G1 X133.931 Y88.56 E.0211
G1 X133.931 Y91.38 E.11692
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7075.333
G1 X133.931 Y89.38 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/40
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z3.2 I.27 J-1.187 P1  F42000
G1 X128.324 Y88.102 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4361
M204 S6000
G1 X128.324 Y91.898 E.12592
G1 X61.942 Y91.898 E2.202
G1 X51.983 Y91.026 E.33163
G1 X51.983 Y89.016 E.06667
G1 X62.44 Y88.102 E.34821
G1 X128.264 Y88.102 E2.18349
M204 S10000
G1 X128.716 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4361
M204 S5000
G1 X128.716 Y92.29 E.14073
G1 X61.925 Y92.29 E2.05229
G1 X50.369 Y91.278 E.35646
G1 X50.369 Y88.764 E.07726
G1 X62.423 Y87.71 E.37181
G1 X128.656 Y87.71 E2.03515
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.682 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.725 Y88.45 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4361
M204 S6000
G1 X127.976 Y88.45 E.00832
G1 X127.976 Y89.828 E.04569
G1 X127.514 Y91.55 E.05913
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X97.412 Y88.45 F42000
G1 F4361
M204 S6000
G1 X95.784 Y88.45 E.05401
G1 X84.217 Y91.55 E.39723
G1 X82.588 Y91.55 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F4361
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
G1 X56.533 Y91.075 E.18063
G1 X55.397 Y89.939 E.05329
M73 P70 R3
G1 X55.397 Y89.068 E.0289
G1 X56.151 Y89.002 E.02511
M204 S10000
G1 X55.005 Y89.146 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4361
M204 S6000
G1 X52.375 Y89.376 E.08112
G1 X52.375 Y90.667 E.03967
G1 X55.005 Y90.897 E.08112
G1 X55.005 Y89.206 E.05197
M204 S10000
G1 X53.528 Y89.653 F42000
; LINE_WIDTH: 0.443145
G1 F4361
M204 S6000
G1 X53.371 Y89.69 E.00526
; LINE_WIDTH: 0.489455
G1 X53.214 Y89.727 E.00587
; LINE_WIDTH: 0.554629
G3 X52.822 Y89.785 I-.395 J-1.326 E.0166
G1 X52.822 Y90.258 E.01972
; LINE_WIDTH: 0.562435
G1 X53.138 Y90.282 E.01342
; LINE_WIDTH: 0.541624
G1 X53.268 Y90.318 E.00549
; LINE_WIDTH: 0.49297
G1 X53.398 Y90.353 E.00495
; LINE_WIDTH: 0.421013
G1 X53.528 Y90.389 E.00416
G1 X54.628 Y90.486 E.03401
G1 X54.628 Y89.557 E.0286
G1 X53.588 Y89.648 E.03216
M204 S10000
G1 X53.561 Y90.021 F42000
; LINE_WIDTH: 0.423237
G1 F4361
M204 S6000
M73 P71 R3
G1 X53.755 Y90.021 E.00601
; LINE_WIDTH: 0.46055
G1 X53.949 Y90.021 E.0066
; LINE_WIDTH: 0.497864
G1 X54.143 Y90.021 E.00719
; WIPE_START
G1 F7913.074
G1 X53.949 Y90.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.761 Y89.355 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4361
M204 S2000
G1 X51.296 Y88.891 E.02017
G1 X50.806 Y88.934
G1 X51.761 Y89.889 E.04148
G1 X51.761 Y90.422
G1 X50.576 Y89.237 E.05147
G1 X50.576 Y89.771
G1 X51.761 Y90.955 E.05147
G1 X51.436 Y91.164
G1 X50.576 Y90.304 E.03736
; WIPE_START
G1 F9547.055
M204 S6000
G1 X51.436 Y91.164 E-.46202
G1 X51.761 Y90.955 E-.14665
G1 X51.479 Y90.674 E-.15132
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X59.108 Y90.435 Z3.4 F42000
G1 X133.676 Y88.102 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4361
M204 S6000
G1 X134.898 Y88.102 E.04053
G1 X134.898 Y91.898 E.12592
G1 X133.676 Y91.898 E.04053
G1 X133.676 Y88.162 E.12393
M204 S10000
G1 X133.284 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4361
M204 S5000
G1 X135.29 Y87.71 E.06164
G1 X135.29 Y92.29 E.14073
G1 X133.284 Y92.29 E.06164
G1 X133.284 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.283 Y87.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.083 Y91.491 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45033
G1 F4361
M204 S6000
G1 X134.491 Y91.491 E.01353
G1 X134.491 Y88.509 E.09898
G1 X134.083 Y88.509 E.01353
G1 X134.083 Y91.431 E.09699
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8836.307
G1 X134.083 Y89.431 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/40
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z3.4 I.268 J-1.187 P1  F42000
G1 X128.197 Y88.102 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4325
M204 S6000
G1 X128.197 Y91.898 E.12592
G1 X61.942 Y91.898 E2.19778
G1 X52.73 Y91.091 E.30677
G1 X52.73 Y88.951 E.071
G1 X62.44 Y88.102 E.32335
G1 X128.137 Y88.102 E2.17927
M204 S10000
G1 X128.589 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4325
M204 S5000
G1 X128.589 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04838
G1 X51.115 Y91.344 E.33343
G1 X51.115 Y88.699 E.08127
G1 X62.423 Y87.71 E.34879
G1 X128.529 Y87.71 E2.03124
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.555 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.848 Y88.674 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4325
M204 S6000
G1 X127.848 Y90.303 E.05401
G1 X127.514 Y91.55 E.04282
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X100.6 Y91.55 E.05401
M204 S10000
G1 X97.412 Y88.45 F42000
G1 F4325
M204 S6000
G1 X95.783 Y88.45 E.05401
G1 X84.217 Y91.55 E.39723
G1 X82.588 Y91.55 E.05401
M204 S10000
G1 X92.044 Y88.45 F42000
G1 F4325
M204 S6000
G1 X90.415 Y88.45 E.05401
G1 X89.585 Y91.55 E.10644
G1 X91.55 Y91.55 E.06518
G1 X88.45 Y88.45 E.1454
G1 X77.772 Y88.45 E.35422
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X61.958 Y91.55 E.07765
G1 X56.533 Y91.075 E.18063
G1 X56.144 Y90.685 E.01827
G1 X56.144 Y89.057 E.05401
M204 S10000
G1 X55.752 Y90.021 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4325
M204 S6000
G1 X55.752 Y89.08 E.02891
G1 X53.122 Y89.31 E.08112
G1 X53.122 Y90.732 E.04369
G1 X55.752 Y90.962 E.08112
G1 X55.752 Y90.081 E.02707
M204 S10000
G1 X55.375 Y90.021 F42000
G1 F4325
M204 S6000
G1 X55.375 Y89.492 E.01627
G1 X53.499 Y89.656 E.05786
G1 X53.499 Y90.387 E.02245
G1 X55.375 Y90.551 E.05786
G1 X55.375 Y90.081 E.01443
M204 S10000
M73 P72 R3
G1 X53.898 Y90.021 F42000
; LINE_WIDTH: 0.48497
G1 F4325
M204 S6000
G1 X54.131 Y90.021 E.00839
; LINE_WIDTH: 0.52819
G1 X54.364 Y90.021 E.00921
; LINE_WIDTH: 0.57141
G1 X54.596 Y90.021 E.01003
; LINE_WIDTH: 0.61463
G1 X54.829 Y90.021 E.01085
; WIPE_START
G1 F6296.899
G1 X54.596 Y90.021 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X52.507 Y90.431 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4325
M204 S2000
G1 X51.748 Y91.191 E.03301
G1 X51.323 Y91.083
G1 X52.507 Y89.898 E.05147
G1 X52.507 Y89.365
G1 X51.323 Y90.549 E.05147
G1 X51.323 Y90.016
G1 X52.507 Y88.832 E.05147
G1 X51.974 Y88.832
G1 X51.323 Y89.483 E.02828
; WIPE_START
G1 F9547.055
M204 S6000
G1 X51.974 Y88.832 E-.34979
G1 X52.507 Y88.832 E-.20276
G1 X52.121 Y89.218 E-.20744
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X59.753 Y89.113 Z3.6 F42000
G1 X133.803 Y88.102 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4325
M204 S6000
G1 X134.898 Y88.102 E.03631
G1 X134.898 Y91.898 E.12592
G1 X133.803 Y91.898 E.03631
G1 X133.803 Y88.162 E.12393
M204 S10000
G1 X133.411 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4325
M204 S5000
G1 X135.29 Y87.71 E.05773
G1 X135.29 Y92.29 E.14073
G1 X133.411 Y92.29 E.05773
G1 X133.411 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.29 Y87.71 E-.7143
G1 X135.29 Y87.83 E-.0457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.179 Y91.523 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38671
G1 F4325
M204 S6000
G1 X134.523 Y91.523 E.00963
G1 X134.523 Y88.477 E.08531
G1 X134.179 Y88.477 E.00963
G1 X134.179 Y91.463 E.08362
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10471.509
G1 X134.179 Y89.463 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/40
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z3.6 I.265 J-1.188 P1  F42000
G1 X128.069 Y88.102 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X128.069 Y91.898 E.12592
G1 X61.942 Y91.898 E2.19356
G1 X53.476 Y91.157 E.2819
G1 X53.476 Y88.886 E.07533
G1 X62.44 Y88.102 E.29849
G1 X128.009 Y88.102 E2.17505
M204 S10000
G1 X128.462 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4255
M204 S5000
G1 X128.462 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04448
G1 X51.862 Y91.409 E.3104
G1 X51.862 Y88.633 E.08529
G1 X62.423 Y87.71 E.32576
G1 X128.402 Y87.71 E2.02733
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.428 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.721 Y89.149 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X127.721 Y90.778 E.05401
G1 X127.514 Y91.55 E.02652
G1 X126.092 Y91.55 E.0472
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X91.55 Y91.55 E.35422
G1 X88.45 Y88.45 E.1454
G1 X90.415 Y88.45 E.06518
G1 X89.585 Y91.55 E.10644
G1 X87.956 Y91.55 E.05401
M204 S10000
G1 X82.588 Y91.55 F42000
G1 F4255
M204 S6000
G1 X84.217 Y91.55 E.05401
G1 X95.783 Y88.45 E.39723
G1 X97.412 Y88.45 E.05401
M204 S10000
G1 X79.4 Y88.45 F42000
G1 F4255
M204 S6000
G1 X77.772 Y88.45 E.05401
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X62.67 Y91.55 E.05401
M204 S10000
G1 X53.868 Y89.245 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4255
M204 S6000
G1 X53.868 Y90.798 E.0477
G1 X56.498 Y91.028 E.08111
G1 X56.498 Y89.015 E.06184
G1 X53.928 Y89.24 E.07927
M204 S10000
G1 X56.121 Y90.021 F42000
G1 F4255
M204 S6000
G1 X56.121 Y89.427 E.01828
G1 X54.245 Y89.591 E.05785
G1 X54.245 Y90.452 E.02647
G1 X56.121 Y90.616 E.05785
G1 X56.121 Y90.081 E.01643
M204 S10000
G1 X55.754 Y90.021 F42000
; LINE_WIDTH: 0.388542
G1 F4255
M204 S6000
M73 P73 R3
G1 X55.754 Y89.827 E.00548
G1 X55.221 Y89.859 E.01504
; LINE_WIDTH: 0.391147
G1 X55.157 Y89.886 E.00198
; LINE_WIDTH: 0.434
G1 X55.093 Y89.913 E.00222
; LINE_WIDTH: 0.476854
G1 X55.028 Y89.94 E.00247
; LINE_WIDTH: 0.519707
G1 X54.964 Y89.967 E.00271
; LINE_WIDTH: 0.56256
G1 X54.9 Y89.994 E.00295
; LINE_WIDTH: 0.605414
G1 X54.836 Y90.021 E.0032
G1 X54.9 Y90.049 E.0032
; LINE_WIDTH: 0.56256
G1 X54.964 Y90.076 E.00295
; LINE_WIDTH: 0.519707
G1 X55.028 Y90.103 E.00271
; LINE_WIDTH: 0.476854
G1 X55.093 Y90.13 E.00247
; LINE_WIDTH: 0.434
G1 X55.157 Y90.157 E.00222
; LINE_WIDTH: 0.387903
G1 X55.221 Y90.184 E.00196
G1 X55.754 Y90.216 E.01501
G1 X55.754 Y90.081 E.00378
; WIPE_START
G1 F10435.294
G1 X55.754 Y90.216 E-.13849
G1 X55.221 Y90.184 E-.54968
G1 X55.157 Y90.157 E-.07183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.254 Y89.249 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4255
M204 S2000
G1 X52.768 Y88.762 E.02113
G1 X52.277 Y88.805
G1 X53.254 Y89.782 E.04244
G1 X53.254 Y90.315
G1 X52.069 Y89.131 E.05147
G1 X52.069 Y89.664
G1 X53.254 Y90.849 E.05147
G1 X53.189 Y91.317
G1 X52.069 Y90.197 E.04866
G1 X52.069 Y90.731
G1 X52.605 Y91.266 E.02326
; WIPE_START
G1 F9547.055
M204 S6000
G1 X52.069 Y90.731 E-.28771
G1 X52.069 Y90.197 E-.20264
G1 X52.571 Y90.699 E-.26965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X52.148 Y88.798 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.160131
G1 F4255
M204 S6000
G2 X52.14 Y89.061 I.202 J.138 E.00265
; WIPE_START
G1 F15000
G1 X52.105 Y88.977 E-.24611
G1 X52.105 Y88.9 E-.21115
G1 X52.148 Y88.798 E-.30274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X59.78 Y88.733 Z3.8 F42000
G1 X133.931 Y88.102 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4255
M204 S6000
G1 X134.898 Y88.102 E.03209
G1 X134.898 Y91.898 E.12592
G1 X133.931 Y91.898 E.03209
G1 X133.931 Y88.162 E.12393
M204 S10000
G1 X133.538 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4255
M204 S5000
G1 X135.29 Y87.71 E.05382
G1 X135.29 Y92.29 E.14073
G1 X133.538 Y92.29 E.05382
G1 X133.538 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.29 Y87.71 E-.66598
G1 X135.29 Y87.957 E-.09403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.414 Y88.306 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.60325
G1 F4255
M204 S6000
G1 X134.414 Y91.694 E.15473
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6424.786
G1 X134.414 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/40
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z3.8 I.293 J-1.181 P1  F42000
G1 X127.994 Y88.102 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4140
M204 S6000
G1 X127.994 Y91.898 E.12592
G1 X61.942 Y91.898 E2.19107
G1 X54.223 Y91.222 E.25705
G1 X54.223 Y88.821 E.07967
G1 X62.44 Y88.102 E.27363
G1 X127.934 Y88.102 E2.17256
M204 S10000
G1 X128.387 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
M204 S5000
G1 X128.387 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04217
G1 X52.609 Y91.474 E.28737
G1 X52.609 Y88.568 E.0893
G1 X62.423 Y87.71 E.30273
G1 X128.327 Y87.71 E2.02503
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.353 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X124.463 Y91.55 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4140
M204 S6000
G1 X126.092 Y91.55 E.05401
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X100.6 Y91.55 E.05401
M204 S10000
G1 X97.412 Y88.45 F42000
G1 F4140
M204 S6000
G1 X95.783 Y88.45 E.05401
G1 X84.217 Y91.55 E.39723
G1 X82.588 Y91.55 E.05401
M204 S10000
G1 X92.044 Y88.45 F42000
G1 F4140
M204 S6000
G1 X90.415 Y88.45 E.05401
G1 X89.585 Y91.55 E.10644
G1 X91.55 Y91.55 E.06518
G1 X88.45 Y88.45 E.1454
G1 X77.772 Y88.45 E.35422
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X62.67 Y91.55 E.05401
M204 S10000
G1 X54.615 Y89.18 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4140
M204 S6000
G1 X54.615 Y90.863 E.05172
G1 X57.245 Y91.093 E.08111
G1 X57.245 Y88.95 E.06585
G1 X54.675 Y89.175 E.07927
M204 S10000
G1 X54.992 Y89.525 F42000
G1 F4140
M204 S6000
G1 X54.992 Y90.517 E.03048
G1 X56.868 Y90.682 E.05785
G1 X56.868 Y89.361 E.04057
M73 P74 R3
G1 X55.052 Y89.52 E.05601
M204 S10000
G1 X55.389 Y89.889 F42000
; LINE_WIDTH: 0.45928
G1 F4140
M204 S6000
G1 X55.389 Y90.154 E.00899
G1 X56.471 Y90.249 E.03686
G1 X56.471 Y89.794 E.01542
G1 X55.449 Y89.884 E.03482
; WIPE_START
G1 F8646.363
G1 X56.471 Y89.794 E-.39001
G1 X56.471 Y90.249 E-.17267
G1 X55.954 Y90.203 E-.19732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54 Y90.538 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4140
M204 S2000
G1 X53.219 Y91.32 E.03397
G1 X52.816 Y91.189
G1 X54 Y90.005 E.05147
G1 X54 Y89.471
G1 X52.816 Y90.656 E.05147
G1 X52.816 Y90.123
G1 X54 Y88.938 E.05147
G1 X53.727 Y88.679
G1 X52.816 Y89.589 E.03958
; WIPE_START
G1 F9547.055
M204 S6000
G1 X53.727 Y88.679 E-.48946
G1 X54 Y88.938 E-.14333
G1 X53.764 Y89.175 E-.1272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.395 Y89.073 Z4 F42000
G1 X134.006 Y88.102 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4140
M204 S6000
G1 X134.898 Y88.102 E.0296
G1 X134.898 Y91.898 E.12592
G1 X134.006 Y91.898 E.0296
G1 X134.006 Y88.162 E.12393
M204 S10000
G1 X133.614 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
M204 S5000
G1 X135.29 Y87.71 E.05151
G1 X135.29 Y92.29 E.14073
G1 X133.614 Y92.29 E.05151
G1 X133.614 Y87.77 E.13889
M204 S10000
G1 X134.452 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.52807
G1 F4140
M204 S6000
G1 X134.452 Y91.694 E.13397
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7420.386
G1 X134.452 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/40
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z4 I.29 J-1.182 P1  F42000
G1 X127.955 Y88.102 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4130
M204 S6000
G1 X127.955 Y91.898 E.12592
G1 X61.942 Y91.898 E2.18977
G1 X54.97 Y91.288 E.23218
G1 X54.97 Y88.755 E.084
G1 X62.44 Y88.102 E.24877
G1 X127.895 Y88.102 E2.17125
M204 S10000
G1 X128.347 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4130
M204 S5000
G1 X128.347 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04096
G1 X53.355 Y91.54 E.26434
G1 X53.355 Y88.503 E.09332
G1 X62.423 Y87.71 E.2797
G1 X128.287 Y87.71 E2.02381
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.313 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X124.463 Y91.55 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4130
M204 S6000
G1 X126.092 Y91.55 E.05401
G1 X122.992 Y88.45 E.1454
G1 X115.702 Y88.45 E.24184
G1 X114.871 Y91.55 E.10644
G1 X108.821 Y91.55 E.20071
G1 X105.721 Y88.45 E.1454
G1 X103.058 Y88.45 E.08833
G1 X102.228 Y91.55 E.10644
G1 X100.6 Y91.55 E.05401
M204 S10000
G1 X97.412 Y88.45 F42000
G1 F4130
M204 S6000
G1 X95.783 Y88.45 E.05401
G1 X84.217 Y91.55 E.39723
M73 P75 R3
G1 X82.588 Y91.55 E.05401
M204 S10000
G1 X92.044 Y88.45 F42000
G1 F4130
M204 S6000
G1 X90.415 Y88.45 E.05401
G1 X89.585 Y91.55 E.10644
G1 X91.55 Y91.55 E.06518
G1 X88.45 Y88.45 E.1454
G1 X77.772 Y88.45 E.35422
G1 X76.942 Y91.55 E.10644
G1 X74.279 Y91.55 E.08833
G1 X71.179 Y88.45 E.1454
G1 X65.129 Y88.45 E.20071
G1 X64.298 Y91.55 E.10644
G1 X62.67 Y91.55 E.05401
M204 S10000
G1 X55.362 Y89.115 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F4130
M204 S6000
G1 X55.362 Y90.928 E.05573
G1 X57.991 Y91.159 E.08111
G1 X57.991 Y88.885 E.06987
G1 X55.421 Y89.109 E.07927
M204 S10000
G1 X55.739 Y89.46 F42000
G1 F4130
M204 S6000
G1 X55.739 Y90.583 E.0345
G1 X57.614 Y90.747 E.05785
G1 X57.614 Y89.296 E.04458
G1 X55.798 Y89.455 E.05601
M204 S10000
G1 X56.165 Y89.851 F42000
; LINE_WIDTH: 0.51915
G1 F4130
M204 S6000
G1 X56.165 Y90.192 E.01323
G1 X57.188 Y90.281 E.03983
G1 X57.188 Y89.762 E.02017
G1 X56.225 Y89.846 E.0375
; WIPE_START
G1 F7559.372
G1 X57.188 Y89.762 E-.36717
G1 X57.188 Y90.281 E-.19749
G1 X56.676 Y90.237 E-.19534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.239 Y88.634 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4130
M204 S2000
G1 X54.747 Y89.142 E.02209
G1 X54.747 Y89.675
G1 X53.748 Y88.677 E.0434
G1 X53.563 Y89.024
G1 X54.747 Y90.209 E.05147
G1 X54.747 Y90.742
G1 X53.563 Y89.557 E.05147
G1 X53.563 Y90.091
G1 X54.747 Y91.275 E.05147
G1 X54.358 Y91.419
G1 X53.563 Y90.624 E.03457
; WIPE_START
G1 F9547.055
M204 S6000
G1 X54.358 Y91.419 E-.42746
G1 X54.747 Y91.275 E-.15767
G1 X54.422 Y90.95 E-.17486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.049 Y90.677 Z4.2 F42000
G1 X134.045 Y88.102 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4130
M204 S6000
G1 X134.898 Y88.102 E.02828
G1 X134.898 Y91.898 E.12592
G1 X134.045 Y91.898 E.02828
G1 X134.045 Y88.162 E.12393
M204 S10000
G1 X133.653 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4130
M204 S5000
G1 X135.29 Y87.71 E.05029
G1 X135.29 Y92.29 E.14073
G1 X133.653 Y92.29 E.05029
G1 X133.653 Y87.77 E.13889
M204 S10000
G1 X134.472 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48833
M73 P76 R3
G1 F4130
M204 S6000
G1 X134.472 Y91.694 E.123
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8082.441
G1 X134.472 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/40
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z4.2 I.287 J-1.183 P1  F42000
G1 X127.916 Y88.102 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6994
M204 S6000
G1 X127.916 Y91.898 E.12592
G1 X61.942 Y91.898 E2.18846
G1 X55.716 Y91.353 E.20732
G1 X55.716 Y88.69 E.08833
G1 X62.44 Y88.102 E.22391
G1 X127.856 Y88.102 E2.16995
M204 S10000
G1 X128.308 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6994
M204 S5000
G1 X128.308 Y92.29 E.14073
G1 X61.925 Y92.29 E2.03975
G1 X54.102 Y91.605 E.24131
G1 X54.102 Y88.438 E.09733
G1 X62.423 Y87.71 E.25667
G1 X128.248 Y87.71 E2.0226
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.274 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X124.086 Y91.173 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6994
M204 S6000
G1 X125.714 Y91.173 E.05401
G1 X123.369 Y88.827 E.11001
G1 X115.601 Y88.827 E.2577
G1 X114.972 Y91.173 E.08053
G1 X108.443 Y91.173 E.21657
G1 X106.098 Y88.827 E.11001
G1 X102.957 Y88.827 E.10419
G1 X102.329 Y91.173 E.08053
G1 X100.701 Y91.173 E.05401
M204 S10000
G1 X83.996 Y91.173 F42000
G1 F6994
M204 S6000
G1 X85.624 Y91.173 E.05401
G1 X94.376 Y88.827 E.30055
G1 X96.004 Y88.827 E.05401
M204 S10000
G1 X91.942 Y88.827 F42000
G1 F6994
M204 S6000
G1 X90.314 Y88.827 E.05401
G1 X89.686 Y91.173 E.08053
G1 X91.173 Y91.173 E.04932
G1 X88.827 Y88.827 E.11001
G1 X77.671 Y88.827 E.37008
G1 X77.043 Y91.173 E.08053
G1 X73.902 Y91.173 E.10419
G1 X71.557 Y88.827 E.11001
G1 X65.028 Y88.827 E.21657
G1 X64.399 Y91.173 E.08053
G1 X62.771 Y91.173 E.05401
M204 S10000
G1 X58.885 Y88.778 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.382984
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X62.456 Y88.465 E.09933
G1 X127.394 Y88.465 E1.79948
G1 X127.526 Y88.492 E.00373
G1 X127.553 Y88.624 E.00373
G1 X127.553 Y91.376 E.07626
G1 X127.526 Y91.508 E.00373
G1 X127.394 Y91.535 E.00373
G1 X61.958 Y91.535 E1.81328
G1 X58.972 Y91.274 E.08305
; Slow Down End
M204 S10000
G1 X57.54 Y91.119 F42000
; LINE_WIDTH: 0.416013
G1 F6994
M204 S6000
G1 X56.108 Y90.994 E.04371
G1 X56.108 Y89.049 E.05912
G2 X58.885 Y88.778 I-3.379 J-48.975 E.08484
; Slow Down Start
; LINE_WIDTH: 0.407164
G1 F3000;_EXTRUDE_SET_SPEED
G1 X58.745 Y88.933 E.0062
G2 X58.744 Y91.11 I89.953 J1.153 E.06462
G1 X58.913 Y91.269 E.00688
G2 X58.18 Y91.178 I-.964 J4.813 E.02194
; Slow Down End
; LINE_WIDTH: 0.417825
G1 F6994
G1 X57.6 Y91.125 E.01779
M204 S10000
G1 X56.485 Y90.648 F42000
; LINE_WIDTH: 0.41999
G1 F6994
M204 S6000
G1 X56.485 Y89.395 E.03851
G1 X58.361 Y89.231 E.05785
G1 X58.361 Y90.812 E.0486
G1 X56.545 Y90.653 E.05601
M204 S10000
G1 X56.862 Y90.303 F42000
G1 F6994
M204 S6000
G1 X57.984 Y90.401 E.03459
G1 X57.984 Y89.642 E.02331
G1 X56.862 Y89.74 E.03459
G1 X56.862 Y90.243 E.01543
M204 S10000
G1 X57.656 Y89.987 F42000
; LINE_WIDTH: 0.36096
G1 F6994
M204 S6000
G1 X57.597 Y90.022 E.00178
G1 X57.639 Y90.046 E.00126
; WIPE_START
G1 F11319.331
G1 X57.597 Y90.022 E-.31449
G1 X57.656 Y89.987 E-.44551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.494 Y90.644 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6994
M204 S2000
G1 X54.69 Y91.448 E.03494
G1 X54.309 Y91.296
G1 X55.494 Y90.111 E.05147
G1 X55.494 Y89.578
G1 X54.309 Y90.762 E.05147
G1 X54.309 Y90.229
G1 X55.494 Y89.045 E.05147
G1 X55.48 Y88.525
G1 X54.309 Y89.696 E.05087
G1 X54.309 Y89.163
G1 X54.895 Y88.576 E.02548
; WIPE_START
G1 F9547.055
M204 S6000
G1 X54.309 Y89.163 E-.3151
G1 X54.309 Y89.696 E-.20264
G1 X54.76 Y89.245 E-.24226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.392 Y89.135 Z4.4 F42000
G1 X134.085 Y88.102 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6994
M204 S6000
G1 X134.898 Y88.102 E.02696
G1 X134.898 Y91.898 E.12592
G1 X134.085 Y91.898 E.02696
G1 X134.085 Y88.162 E.12393
M204 S10000
M73 P77 R3
G1 X133.693 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6994
M204 S5000
G1 X135.29 Y87.71 E.04907
G1 X135.29 Y92.29 E.14073
G1 X133.693 Y92.29 E.04907
G1 X133.693 Y87.77 E.13889
M204 S10000
G1 X134.492 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44859
G1 F6994
M204 S6000
G1 X134.492 Y91.694 E.11202
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8874.208
G1 X134.492 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/40
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

M106 S198.9
; OBJECT_ID: 91
M204 S10000
G17
G3 Z4.4 I.286 J-1.183 P1  F42000
G1 X127.916 Y88.102 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X127.916 Y91.898 E.12592
G1 X61.942 Y91.898 E2.18846
G1 X56.463 Y91.418 E.18246
G1 X56.463 Y88.625 E.09267
G1 X62.44 Y88.102 E.19905
G1 X127.856 Y88.102 E2.16995
M204 S10000
G1 X128.308 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X128.308 Y92.29 E.14073
G1 X61.925 Y92.29 E2.03975
G1 X54.848 Y91.671 E.21828
G1 X54.848 Y88.372 E.10135
G1 X62.423 Y87.71 E.23364
G1 X128.248 Y87.71 E2.0226
; WIPE_START
M204 S6000
G1 X128.274 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X125.2 Y88.269 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40798
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X127.546 Y88.898 E.12937
G1 X127.546 Y89.372 E.02525
G1 X124.186 Y88.472 E.18527
G1 X122.417 Y88.472 E.09425
G1 X127.546 Y89.846 E.28284
G1 X127.546 Y90.32 E.02525
G1 X120.647 Y88.472 E.38041
G1 X118.878 Y88.472 E.09425
G1 X127.546 Y90.794 E.47799
G1 X127.546 Y91.269 E.02525
G1 X117.108 Y88.472 E.57556
G1 X115.339 Y88.472 E.09425
G1 X126.745 Y91.528 E.62899
G1 X124.976 Y91.528 E.09425
G1 X113.569 Y88.472 E.62899
G1 X111.8 Y88.472 E.09425
G1 X123.206 Y91.528 E.62899
G1 X121.437 Y91.528 E.09425
G1 X110.03 Y88.472 E.62899
G1 X108.261 Y88.472 E.09425
G1 X119.667 Y91.528 E.62899
G1 X117.898 Y91.528 E.09425
G1 X106.491 Y88.472 E.62899
G1 X104.722 Y88.472 E.09425
G1 X116.128 Y91.528 E.62899
G1 X114.359 Y91.528 E.09425
G1 X102.952 Y88.472 E.62899
G1 X101.183 Y88.472 E.09425
G1 X112.589 Y91.528 E.62899
G1 X110.82 Y91.528 E.09425
G1 X99.413 Y88.472 E.62899
G1 X97.644 Y88.472 E.09425
G1 X109.05 Y91.528 E.62899
G1 X107.281 Y91.528 E.09425
G1 X95.874 Y88.472 E.62899
G1 X94.105 Y88.472 E.09425
G1 X105.511 Y91.528 E.62899
G1 X103.742 Y91.528 E.09425
G1 X92.335 Y88.472 E.62899
G1 X90.566 Y88.472 E.09425
G1 X101.972 Y91.528 E.62899
G1 X100.203 Y91.528 E.09425
G1 X88.796 Y88.472 E.62899
G1 X87.027 Y88.472 E.09425
G1 X98.433 Y91.528 E.62899
G1 X96.664 Y91.528 E.09425
G1 X85.257 Y88.472 E.62899
G1 X83.488 Y88.472 E.09425
G1 X94.894 Y91.528 E.62899
G1 X93.125 Y91.528 E.09425
G1 X81.718 Y88.472 E.62899
G1 X79.949 Y88.472 E.09425
G1 X91.355 Y91.528 E.62899
G1 X89.586 Y91.528 E.09425
M73 P77 R2
G1 X78.179 Y88.472 E.62899
G1 X76.41 Y88.472 E.09425
G1 X87.816 Y91.528 E.62899
G1 X86.047 Y91.528 E.09425
G1 X74.64 Y88.472 E.62899
G1 X72.871 Y88.472 E.09425
G1 X84.277 Y91.528 E.62899
G1 X82.508 Y91.528 E.09425
G1 X71.101 Y88.472 E.62899
G1 X69.332 Y88.472 E.09425
G1 X80.739 Y91.528 E.62899
G1 X78.969 Y91.528 E.09425
G1 X67.562 Y88.472 E.62899
M73 P78 R2
G1 X65.793 Y88.472 E.09425
G1 X77.2 Y91.528 E.62899
G1 X75.43 Y91.528 E.09425
G1 X64.023 Y88.472 E.62899
G1 X62.456 Y88.472 E.08345
G1 X62.304 Y88.485 E.00817
G1 X73.661 Y91.528 E.62624
G1 X71.891 Y91.528 E.09425
G1 X60.969 Y88.602 E.60224
G1 X59.635 Y88.718 E.07133
G1 X70.122 Y91.528 E.57823
G1 X68.352 Y91.528 E.09425
G1 X58.476 Y88.882 E.54456
G1 X58.476 Y89.356 E.02525
G1 X66.583 Y91.528 E.44699
G1 X64.813 Y91.528 E.09425
G1 X58.476 Y89.83 E.34942
G1 X58.476 Y90.304 E.02525
G1 X63.044 Y91.528 E.25184
G1 X61.959 Y91.528 E.05778
G1 X60.942 Y91.439 E.05437
G1 X58.274 Y90.724 E.14712
M106 S198.9
M204 S10000
G1 X58.063 Y89.537 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F9547.299
M204 S6000
G1 X58.063 Y88.878 E.02025
G1 X56.855 Y88.984 E.03726
G1 X56.855 Y91.059 E.06376
G1 X58.063 Y91.165 E.03726
G1 X58.063 Y89.597 E.04816
M204 S10000
G1 X57.667 Y89.537 F42000
; LINE_WIDTH: 0.45843
G1 F8664.052
M204 S6000
G1 X57.667 Y89.311 E.00768
G1 X57.251 Y89.347 E.01412
G1 X57.251 Y90.696 E.04567
G1 X57.667 Y90.732 E.01412
G1 X57.667 Y89.597 E.03842
; WIPE_START
G1 X57.667 Y90.732 E-.43122
G1 X57.251 Y90.696 E-.1585
G1 X57.251 Y90.248 E-.17028
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.71 Y88.505 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X56.24 Y89.036 E.02305
G1 X56.24 Y89.569
G1 X55.219 Y88.548 E.04436
G1 X55.056 Y88.918
G1 X56.24 Y90.102 E.05147
G1 X56.24 Y90.635
G1 X55.056 Y89.451 E.05147
G1 X55.056 Y89.984
G1 X56.24 Y91.169 E.05147
G1 X56.111 Y91.573
G1 X55.056 Y90.517 E.04587
G1 X55.056 Y91.051
G1 X55.527 Y91.522 E.02047
; WIPE_START
M204 S6000
G1 X55.056 Y91.051 E-.25315
G1 X55.056 Y90.517 E-.20264
G1 X55.622 Y91.083 E-.30421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.249 Y90.794 Z4.6 F42000
G1 X134.085 Y88.102 Z4.6
G1 Z4.2
M73 P79 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X134.898 Y88.102 E.02696
G1 X134.898 Y91.898 E.12592
G1 X134.085 Y91.898 E.02696
G1 X134.085 Y88.162 E.12393
M204 S10000
G1 X133.693 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X135.29 Y87.71 E.04907
G1 X135.29 Y92.29 E.14073
G1 X133.693 Y92.29 E.04907
G1 X133.693 Y87.77 E.13889
M204 S10000
G1 X134.492 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44859
G1 F8874.208
M204 S6000
G1 X134.492 Y91.694 E.11202
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8874.208
G1 X134.492 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/40
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

M106 S201.45
; OBJECT_ID: 91
M204 S10000
G17
G3 Z4.6 I.288 J-1.182 P1  F42000
G1 X127.955 Y88.102 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8775
M204 S6000
G1 X127.955 Y91.898 E.12592
G1 X61.942 Y91.898 E2.18977
G1 X57.209 Y91.484 E.1576
G1 X57.209 Y88.559 E.097
G1 X62.44 Y88.102 E.17419
G1 X127.895 Y88.102 E2.17125
M204 S10000
G1 X128.347 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8775
M204 S5000
G1 X128.347 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04096
G1 X55.595 Y91.736 E.19525
G1 X55.595 Y88.307 E.10536
G1 X62.423 Y87.71 E.21061
G1 X128.287 Y87.71 E2.02381
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.313 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X58.805 Y90.022 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.580195
G1 F6700.48
M204 S6000
G1 X58.953 Y90.022 E.0065
; LINE_WIDTH: 0.611265
G1 F6334.181
G1 X59.102 Y90.022 E.00687
M204 S10000
G1 X62.213 Y90.014 F42000
; LINE_WIDTH: 0.415115
G1 F8775
M204 S6000
G1 X62.523 Y90 E.00941
G1 X125.997 Y90 E1.92511
M204 S10000
G1 X62.507 Y89.625 F42000
; LINE_WIDTH: 0.439413
G1 F8775
M204 S6000
G1 X62.252 Y89.667 E.00835
; LINE_WIDTH: 0.478258
G1 F8269.447
G1 X61.997 Y89.709 E.00917
; LINE_WIDTH: 0.514748
G1 F7629.907
G1 X61.894 Y89.735 E.00409
; LINE_WIDTH: 0.548883
G1 F7115.152
G1 X61.791 Y89.761 E.00439
; LINE_WIDTH: 0.541423
G1 F7221.629
G1 X61.23 Y89.786 E.0228
; LINE_WIDTH: 0.492368
G1 F8009.834
G1 X60.669 Y89.81 E.02056
; LINE_WIDTH: 0.443313
G1 F8775
G1 X60.108 Y89.834 E.01831
; LINE_WIDTH: 0.394258
G1 X59.548 Y89.859 E.01607
; LINE_WIDTH: 0.391153
G1 X59.483 Y89.886 E.00198
; LINE_WIDTH: 0.433998
G1 X59.419 Y89.913 E.00222
; LINE_WIDTH: 0.476843
G1 F8296.412
G1 X59.355 Y89.94 E.00247
; LINE_WIDTH: 0.519688
G1 F7550.851
G1 X59.29 Y89.967 E.00271
; LINE_WIDTH: 0.562533
G1 F6928.24
G1 X59.226 Y89.994 E.00295
; LINE_WIDTH: 0.605378
G1 F6400.484
G1 X59.162 Y90.022 E.0032
G1 X59.226 Y90.049 E.0032
; LINE_WIDTH: 0.562533
G1 F6928.24
G1 X59.29 Y90.076 E.00295
; LINE_WIDTH: 0.519688
G1 F7550.851
G1 X59.355 Y90.103 E.00271
; LINE_WIDTH: 0.476843
G1 F8296.412
G1 X59.419 Y90.13 E.00247
; LINE_WIDTH: 0.433998
G1 F8775
G1 X59.483 Y90.157 E.00222
; LINE_WIDTH: 0.391153
G1 X59.548 Y90.184 E.00198
; LINE_WIDTH: 0.394258
G1 X60.108 Y90.209 E.01607
; LINE_WIDTH: 0.443313
G1 X60.669 Y90.233 E.01831
; LINE_WIDTH: 0.492368
G1 F8009.834
G1 X61.23 Y90.258 E.02056
; LINE_WIDTH: 0.541423
G1 F7221.629
G1 X61.791 Y90.282 E.0228
; LINE_WIDTH: 0.541624
G1 F7218.721
G1 X61.931 Y90.313 E.00586
; LINE_WIDTH: 0.49297
G1 F7999.112
G1 X62.072 Y90.344 E.00529
; LINE_WIDTH: 0.420018
G1 F8775
G1 X62.213 Y90.375 E.00443
G1 X126.432 Y90.375 E1.97335
G1 X126.432 Y89.625 E.02303
G1 X62.567 Y89.625 E1.96249
M204 S10000
G1 X62.49 Y89.248 F42000
; LINE_WIDTH: 0.41999
G1 F8775
M204 S6000
G1 X58.355 Y89.61 E.12753
G1 X58.355 Y90.433 E.02531
G1 X61.992 Y90.752 E.11217
G1 X126.809 Y90.752 E1.99158
G1 X126.809 Y89.248 E.0462
G1 X62.55 Y89.248 E1.97444
M204 S10000
M73 P80 R2
G1 X62.474 Y88.871 F42000
G1 F8775
M204 S6000
G1 X57.978 Y89.264 E.13866
G1 X57.978 Y90.779 E.04654
G1 X61.976 Y91.129 E.1233
G1 X127.186 Y91.129 E2.00367
G1 X127.186 Y88.871 E.06937
G1 X62.534 Y88.871 E1.98653
M204 S10000
G1 X62.457 Y88.494 F42000
G1 F8775
M204 S6000
G1 X57.601 Y88.919 E.14978
G1 X57.601 Y91.124 E.06777
G1 X61.959 Y91.506 E.13442
G1 X127.563 Y91.506 E2.01577
G1 X127.563 Y88.494 E.09254
G1 X62.517 Y88.494 E1.99862
; WIPE_START
G1 F9547.299
G1 X64.517 Y88.494 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.36 Y91.146 Z4.8 F42000
G1 X56.987 Y91.284 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8775
M204 S2000
G1 X56.651 Y91.62 E.01459
G1 X56.161 Y91.577
G1 X56.987 Y90.751 E.0359
G1 X56.987 Y90.218
G1 X55.802 Y91.402 E.05147
G1 X55.802 Y90.869
G1 X56.987 Y89.685 E.05147
G1 X56.987 Y89.151
G1 X55.802 Y90.336 E.05147
G1 X55.802 Y89.803
G1 X56.987 Y88.618 E.05147
G1 X56.649 Y88.423
G1 X55.802 Y89.269 E.03677
; WIPE_START
G1 F9547.055
M204 S6000
G1 X56.649 Y88.423 E-.45476
G1 X56.987 Y88.618 E-.14837
G1 X56.695 Y88.91 E-.15687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.143 Y91.56 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0906367
G1 F8775
M204 S6000
G1 X55.783 Y91.547 E.0014
; WIPE_START
G1 F15000
G1 X56.143 Y91.56 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.768 Y91.222 Z4.8 F42000
G1 X134.045 Y88.102 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8775
M204 S6000
G1 X134.898 Y88.102 E.02828
G1 X134.898 Y91.898 E.12592
G1 X134.045 Y91.898 E.02828
G1 X134.045 Y88.162 E.12393
M204 S10000
G1 X133.653 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8775
M204 S5000
G1 X135.29 Y87.71 E.05029
G1 X135.29 Y92.29 E.14073
G1 X133.653 Y92.29 E.05029
G1 X133.653 Y87.77 E.13889
M204 S10000
G1 X134.472 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.48833
G1 F8082.441
M204 S6000
G1 X134.472 Y91.694 E.123
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8082.441
G1 X134.472 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/40
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z4.8 I.291 J-1.182 P1  F42000
G1 X127.994 Y88.102 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8662
M204 S6000
G1 X127.994 Y91.898 E.12592
G1 X61.942 Y91.898 E2.19107
G1 X57.956 Y91.549 E.13274
G1 X57.956 Y88.494 E.10134
G1 X62.44 Y88.102 E.14933
G1 X127.934 Y88.102 E2.17256
M204 S10000
G1 X128.387 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8662
M204 S5000
G1 X128.387 Y92.29 E.14073
G1 X61.925 Y92.29 E2.04217
G1 X56.342 Y91.801 E.17223
G1 X56.342 Y88.242 E.10937
G1 X62.423 Y87.71 E.18759
G1 X128.327 Y87.71 E2.02503
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.353 Y89.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X62.213 Y90.014 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415115
G1 F8662
M204 S6000
G1 X62.523 Y90 E.00941
G1 X126.037 Y90 E1.92631
M204 S10000
G1 X62.507 Y89.625 F42000
; LINE_WIDTH: 0.439413
G1 F8662
M204 S6000
G1 X62.252 Y89.667 E.00835
; LINE_WIDTH: 0.478258
G1 F8269.447
G1 X61.997 Y89.709 E.00916
; LINE_WIDTH: 0.514748
G1 F7629.907
G1 X61.894 Y89.735 E.00409
; LINE_WIDTH: 0.548883
G1 F7115.152
G1 X61.791 Y89.761 E.00439
; LINE_WIDTH: 0.54209
G1 F7211.972
G1 X61.245 Y89.785 E.02221
; LINE_WIDTH: 0.49437
G1 F7974.305
G1 X60.699 Y89.809 E.02009
; LINE_WIDTH: 0.44665
G1 F8662
G1 X60.154 Y89.832 E.01796
; LINE_WIDTH: 0.386353
G2 X59.457 Y89.869 I.074 J7.991 E.01954
G1 X59.457 Y90.174 E.00852
G1 X59.608 Y90.187 E.00426
; LINE_WIDTH: 0.39893
G1 X60.154 Y90.211 E.01584
; LINE_WIDTH: 0.44665
G1 X60.699 Y90.235 E.01797
; LINE_WIDTH: 0.49437
G1 F7974.305
G1 X61.245 Y90.258 E.02009
; LINE_WIDTH: 0.54209
G1 F7211.972
G1 X61.791 Y90.282 E.02221
; LINE_WIDTH: 0.541624
G1 F7218.721
G1 X61.931 Y90.313 E.00586
; LINE_WIDTH: 0.49297
G1 F7999.112
G1 X62.072 Y90.344 E.00529
; LINE_WIDTH: 0.420018
G1 F8662
G1 X62.213 Y90.375 E.00443
G1 X126.471 Y90.375 E1.97456
G1 X126.471 Y89.625 E.02303
G1 X62.567 Y89.625 E1.9637
M204 S10000
G1 X62.49 Y89.248 F42000
; LINE_WIDTH: 0.41999
G1 F8662
M204 S6000
G1 X59.102 Y89.544 E.1045
G1 X59.102 Y90.499 E.02932
G1 X61.992 Y90.752 E.08915
G1 X126.848 Y90.752 E1.99279
G1 X126.848 Y89.248 E.0462
G1 X62.55 Y89.248 E1.97565
M204 S10000
G1 X62.474 Y88.871 F42000
G1 F8662
M204 S6000
G1 X58.725 Y89.199 E.11563
G1 X58.725 Y90.844 E.05055
G1 X61.976 Y91.129 E.10027
G1 X127.225 Y91.129 E2.00488
G1 X127.225 Y88.871 E.06937
G1 X62.534 Y88.871 E1.98774
M204 S10000
G1 X62.457 Y88.494 F42000
G1 F8662
M204 S6000
G1 X58.348 Y88.853 E.12675
G1 X58.348 Y91.19 E.07179
M73 P81 R2
G1 X61.959 Y91.506 E.11139
G1 X127.602 Y91.506 E2.01698
G1 X127.602 Y88.494 E.09254
G1 X62.517 Y88.494 E1.99983
; WIPE_START
G1 F9547.299
G1 X64.517 Y88.494 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.181 Y88.376 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8662
M204 S2000
G1 X57.733 Y88.929 E.02401
G1 X57.733 Y89.462
G1 X56.69 Y88.419 E.04532
G1 X56.549 Y88.811
G1 X57.733 Y89.996 E.05147
G1 X57.733 Y90.529
G1 X56.549 Y89.344 E.05147
G1 X56.549 Y89.878
G1 X57.733 Y91.062 E.05147
G1 X57.733 Y91.595
G1 X56.549 Y90.411 E.05147
G1 X56.549 Y90.944
G1 X57.28 Y91.675 E.03177
; WIPE_START
G1 F9547.055
M204 S6000
G1 X56.549 Y90.944 E-.39291
G1 X56.549 Y90.411 E-.20264
G1 X56.855 Y90.717 E-.16445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.483 Y90.458 Z5 F42000
G1 X134.006 Y88.102 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8662
M204 S6000
G1 X134.898 Y88.102 E.0296
G1 X134.898 Y91.898 E.12592
G1 X134.006 Y91.898 E.0296
G1 X134.006 Y88.162 E.12393
M204 S10000
G1 X133.614 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8662
M204 S5000
G1 X135.29 Y87.71 E.05151
G1 X135.29 Y92.29 E.14073
G1 X133.614 Y92.29 E.05151
G1 X133.614 Y87.77 E.13889
M204 S10000
G1 X134.452 Y88.306 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.52807
G1 F7420.386
M204 S6000
G1 X134.452 Y91.694 E.13397
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7420.386
G1 X134.452 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/40
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z5 I.295 J-1.181 P1  F42000
G1 X128.069 Y88.102 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8735
M204 S6000
G1 X128.069 Y91.898 E.12592
G1 X61.942 Y91.898 E2.19356
G1 X58.702 Y91.614 E.10788
G1 X58.702 Y88.429 E.10567
G1 X62.44 Y88.102 E.12447
G1 X128.009 Y88.102 E2.17505
M204 S10000
G1 X128.428 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8735
M204 S5000
G1 X128.462 Y87.71 E.00104
G1 X128.462 Y92.29 E.14073
G1 X128.428 Y92.29 E.00104
G1 X61.925 Y92.29 E2.04343
G1 X57.088 Y91.867 E.1492
G1 X57.088 Y88.176 E.11339
G1 X62.423 Y87.71 E.16456
G1 X128.368 Y87.71 E2.02629
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.462 Y87.71 E-.03572
G1 X128.462 Y89.616 E-.72428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X62.213 Y90.014 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415115
G1 F8735
M204 S6000
G1 X62.523 Y90 E.00941
G1 X126.112 Y90 E1.92858
M204 S10000
G1 X62.507 Y89.625 F42000
; LINE_WIDTH: 0.439403
G1 F8735
M204 S6000
G1 X62.252 Y89.667 E.00835
; LINE_WIDTH: 0.478228
G1 F8270.016
G1 X61.997 Y89.709 E.00916
; LINE_WIDTH: 0.514718
G1 F7630.392
G1 X61.894 Y89.735 E.00409
; LINE_WIDTH: 0.548873
G1 F7115.293
G1 X61.79 Y89.761 E.00439
; LINE_WIDTH: 0.546017
G1 F7155.683
G1 X61.335 Y89.781 E.0187
; LINE_WIDTH: 0.50615
G1 F7771.517
G1 X60.879 Y89.801 E.01722
; LINE_WIDTH: 0.453956
G1 F8735
M73 P82 R2
G2 X60.239 Y89.837 I.09 J7.328 E.02147
G1 X60.239 Y90.206 E.01238
G1 X60.423 Y90.223 E.00619
; LINE_WIDTH: 0.466284
G1 F8503.334
G1 X60.879 Y90.242 E.01574
; LINE_WIDTH: 0.50615
G1 F7771.517
G1 X61.335 Y90.262 E.01722
; LINE_WIDTH: 0.546017
G1 F7155.683
G1 X61.79 Y90.282 E.0187
; LINE_WIDTH: 0.541624
G1 F7218.721
G1 X61.931 Y90.313 E.00586
; LINE_WIDTH: 0.49297
G1 F7999.112
G1 X62.072 Y90.344 E.00529
; LINE_WIDTH: 0.420017
G1 F8735
G1 X62.213 Y90.375 E.00443
G1 X126.546 Y90.375 E1.97687
G1 X126.546 Y89.625 E.02303
G1 X62.567 Y89.625 E1.966
M204 S10000
G1 X62.49 Y89.248 F42000
; LINE_WIDTH: 0.419988
G1 F8735
M204 S6000
G1 X59.849 Y89.479 E.08148
G1 X59.849 Y90.564 E.03333
G1 X61.992 Y90.752 E.06612
G1 X126.923 Y90.752 E1.99508
G1 X126.923 Y89.248 E.0462
G1 X62.55 Y89.248 E1.97794
M204 S10000
G1 X62.474 Y88.871 F42000
G1 F8735
M204 S6000
G1 X59.472 Y89.134 E.0926
G1 X59.472 Y90.91 E.05457
G1 X61.976 Y91.129 E.07724
G1 X127.3 Y91.129 E2.00718
G1 X127.3 Y88.871 E.06937
G1 X62.534 Y88.871 E1.99003
M204 S10000
G1 X62.457 Y88.494 F42000
G1 F8735
M204 S6000
G1 X59.095 Y88.788 E.10372
G1 X59.095 Y91.255 E.0758
G1 X61.959 Y91.506 E.08836
G1 X127.677 Y91.506 E2.01927
G1 X127.677 Y88.494 E.09254
G1 X62.517 Y88.494 E2.00212
; WIPE_START
G1 F9547.361
G1 X64.517 Y88.494 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X58.48 Y91.391 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8735
M204 S2000
G1 X58.122 Y91.749 E.01556
G1 X57.632 Y91.706
G1 X58.48 Y90.858 E.03686
G1 X58.48 Y90.324
G1 X57.295 Y91.509 E.05147
G1 X57.295 Y90.976
G1 X58.48 Y89.791 E.05147
G1 X58.48 Y89.258
G1 X57.295 Y90.442 E.05147
G1 X57.295 Y89.909
G1 X58.48 Y88.725 E.05147
G1 X58.402 Y88.27
G1 X57.295 Y89.376 E.04807
G1 X57.295 Y88.843
G1 X57.817 Y88.321 E.02267
; WIPE_START
G1 F9547.055
M204 S6000
G1 X57.295 Y88.843 E-.2804
G1 X57.295 Y89.376 E-.20264
G1 X57.811 Y88.86 E-.27696
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.559 Y91.633 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126929
G1 F8735
M204 S6000
G3 X57.277 Y91.664 I-.179 J-.332 E.00199
; WIPE_START
G1 F15000
G1 X57.457 Y91.67 E-.47435
G1 X57.559 Y91.633 E-.28565
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.183 Y91.28 Z5.2 F42000
G1 X133.931 Y88.102 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8735
M204 S6000
G1 X134.898 Y88.102 E.03209
G1 X134.898 Y91.898 E.12592
G1 X133.931 Y91.898 E.03209
G1 X133.931 Y88.162 E.12393
M204 S10000
G1 X133.573 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8735
M204 S5000
G1 X135.29 Y87.71 E.05277
G1 X135.29 Y92.29 E.14073
G1 X133.573 Y92.29 E.05277
G1 X133.538 Y92.29 E.00105
G1 X133.538 Y87.736 E.13994
; WIPE_START
G1 F9547.055
M204 S6000
G1 X135.29 Y87.71 E-.66566
G1 X135.29 Y87.958 E-.09434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.414 Y88.306 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.60325
G1 F6424.786
M204 S6000
G1 X134.414 Y91.694 E.15473
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6424.786
G1 X134.414 Y89.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/40
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z5.2 I.302 J-1.179 P1  F42000
G1 X128.197 Y88.102 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P83 R2
G1 F8843.478
M204 S6000
G1 X128.197 Y91.898 E.12592
G1 X126.578 Y91.898 E.0537
G1 X126.578 Y88.102 E.12592
G1 X128.137 Y88.102 E.05171
M204 S10000
G1 X128.503 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3900
M204 S5000
G1 X128.589 Y87.71 E.00265
G1 X128.589 Y92.29 E.14073
G1 F4682.057
G1 X128.503 Y92.29 E.00265
G1 F9242.586
G1 X128.103 Y92.29 E.01229
G1 F9547.055
G1 X127.703 Y92.29 E.01229
G1 X61.925 Y92.29 E2.02116
G1 X57.835 Y91.932 E.12617
G1 X57.835 Y88.111 E.1174
G1 X62.423 Y87.71 E.14153
G1 X128.443 Y87.71 E2.02859
; WIPE_START
M204 S6000
G1 X128.589 Y87.71 E-.05558
G1 X128.589 Y89.564 E-.70443
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X126.97 Y91.506 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X127.805 Y91.506 E.02565
G1 X127.805 Y88.494 E.09254
G1 X126.97 Y88.494 E.02565
G1 X126.97 Y91.446 E.0907
M204 S10000
G1 X127.387 Y91.088 F42000
; LINE_WIDTH: 0.50066
G1 F7864.726
M204 S6000
G1 X127.387 Y88.972 E.07896
; WIPE_START
G1 X127.387 Y90.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.512 Y87.917 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X126.355 Y88.761 E.03665
G1 X126.355 Y89.294
G1 X124.979 Y87.917 E.05982
G1 X124.445 Y87.917
G1 X126.355 Y89.827 E.08299
G1 X126.355 Y90.36
G1 X123.912 Y87.917 E.10616
G1 X123.379 Y87.917
G1 X126.355 Y90.894 E.12934
G1 X126.355 Y91.427
G1 X122.846 Y87.917 E.15251
G1 X122.312 Y87.917
G1 X126.355 Y91.96 E.17568
G1 X125.944 Y92.083
G1 X121.779 Y87.917 E.181
G1 X121.246 Y87.917
G1 X125.411 Y92.083 E.181
G1 X124.878 Y92.083
G1 X120.713 Y87.917 E.181
G1 X120.179 Y87.917
G1 X124.345 Y92.083 E.181
G1 X123.811 Y92.083
G1 X119.646 Y87.917 E.181
G1 X119.113 Y87.917
G1 X123.278 Y92.083 E.181
G1 X122.745 Y92.083
G1 X118.58 Y87.917 E.181
G1 X118.046 Y87.917
G1 X122.212 Y92.083 E.181
G1 X121.678 Y92.083
G1 X117.513 Y87.917 E.181
G1 X116.98 Y87.917
G1 X121.145 Y92.083 E.181
G1 X120.612 Y92.083
G1 X116.447 Y87.917 E.181
G1 X115.913 Y87.917
G1 X120.079 Y92.083 E.181
G1 X119.545 Y92.083
G1 X115.38 Y87.917 E.181
G1 X114.847 Y87.917
G1 X119.012 Y92.083 E.181
G1 X118.479 Y92.083
G1 X114.314 Y87.917 E.181
G1 X113.78 Y87.917
G1 X117.946 Y92.083 E.181
G1 X117.412 Y92.083
G1 X113.247 Y87.917 E.181
G1 X112.714 Y87.917
G1 X116.879 Y92.083 E.181
G1 X116.346 Y92.083
G1 X112.181 Y87.917 E.181
G1 X111.647 Y87.917
G1 X115.813 Y92.083 E.181
G1 X115.279 Y92.083
G1 X111.114 Y87.917 E.181
G1 X110.581 Y87.917
G1 X114.746 Y92.083 E.181
G1 X114.213 Y92.083
G1 X110.048 Y87.917 E.181
G1 X109.514 Y87.917
G1 X113.679 Y92.083 E.181
G1 X113.146 Y92.083
G1 X108.981 Y87.917 E.181
G1 X108.448 Y87.917
G1 X112.613 Y92.083 E.181
G1 X112.08 Y92.083
G1 X107.914 Y87.917 E.181
G1 X107.381 Y87.917
G1 X111.546 Y92.083 E.181
G1 X111.013 Y92.083
G1 X106.848 Y87.917 E.181
G1 X106.315 Y87.917
G1 X110.48 Y92.083 E.181
G1 X109.947 Y92.083
G1 X105.781 Y87.917 E.181
G1 X105.248 Y87.917
G1 X109.413 Y92.083 E.181
G1 X108.88 Y92.083
G1 X104.715 Y87.917 E.181
G1 X104.182 Y87.917
G1 X108.347 Y92.083 E.181
G1 X107.814 Y92.083
G1 X103.648 Y87.917 E.181
G1 X103.115 Y87.917
G1 X107.28 Y92.083 E.181
G1 X106.747 Y92.083
G1 X102.582 Y87.917 E.181
G1 X102.049 Y87.917
G1 X106.214 Y92.083 E.181
G1 X105.681 Y92.083
G1 X101.515 Y87.917 E.181
G1 X100.982 Y87.917
G1 X105.147 Y92.083 E.181
G1 X104.614 Y92.083
G1 X100.449 Y87.917 E.181
G1 X99.916 Y87.917
G1 X104.081 Y92.083 E.181
G1 X103.548 Y92.083
G1 X99.382 Y87.917 E.181
G1 X98.849 Y87.917
G1 X103.014 Y92.083 E.181
G1 X102.481 Y92.083
G1 X98.316 Y87.917 E.181
G1 X97.783 Y87.917
G1 X101.948 Y92.083 E.181
G1 X101.415 Y92.083
G1 X97.249 Y87.917 E.181
G1 X96.716 Y87.917
G1 X100.881 Y92.083 E.181
G1 X100.348 Y92.083
G1 X96.183 Y87.917 E.181
G1 X95.65 Y87.917
G1 X99.815 Y92.083 E.181
G1 X99.282 Y92.083
G1 X95.116 Y87.917 E.181
G1 X94.583 Y87.917
G1 X98.748 Y92.083 E.181
M73 P84 R2
G1 X98.215 Y92.083
G1 X94.05 Y87.917 E.181
G1 X93.517 Y87.917
G1 X97.682 Y92.083 E.181
G1 X97.149 Y92.083
G1 X92.983 Y87.917 E.181
G1 X92.45 Y87.917
G1 X96.615 Y92.083 E.181
G1 X96.082 Y92.083
G1 X91.917 Y87.917 E.181
G1 X91.383 Y87.917
G1 X95.549 Y92.083 E.181
G1 X95.015 Y92.083
G1 X90.85 Y87.917 E.181
G1 X90.317 Y87.917
G1 X94.482 Y92.083 E.181
G1 X93.949 Y92.083
G1 X89.784 Y87.917 E.181
G1 X89.25 Y87.917
G1 X93.416 Y92.083 E.181
G1 X92.882 Y92.083
G1 X88.717 Y87.917 E.181
G1 X88.184 Y87.917
G1 X92.349 Y92.083 E.181
G1 X91.816 Y92.083
G1 X87.651 Y87.917 E.181
G1 X87.117 Y87.917
G1 X91.283 Y92.083 E.181
G1 X90.749 Y92.083
G1 X86.584 Y87.917 E.181
G1 X86.051 Y87.917
G1 X90.216 Y92.083 E.181
G1 X89.683 Y92.083
G1 X85.518 Y87.917 E.181
G1 X84.984 Y87.917
G1 X89.15 Y92.083 E.181
G1 X88.616 Y92.083
G1 X84.451 Y87.917 E.181
G1 X83.918 Y87.917
G1 X88.083 Y92.083 E.181
G1 X87.55 Y92.083
G1 X83.385 Y87.917 E.181
G1 X82.851 Y87.917
G1 X87.017 Y92.083 E.181
G1 X86.483 Y92.083
G1 X82.318 Y87.917 E.181
G1 X81.785 Y87.917
G1 X85.95 Y92.083 E.181
G1 X85.417 Y92.083
G1 X81.252 Y87.917 E.181
G1 X80.718 Y87.917
G1 X84.884 Y92.083 E.181
G1 X84.35 Y92.083
G1 X80.185 Y87.917 E.181
G1 X79.652 Y87.917
G1 X83.817 Y92.083 E.181
G1 X83.284 Y92.083
G1 X79.119 Y87.917 E.181
G1 X78.585 Y87.917
G1 X82.751 Y92.083 E.181
G1 X82.217 Y92.083
G1 X78.052 Y87.917 E.181
G1 X77.519 Y87.917
G1 X81.684 Y92.083 E.181
G1 X81.151 Y92.083
G1 X76.986 Y87.917 E.181
G1 X76.452 Y87.917
G1 X80.618 Y92.083 E.181
G1 X80.084 Y92.083
G1 X75.919 Y87.917 E.181
G1 X75.386 Y87.917
G1 X79.551 Y92.083 E.181
G1 X79.018 Y92.083
G1 X74.853 Y87.917 E.181
G1 X74.319 Y87.917
G1 X78.484 Y92.083 E.181
G1 X77.951 Y92.083
G1 X73.786 Y87.917 E.181
G1 X73.253 Y87.917
G1 X77.418 Y92.083 E.181
G1 X76.885 Y92.083
G1 X72.719 Y87.917 E.181
G1 X72.186 Y87.917
G1 X76.351 Y92.083 E.181
G1 X75.818 Y92.083
G1 X71.653 Y87.917 E.181
G1 X71.12 Y87.917
G1 X75.285 Y92.083 E.181
G1 X74.752 Y92.083
G1 X70.586 Y87.917 E.181
G1 X70.053 Y87.917
G1 X74.218 Y92.083 E.181
G1 X73.685 Y92.083
G1 X69.52 Y87.917 E.181
G1 X68.987 Y87.917
G1 X73.152 Y92.083 E.181
G1 X72.619 Y92.083
G1 X68.453 Y87.917 E.181
G1 X67.92 Y87.917
G1 X72.085 Y92.083 E.181
G1 X71.552 Y92.083
G1 X67.387 Y87.917 E.181
G1 X66.854 Y87.917
G1 X71.019 Y92.083 E.181
G1 X70.486 Y92.083
G1 X66.32 Y87.917 E.181
G1 X65.787 Y87.917
G1 X69.952 Y92.083 E.181
G1 X69.419 Y92.083
G1 X65.254 Y87.917 E.181
G1 X64.721 Y87.917
G1 X68.886 Y92.083 E.181
G1 X68.353 Y92.083
G1 X64.187 Y87.917 E.181
G1 X63.654 Y87.917
G1 X67.819 Y92.083 E.181
G1 X67.286 Y92.083
G1 X63.121 Y87.917 E.181
G1 X62.588 Y87.917
G1 X66.753 Y92.083 E.181
G1 X66.22 Y92.083
G1 X62.085 Y87.948 E.17968
G1 X61.594 Y87.991
G1 X65.686 Y92.083 E.17782
G1 X65.153 Y92.083
G1 X61.104 Y88.034 E.17595
G1 X60.614 Y88.076
G1 X64.62 Y92.083 E.17409
M73 P85 R2
G1 X64.087 Y92.083
G1 X60.123 Y88.119 E.17223
G1 X59.633 Y88.162
G1 X63.553 Y92.083 E.17037
G1 X63.02 Y92.083
G1 X59.142 Y88.205 E.1685
G1 X58.652 Y88.248
G1 X62.487 Y92.083 E.16664
G1 X61.954 Y92.083
G1 X58.162 Y88.291 E.16478
G1 X58.042 Y88.704
G1 X61.371 Y92.033 E.14466
G1 X60.787 Y91.982
G1 X58.042 Y89.238 E.11926
G1 X58.042 Y89.771
G1 X60.202 Y91.931 E.09386
G1 X59.618 Y91.88
G1 X58.042 Y90.304 E.06847
G1 X58.042 Y90.837
G1 X59.033 Y91.829 E.04307
G1 X58.449 Y91.778
G1 X58.042 Y91.371 E.01768
; WIPE_START
M204 S6000
M73 P85 R1
G1 X58.449 Y91.778 E-.2186
G1 X59.033 Y91.829 E-.22293
G1 X58.441 Y91.236 E-.31848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.067 Y90.919 Z5.4 F42000
G1 X133.803 Y88.102 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X134.898 Y88.102 E.03631
G1 X134.898 Y91.898 E.12592
G1 X133.803 Y91.898 E.03631
G1 X133.803 Y88.162 E.12393
M204 S10000
G1 X133.497 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X135.29 Y87.71 E.05508
G1 X135.29 Y92.29 E.14073
G1 X134.297 Y92.29 E.0305
G1 X133.897 Y92.29 E.01229
G1 F8129.329
G1 X133.497 Y92.29 E.01229
G1 F3900
G1 X133.411 Y92.29 E.00265
G1 X133.411 Y87.71 E.14073
G1 F4130.368
G1 X133.437 Y87.71 E.00081
; WIPE_START
M204 S6000
G1 X135.29 Y87.71 E-.70397
G1 X135.29 Y87.857 E-.05603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.179 Y91.523 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38671
G1 F10471.509
M204 S6000
G1 X134.523 Y91.523 E.00963
G1 X134.523 Y88.477 E.08531
G1 X134.179 Y88.477 E.00963
G1 X134.179 Y91.463 E.08362
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10471.509
G1 X134.179 Y89.463 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/40
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

M106 S204
; OBJECT_ID: 91
M204 S10000
G17
G3 Z5.4 I.275 J-1.185 P1  F42000
G1 X128.324 Y88.102 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.324 Y91.898 E.12592
G1 X126.102 Y91.898 E.0737
G1 X126.102 Y88.102 E.12592
G1 X128.264 Y88.102 E.07171
M204 S10000
G1 X128.63 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.716 Y87.71 E.00265
G1 X128.716 Y92.29 E.14073
G1 X128.63 Y92.29 E.00265
G1 X128.23 Y92.29 E.01229
G1 X127.83 Y92.29 E.01229
G1 X125.71 Y92.29 E.06513
G1 X125.71 Y87.71 E.14073
G1 X128.57 Y87.71 E.08787
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.716 Y87.71 E-.05558
G1 X128.716 Y89.564 E-.70443
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X126.494 Y91.506 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X127.932 Y91.506 E.04418
G1 X127.932 Y88.494 E.09254
G1 X126.494 Y88.494 E.04418
G1 X126.494 Y91.446 E.0907
M204 S10000
G1 X126.871 Y91.129 F42000
G1 F1200
M204 S6000
G1 X127.555 Y91.129 E.02101
G1 X127.555 Y88.871 E.06937
G1 X126.871 Y88.871 E.02101
G1 X126.871 Y91.069 E.06753
M204 S10000
G1 X127.213 Y90.787 F42000
; LINE_WIDTH: 0.34946
G1 F1200
M204 S6000
G1 X127.213 Y89.273 E.03782
; WIPE_START
G1 F11743.981
G1 X127.213 Y90.787 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.676 Y88.102 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.04053
G1 X134.898 Y91.898 E.12592
G1 X133.676 Y91.898 E.04053
G1 X133.676 Y88.162 E.12393
M204 S10000
G1 X133.37 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.05899
G1 X135.29 Y92.29 E.14073
G1 X134.17 Y92.29 E.03441
G1 X133.77 Y92.29 E.01229
G1 X133.37 Y92.29 E.01229
G1 X133.284 Y92.29 E.00265
G1 X133.284 Y87.71 E.14073
G1 X133.31 Y87.71 E.00081
; WIPE_START
G1 F4130.368
M204 S6000
G1 X135.29 Y87.71 E-.75232
G1 X135.29 Y87.73 E-.00768
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.083 Y91.491 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45033
G1 F1200
M204 S6000
G1 X134.491 Y91.491 E.01353
G1 X134.491 Y88.509 E.09898
G1 X134.083 Y88.509 E.01353
G1 X134.083 Y91.431 E.09699
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8836.307
G1 X134.083 Y89.431 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/40
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z5.6 I.283 J-1.184 P1  F42000
G1 X128.527 Y88.102 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.527 Y91.898 E.12592
G1 X126.102 Y91.898 E.08043
G1 X126.102 Y88.102 E.12592
G1 X128.467 Y88.102 E.07844
M204 S10000
G1 X128.757 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P86 R1
G1 F1200
M204 S5000
G1 X128.919 Y87.71 E.00497
G1 X128.919 Y92.29 E.14073
G1 X128.757 Y92.29 E.00497
G1 X128.357 Y92.29 E.01229
G1 X127.957 Y92.29 E.01229
G1 X125.71 Y92.29 E.06904
G1 X125.71 Y87.71 E.14073
G1 X128.697 Y87.71 E.09178
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.919 Y87.71 E-.08429
G1 X128.919 Y89.488 E-.67571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.314 Y90.686 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55226
G1 F1200
M204 S6000
G1 X127.314 Y89.374 E.05442
M204 S10000
G1 X126.871 Y91.129 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X127.758 Y91.129 E.02724
G1 X127.758 Y88.871 E.06937
G1 X126.871 Y88.871 E.02724
G1 X126.871 Y91.069 E.06753
M204 S10000
G1 X126.494 Y91.506 F42000
G1 F1200
M204 S6000
G1 X128.135 Y91.506 E.05041
G1 X128.135 Y88.494 E.09254
G1 X126.494 Y88.494 E.05041
G1 X126.494 Y91.446 E.0907
; WIPE_START
G1 F9547.299
G1 X126.494 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.473 Y88.102 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.04726
G1 X134.898 Y91.898 E.12592
G1 X133.473 Y91.898 E.04726
G1 X133.473 Y88.162 E.12393
M204 S10000
G1 X133.243 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.0629
G1 X135.29 Y92.29 E.14073
G1 X134.043 Y92.29 E.03832
G1 X133.643 Y92.29 E.01229
G1 X133.243 Y92.29 E.01229
G1 X133.081 Y92.29 E.00497
G1 X133.081 Y87.71 E.14073
G1 X133.183 Y87.71 E.00313
; WIPE_START
G1 F2726.925
M204 S6000
G1 X135.183 Y87.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.931 Y91.44 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55173
G1 F1200
M204 S6000
G1 X134.44 Y91.44 E.0211
G1 X134.44 Y88.56 E.11941
G1 X133.931 Y88.56 E.0211
G1 X133.931 Y91.38 E.11692
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7075.333
G1 X133.931 Y89.38 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/40
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z5.8 I.293 J-1.181 P1  F42000
G1 X128.777 Y88.102 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.777 Y91.898 E.12592
G1 X126.102 Y91.898 E.08873
G1 X126.102 Y88.102 E.12592
G1 X128.717 Y88.102 E.08674
M204 S10000
G1 X128.96 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
M204 S5000
G1 X129.169 Y87.71 E.00643
G1 X129.169 Y92.29 E.14073
M106 S204
G1 X128.96 Y92.29 E.00643
G1 X128.56 Y92.29 E.01229
G1 X128.16 Y92.29 E.01229
G1 X125.71 Y92.29 E.07528
G1 X125.71 Y87.71 E.14073
G1 X128.9 Y87.71 E.09801
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.169 Y87.71 E-.10227
G1 X129.169 Y89.441 E-.65773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.25 Y90.75 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42265
G1 F1200
M204 S6000
G1 X127.629 Y90.75 E.01175
G1 X127.629 Y89.25 E.04644
G1 X127.25 Y89.25 E.01175
G1 X127.25 Y90.69 E.04458
M204 S10000
G1 X126.871 Y91.129 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
M73 P87 R1
G1 X128.008 Y91.129 E.03492
G1 X128.008 Y88.871 E.06937
G1 X126.871 Y88.871 E.03492
G1 X126.871 Y91.069 E.06753
M204 S10000
G1 X126.494 Y91.506 F42000
G1 F1200
M204 S6000
G1 X128.385 Y91.506 E.05809
G1 X128.385 Y88.494 E.09254
G1 X126.494 Y88.494 E.05809
G1 X126.494 Y91.446 E.0907
; WIPE_START
G1 F9547.299
G1 X126.494 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.223 Y88.102 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.05556
G1 X134.898 Y91.898 E.12592
G1 X133.223 Y91.898 E.05556
G1 X133.223 Y88.162 E.12393
M204 S10000
G1 X133.04 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.06913
G1 X135.29 Y92.29 E.14073
G1 X134.24 Y92.29 E.03226
G1 X133.84 Y92.29 E.01229
G1 X133.44 Y92.29 E.01229
G1 X133.04 Y92.29 E.01229
M106 S255
G1 X132.831 Y92.29 E.00643
G1 X132.831 Y87.71 E.14073
M106 S204
G1 X132.98 Y87.71 E.00458
; WIPE_START
G1 F2330.763
M204 S6000
G1 X134.98 Y87.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.615 Y91.506 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.02737
G1 X134.506 Y88.494 E.09254
G1 X133.615 Y88.494 E.02737
G1 X133.615 Y91.446 E.0907
M204 S10000
G1 X134.061 Y91.061 F42000
; LINE_WIDTH: 0.55652
G1 F1200
M204 S6000
G1 X134.061 Y88.999 E.08626
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7009.346
G1 X134.061 Y90.999 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/40
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z6 I.616 J-1.05 P1  F42000
G1 X129.124 Y88.102 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.124 Y91.898 E.12592
G1 X126.102 Y91.898 E.10023
G1 X126.102 Y88.102 E.12592
G1 X129.064 Y88.102 E.09824
M204 S10000
G1 X129.21 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X129.516 Y87.71 E.00939
G1 X129.516 Y92.29 E.14073
M106 S204
G1 F1200
G1 X129.21 Y92.29 E.00939
G1 X128.81 Y92.29 E.01229
G1 X128.41 Y92.29 E.01229
G1 X125.71 Y92.29 E.08296
G1 X125.71 Y87.71 E.14073
G1 X129.15 Y87.71 E.1057
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.516 Y87.71 E-.13897
G1 X129.516 Y89.344 E-.62103
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.613 Y90.387 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39494
G1 F1200
M204 S6000
G1 X127.613 Y89.673 E.02049
M204 S10000
G1 X127.248 Y90.752 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X127.977 Y90.752 E.0224
G1 X127.977 Y89.248 E.0462
G1 X127.248 Y89.248 E.0224
G1 X127.248 Y90.692 E.04435
M204 S10000
G1 X126.871 Y91.129 F42000
G1 F1200
M204 S6000
G1 X128.354 Y91.129 E.04557
G1 X128.354 Y88.871 E.06937
G1 X126.871 Y88.871 E.04557
G1 X126.871 Y91.069 E.06753
M204 S10000
G1 X126.494 Y91.506 F42000
G1 F1200
M204 S6000
G1 X128.732 Y91.506 E.06875
G1 X128.732 Y88.494 E.09254
G1 X126.494 Y88.494 E.06875
G1 X126.494 Y91.446 E.0907
; WIPE_START
G1 F9547.299
G1 X126.494 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.876 Y88.102 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.06706
G1 X134.898 Y91.898 E.12592
G1 X132.876 Y91.898 E.06706
G1 X132.876 Y88.162 E.12393
M204 S10000
G1 X132.79 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.07682
M73 P88 R1
G1 X135.29 Y92.29 E.14073
G1 X133.99 Y92.29 E.03994
G1 X133.59 Y92.29 E.01229
G1 X133.19 Y92.29 E.01229
G1 X132.79 Y92.29 E.01229
M106 S255
G1 F600
G1 X132.484 Y92.29 E.00939
G1 X132.484 Y87.71 E.14073
M106 S204
G1 F1200
G1 X132.73 Y87.71 E.00755
; WIPE_START
G1 F1723.645
M204 S6000
G1 X134.73 Y87.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.269 Y91.506 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.03802
G1 X134.506 Y88.494 E.09254
G1 X133.269 Y88.494 E.03802
G1 X133.269 Y91.446 E.0907
M204 S10000
G1 X133.672 Y91.102 F42000
; LINE_WIDTH: 0.47306
G1 F1200
M204 S6000
G1 X134.102 Y91.102 E.01508
G1 X134.102 Y88.898 E.07727
G1 X133.672 Y88.898 E.01508
G1 X133.672 Y91.042 E.07517
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8369.368
G1 X133.672 Y89.042 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/40
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z6.2 I.151 J-1.208 P1  F42000
G1 X126.137 Y88.102 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X129.543 Y88.102 E.113
G1 X129.615 Y88.102 E.00239
G1 X129.615 Y91.898 E.12592
G1 X129.543 Y91.898 E.00239
G1 X126.137 Y91.898 E.113
G1 X126.137 Y88.162 E.12393
M204 S10000
G1 X125.745 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.357 Y87.71 E.08026
G1 X128.757 Y87.71 E.01229
G1 X129.157 Y87.71 E.01229
G1 X129.557 Y87.71 E.01229
M106 S255
G1 X129.741 Y87.71 E.00567
M106 S204
M106 S255
G1 F600
G1 X129.926 Y87.71 E.00567
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X130.007 Y87.71 E.00271
G1 X130.007 Y92.29 E.15193
M106 S204
M106 S255
G1 F3000
G1 X129.926 Y92.29 E.00271
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
G1 X129.741 Y92.29 E.00567
M106 S204
G1 X129.557 Y92.29 E.00567
G1 X129.157 Y92.29 E.01229
G1 X128.757 Y92.29 E.01229
G1 X125.745 Y92.29 E.09255
G1 X125.745 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X127.744 Y87.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X127.674 Y90.361 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44737
G1 F1200
M204 S6000
G1 X128.078 Y90.361 E.01333
G1 X128.078 Y89.639 E.02379
G1 X127.674 Y89.639 E.01333
G1 X127.674 Y90.301 E.02182
M204 S10000
G1 X127.283 Y90.752 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X128.469 Y90.752 E.03644
G1 X128.469 Y89.248 E.0462
G1 X127.283 Y89.248 E.03644
G1 X127.283 Y90.692 E.04435
M204 S10000
G1 X126.906 Y91.129 F42000
G1 F1200
M204 S6000
G1 X128.846 Y91.129 E.05961
G1 X128.846 Y88.871 E.06937
G1 X126.906 Y88.871 E.05961
G1 X126.906 Y91.069 E.06753
M204 S10000
G1 X126.529 Y91.506 F42000
G1 F1200
M204 S6000
G1 X129.223 Y91.506 E.08278
G1 X129.223 Y88.494 E.09254
G1 X126.529 Y88.494 E.08278
G1 X126.529 Y91.446 E.0907
; WIPE_START
G1 F9547.299
G1 X126.529 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.853 Y91.592 Z6.4 F42000
G1 X134.898 Y91.898 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X132.457 Y91.898 E.08097
G1 X132.385 Y91.898 E.00239
G1 X132.385 Y88.102 E.12592
G1 X132.457 Y88.102 E.00239
G1 X134.898 Y88.102 E.08097
G1 X134.898 Y91.838 E.12393
M204 S10000
G1 X135.29 Y92.29 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X133.643 Y92.29 E.0506
G1 X133.243 Y92.29 E.01229
M73 P89 R1
G1 X132.843 Y92.29 E.01229
G1 X132.443 Y92.29 E.01229
M106 S255
G1 X132.259 Y92.29 E.00567
M106 S204
M106 S255
G1 F600
G1 X132.074 Y92.29 E.00567
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X131.993 Y92.29 E.00271
G1 X131.993 Y87.71 E.15193
G1 X132.074 Y87.71 E.00271
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
G1 X132.259 Y87.71 E.00567
M106 S204
G1 X132.443 Y87.71 E.00567
G1 X132.843 Y87.71 E.01229
G1 X133.243 Y87.71 E.01229
G1 X135.29 Y87.71 E.06289
G1 X135.29 Y92.23 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X133.643 Y92.29 E-.62613
G1 X133.291 Y92.29 E-.13387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.641 Y90.641 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.64062
G1 F1200
M204 S6000
G1 X133.641 Y89.419 E.05956
M204 S10000
G1 X133.154 Y91.129 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X134.129 Y91.129 E.02995
G1 X134.129 Y88.871 E.06937
G1 X133.154 Y88.871 E.02995
G1 X133.154 Y91.069 E.06753
M204 S10000
G1 X132.777 Y91.506 F42000
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.05312
G1 X134.506 Y88.494 E.09254
G1 X132.777 Y88.494 E.05312
G1 X132.777 Y91.446 E.0907
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X132.777 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/40
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z6.4 I.254 J-1.19 P1  F42000
G1 X126.483 Y88.102 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X128.835 Y88.102 E.078
G1 X129.235 Y88.102 E.01327
G1 X129.635 Y88.102 E.01327
G1 X130.035 Y88.102 E.01327
M106 S255
G1 X130.226 Y88.102 E.00634
M106 S204
M106 S255
G1 F600
G1 X130.417 Y88.102 E.00634
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X131.583 Y88.102 E.03867
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F1200
M204 S6000
G1 X131.774 Y88.102 E.00634
M106 S204
G1 X131.965 Y88.102 E.00634
G1 X132.365 Y88.102 E.01327
G1 X132.765 Y88.102 E.01327
G1 X134.898 Y88.102 E.07074
G1 X134.898 Y91.898 E.12592
G1 X133.165 Y91.898 E.05747
G1 X132.765 Y91.898 E.01327
G1 X132.365 Y91.898 E.01327
G1 X131.965 Y91.898 E.01327
M106 S255
G1 X131.774 Y91.898 E.00634
M106 S204
M106 S255
G1 F600
G1 X131.583 Y91.898 E.00634
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X130.417 Y91.898 E.03867
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F1200
M204 S6000
G1 X130.226 Y91.898 E.00634
M106 S204
G1 X130.035 Y91.898 E.00634
G1 X129.635 Y91.898 E.01327
G1 X129.235 Y91.898 E.01327
G1 X126.483 Y91.898 E.09127
G1 X126.483 Y88.162 E.12393
M204 S10000
G1 X126.091 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X128.848 Y87.71 E.08471
G1 X129.248 Y87.71 E.01229
G1 X129.648 Y87.71 E.01229
G1 X130.048 Y87.71 E.01229
M106 S255
G1 X130.233 Y87.71 E.00567
M106 S204
M106 S255
G1 F600
G1 X130.417 Y87.71 E.00567
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X131.583 Y87.71 E.03867
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
G1 X131.767 Y87.71 E.00567
M106 S204
G1 X131.952 Y87.71 E.00567
G1 X132.352 Y87.71 E.01229
G1 X132.752 Y87.71 E.01229
G1 X135.29 Y87.71 E.07799
G1 X135.29 Y92.29 E.14073
G1 X133.152 Y92.29 E.0657
G1 X132.752 Y92.29 E.01229
G1 X132.352 Y92.29 E.01229
G1 X131.952 Y92.29 E.01229
M106 S255
G1 X131.767 Y92.29 E.00567
M106 S204
M106 S255
G1 F600
G1 X131.583 Y92.29 E.00567
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.417 Y92.29 E.03867
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1200
G1 X130.233 Y92.29 E.00567
M106 S204
G1 X130.048 Y92.29 E.00567
G1 X129.648 Y92.29 E.01229
G1 X129.248 Y92.29 E.01229
G1 X126.091 Y92.29 E.097
G1 X126.091 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.091 Y87.726 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X128.83 Y91.558 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.43252
M106 S255
G1 F3000
M204 S6000
G1 X133 Y91.558 E.13238
G1 X133 Y91.169 E.01237
G1 X129 Y91.169 E.127
G1 X129 Y90.779 E.01237
G1 X133 Y90.779 E.127
G1 X133 Y90.39 E.01237
G1 X129 Y90.39 E.127
G1 X129 Y90 E.01237
G1 X133 Y90 E.127
G1 X133 Y89.61 E.01237
G1 X129 Y89.61 E.127
M73 P90 R1
G1 X129 Y89.221 E.01237
G1 X133 Y89.221 E.127
G1 X133 Y88.831 E.01237
G1 X129 Y88.831 E.127
G1 X129 Y88.442 E.01237
G1 X133.17 Y88.442 E.13238
M106 S204
M204 S10000
G1 X133.377 Y91.506 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.03468
G1 X134.506 Y88.494 E.09254
G1 X133.377 Y88.494 E.03468
G1 X133.377 Y91.446 E.0907
M204 S10000
G1 X133.754 Y91.129 F42000
; LINE_WIDTH: 0.41874
G1 F1200
M204 S6000
G1 X134.129 Y91.129 E.01151
G1 X134.129 Y88.871 E.06918
G1 X133.754 Y88.871 E.01151
G1 X133.754 Y91.069 E.06734
; WIPE_START
G1 F9579.055
G1 X133.754 Y89.069 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.875 Y91.506 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X128.623 Y91.506 E.05369
G1 X128.623 Y88.494 E.09254
G1 X126.875 Y88.494 E.05369
G1 X126.875 Y91.446 E.0907
M204 S10000
G1 X127.252 Y91.129 F42000
G1 F1200
M204 S6000
G1 X128.246 Y91.129 E.03052
G1 X128.246 Y88.871 E.06937
G1 X127.252 Y88.871 E.03052
G1 X127.252 Y91.069 E.06753
M204 S10000
G1 X127.595 Y90.786 F42000
; LINE_WIDTH: 0.35103
G1 F1200
M204 S6000
G1 X127.903 Y90.786 E.00774
G1 X127.903 Y89.214 E.03948
G1 X127.595 Y89.214 E.00774
G1 X127.595 Y90.726 E.03797
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11684.139
G1 X127.595 Y89.214 E-.57473
G1 X127.903 Y89.214 E-.11709
G1 X127.903 Y89.393 E-.06819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/40
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z6.6 I.936 J-.778 P1  F42000
G1 X126.83 Y88.102 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.26763
G1 X134.898 Y91.898 E.12592
G1 X126.83 Y91.898 E.26763
G1 X126.83 Y88.162 E.12393
M204 S10000
G1 X126.438 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.272
G1 X135.29 Y92.29 E.14073
G1 X126.438 Y92.29 E.272
G1 X126.438 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.438 Y87.756 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X128.728 Y90 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S6000
G1 X132.94 Y90 E.12777
M204 S10000
G1 X128.353 Y90.375 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X133.375 Y90.375 E.15429
G1 X133.375 Y89.625 E.02302
G1 X128.353 Y89.625 E.15429
G1 X128.353 Y90.315 E.02118
M204 S10000
G1 X127.976 Y90.752 F42000
G1 F1200
M204 S6000
G1 X133.752 Y90.752 E.17746
G1 X133.752 Y89.248 E.0462
G1 X127.976 Y89.248 E.17746
G1 X127.976 Y90.692 E.04435
M204 S10000
G1 X127.599 Y91.129 F42000
G1 F1200
M204 S6000
G1 X134.129 Y91.129 E.20064
G1 X134.129 Y88.871 E.06937
G1 X127.599 Y88.871 E.20064
G1 X127.599 Y91.069 E.06753
M204 S10000
G1 X127.222 Y91.506 F42000
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.22381
G1 X134.506 Y88.494 E.09254
G1 X127.222 Y88.494 E.22381
G1 X127.222 Y91.446 E.0907
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.222 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/40
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z6.8 I1.216 J-.041 P1  F42000
G1 X127.177 Y88.102 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.25613
G1 X134.898 Y91.898 E.12592
G1 X127.177 Y91.898 E.25613
G1 X127.177 Y88.162 E.12393
M204 S10000
G1 X126.784 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.26135
G1 X135.29 Y92.29 E.14073
G1 X126.784 Y92.29 E.26135
G1 X126.784 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X128.784 Y87.756 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X129.074 Y90 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41518
G1 F1200
M204 S6000
G1 X132.94 Y90 E.11726
M204 S10000
G1 X128.7 Y90.375 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X133.375 Y90.375 E.14364
G1 X133.375 Y89.625 E.02302
G1 X128.7 Y89.625 E.14364
G1 X128.7 Y90.315 E.02118
M204 S10000
G1 X128.323 Y90.752 F42000
G1 F1200
M204 S6000
G1 X133.752 Y90.752 E.16681
G1 X133.752 Y89.248 E.0462
G1 X128.323 Y89.248 E.16681
G1 X128.323 Y90.692 E.04435
M204 S10000
G1 X127.946 Y91.129 F42000
G1 F1200
M204 S6000
G1 X134.129 Y91.129 E.18999
G1 X134.129 Y88.871 E.06937
M73 P91 R1
G1 X127.946 Y88.871 E.18999
G1 X127.946 Y91.069 E.06753
M204 S10000
G1 X127.569 Y91.506 F42000
G1 F1200
M204 S6000
G1 X134.506 Y91.506 E.21316
G1 X134.506 Y88.494 E.09254
G1 X127.569 Y88.494 E.21316
G1 X127.569 Y91.446 E.0907
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X127.569 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/40
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z7 I1.216 J-.041 P1  F42000
G1 X127.523 Y88.102 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.24464
G1 X134.898 Y91.898 E.12592
G1 X127.523 Y91.898 E.24464
G1 X127.523 Y88.162 E.12393
M204 S10000
G1 X127.131 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.2507
G1 X135.29 Y92.29 E.14073
G1 X127.131 Y92.29 E.2507
G1 X127.131 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.131 Y87.755 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X129.187 Y88.533 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494641
G1 F1200
M204 S6000
G1 X134.461 Y88.539 E.19412
; LINE_WIDTH: 0.48912
G1 X134.486 Y88.612 E.00279
; LINE_WIDTH: 0.44664
G1 X134.51 Y88.685 E.00253
; LINE_WIDTH: 0.383666
G1 X134.535 Y88.757 E.00213
G1 X134.535 Y91.376 E.07272
G1 X134.508 Y91.508 E.00374
G1 X134.376 Y91.535 E.00374
G1 X129.194 Y91.535 E.1439
M204 S10000
G1 X128.267 Y91.154 F42000
; LINE_WIDTH: 0.36935
G1 F1200
M204 S6000
G1 X128.593 Y91.154 E.00868
G1 X128.589 Y88.85 E.06129
G1 X128.267 Y88.846 E.00858
G1 X128.267 Y91.094 E.0598
M204 S10000
G1 X127.915 Y91.506 F42000
; LINE_WIDTH: 0.415262
G1 F1200
M204 S6000
G3 X129.134 Y91.535 I.257 J14.618 E.03699
G1 X128.948 Y91.376 E.00741
G3 X128.945 Y88.85 I150.141 J-1.456 E.07665
; LINE_WIDTH: 0.444115
G1 X129.076 Y88.607 E.00902
; LINE_WIDTH: 0.463348
G1 X129.187 Y88.533 E.00457
G1 X128.589 Y88.494 E.02052
; LINE_WIDTH: 0.41999
M73 P92 R1
G1 X127.915 Y88.494 E.02072
G1 X127.915 Y91.446 E.0907
M204 S10000
G1 X132.809 Y91.173 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.173 Y90.807 E.04682
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X132.809 Y91.173 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/40
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z7.2 I.642 J-1.034 P1  F42000
G1 X127.87 Y88.102 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
M204 S6000
G1 X134.898 Y88.102 E.23314
G1 X134.898 Y91.898 E.12592
G1 X127.87 Y91.898 E.23314
G1 X127.87 Y88.162 E.12393
M204 S10000
G1 X127.478 Y87.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.71 E.24005
G1 X135.29 Y92.29 E.14073
G1 X127.478 Y92.29 E.24005
G1 X127.478 Y87.77 E.13889
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.478 Y87.755 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X128.481 Y89.137 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41585
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X129.122 Y91.528 E.13699
G1 X129.604 Y91.528 E.02669
G1 X128.804 Y88.543 E.17103
G1 X128.875 Y88.472 E.00556
M73 P92 R0
G1 X129.267 Y88.472 E.0217
G1 X130.086 Y91.528 E.1751
G1 X130.569 Y91.528 E.02669
G1 X129.75 Y88.472 E.1751
G1 X130.232 Y88.472 E.02669
G1 X131.051 Y91.528 E.1751
G1 X131.533 Y91.528 E.02669
G1 X130.714 Y88.472 E.1751
G1 X131.196 Y88.472 E.02669
G1 X132.015 Y91.528 E.1751
G1 X132.498 Y91.528 E.02669
G1 X131.679 Y88.472 E.1751
G1 X132.161 Y88.472 E.02669
G1 X132.98 Y91.528 E.1751
G1 X133.462 Y91.528 E.02669
G1 X132.643 Y88.472 E.1751
G1 X133.126 Y88.472 E.02669
G1 X133.944 Y91.528 E.1751
G1 X134.427 Y91.528 E.02669
G1 X133.608 Y88.472 E.1751
M73 P93 R0
G1 X134.09 Y88.472 E.02669
G1 X134.731 Y90.863 E.13697
M106 S204
M204 S10000
G1 X128.266 Y91.502 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428123
; LAYER_HEIGHT: 0.2
G1 F1200
M204 S6000
G1 X128.266 Y88.564 E.09223
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9345.731
G1 X128.266 Y90.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/40
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z7.4 I1.217 J-.025 P1  F42000
G1 X128.216 Y88.133 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.133 E.22164
G1 X134.898 Y91.898 E.12489
G1 X128.216 Y91.898 E.22164
G1 X128.216 Y88.193 E.1229
M204 S10000
G1 X127.824 Y87.741 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.741 E.2294
G1 X135.29 Y92.29 E.13978
G1 X127.824 Y92.29 E.2294
G1 X127.824 Y87.801 E.13794
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.824 Y87.785 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X130.099 Y90.016 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38418
G1 F1200
M204 S6000
G1 X132.956 Y90.016 E.07944
M204 S10000
G1 X129.74 Y89.656 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X129.74 Y90.375 E.02207
G1 X133.375 Y90.375 E.11169
G1 X133.375 Y89.656 E.02207
G1 X129.8 Y89.656 E.10985
M204 S10000
G1 X129.363 Y89.279 F42000
G1 F1200
M204 S6000
G1 X129.363 Y90.752 E.04524
G1 X133.752 Y90.752 E.13486
G1 X133.752 Y89.279 E.04524
G1 X129.423 Y89.279 E.13302
M204 S10000
G1 X128.985 Y88.902 F42000
G1 F1200
M204 S6000
G1 X128.985 Y91.129 E.06842
G1 X134.129 Y91.129 E.15804
G1 X134.129 Y88.902 E.06842
G1 X129.045 Y88.902 E.15619
M204 S10000
G1 X128.608 Y88.525 F42000
G1 F1200
M204 S6000
G1 X128.608 Y91.506 E.09159
G1 X134.506 Y91.506 E.18121
G1 X134.506 Y88.525 E.09159
G1 X128.668 Y88.525 E.17936
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X130.668 Y88.525 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/40
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z7.6 I.111 J-1.212 P1  F42000
G1 X128.563 Y88.333 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.333 E.21014
G1 X134.898 Y91.898 E.11825
G1 X128.563 Y91.898 E.21014
G1 X128.563 Y88.393 E.11626
M204 S10000
G1 X128.171 Y87.941 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y87.941 E.21875
G1 X135.29 Y92.29 E.13363
G1 X128.171 Y92.29 E.21875
G1 X128.171 Y88.001 E.13179
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.171 Y87.984 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X130.122 Y89.892 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49062
G1 F1200
M204 S6000
G1 X130.122 Y90.339 E.01633
M73 P94 R0
G1 X133.339 Y90.339 E.11739
G1 X133.339 Y89.892 E.01633
G1 X130.182 Y89.892 E.1152
M204 S10000
G1 X129.709 Y89.479 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X129.709 Y90.752 E.0391
G1 X133.752 Y90.752 E.12421
G1 X133.752 Y89.479 E.0391
G1 X129.769 Y89.479 E.12237
M204 S10000
G1 X129.332 Y89.102 F42000
G1 F1200
M204 S6000
G1 X129.332 Y91.129 E.06227
G1 X134.129 Y91.129 E.14739
G1 X134.129 Y89.102 E.06227
G1 X129.392 Y89.102 E.14554
M204 S10000
G1 X128.955 Y88.725 F42000
G1 F1200
M204 S6000
G1 X128.955 Y91.506 E.08544
G1 X134.506 Y91.506 E.17056
G1 X134.506 Y88.725 E.08544
G1 X129.015 Y88.725 E.16871
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X131.015 Y88.725 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/40
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z7.8 I.111 J-1.212 P1  F42000
G1 X128.91 Y88.533 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.533 E.19865
G1 X134.898 Y91.824 E.10918
G1 X128.91 Y91.824 E.19865
G1 X128.91 Y88.593 E.10719
M204 S10000
G1 X128.517 Y88.141 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y88.141 E.2081
G1 X135.29 Y92.216 E.12523
G1 X128.517 Y92.216 E.2081
G1 X128.517 Y88.201 E.12338
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.517 Y88.183 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X130.4 Y90.023 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3538
G1 F1200
M204 S6000
G1 X130.4 Y90.334 E.00788
G1 X133.408 Y90.334 E.0762
G1 X133.408 Y90.023 E.00788
G1 X130.46 Y90.023 E.07468
M204 S10000
G1 X130.056 Y89.679 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X130.056 Y90.678 E.03069
G1 X133.752 Y90.678 E.11356
G1 X133.752 Y89.679 E.03069
G1 X130.116 Y89.679 E.11172
M204 S10000
G1 X129.679 Y89.302 F42000
G1 F1200
M204 S6000
G1 X129.679 Y91.055 E.05386
G1 X134.129 Y91.055 E.13674
G1 X134.129 Y89.302 E.05386
G1 X129.739 Y89.302 E.13489
M204 S10000
G1 X129.302 Y88.925 F42000
G1 F1200
M204 S6000
G1 X129.302 Y91.432 E.07703
G1 X134.506 Y91.432 E.15991
G1 X134.506 Y88.925 E.07703
G1 X129.362 Y88.925 E.15806
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X131.362 Y88.925 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/40
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z8 I.111 J-1.212 P1  F42000
G1 X129.256 Y88.733 Z8
G1 Z7.8
M73 P95 R0
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X134.898 Y88.733 E.18715
G1 X134.898 Y91.624 E.09591
G1 X129.256 Y91.624 E.18715
G1 X129.256 Y88.793 E.09392
M204 S10000
G1 X128.864 Y88.341 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y88.341 E.19745
G1 X135.29 Y92.016 E.11293
G1 X128.864 Y92.016 E.19745
G1 X128.864 Y88.401 E.11109
; WIPE_START
G1 F9547.055
M204 S6000
G1 X130.864 Y88.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X130.458 Y89.935 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53086
G1 F1200
M204 S6000
G1 X130.458 Y90.423 E.0194
G1 X133.696 Y90.423 E.12877
G1 X133.696 Y89.935 E.0194
G1 X130.518 Y89.935 E.12638
M204 S10000
G1 X130.025 Y89.502 F42000
; LINE_WIDTH: 0.41999
G1 F1200
M204 S6000
G1 X130.025 Y90.855 E.04157
G1 X134.129 Y90.855 E.12609
G1 X134.129 Y89.502 E.04157
G1 X130.085 Y89.502 E.12424
M204 S10000
G1 X129.648 Y89.125 F42000
G1 F1200
M204 S6000
G1 X129.648 Y91.232 E.06474
G1 X134.506 Y91.232 E.14926
G1 X134.506 Y89.125 E.06474
G1 X129.708 Y89.125 E.14741
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9547.299
G1 X131.708 Y89.125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/40
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change

; OBJECT_ID: 91
M204 S10000
G17
G3 Z8.2 I.277 J-1.185 P1  F42000
G1 X129.211 Y88.541 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X135.29 Y88.541 E.1868
G1 X135.29 Y91.816 E.10064
G1 X129.211 Y91.816 E.1868
G1 X129.211 Y88.601 E.0988
; WIPE_START
G1 F9547.055
M204 S6000
G1 X131.211 Y88.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y90 F18000 ; move to safe pos
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




G1 X134.518 Y91.609 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X135.083 Y91.044 E.02455
G1 X135.083 Y90.511
G1 X133.985 Y91.609 E.04772
G1 X133.451 Y91.609
M73 P96 R0
G1 X135.083 Y89.978 E.07089
G1 X135.083 Y89.444
G1 X132.918 Y91.609 E.09406
G1 X132.385 Y91.609
G1 X135.083 Y88.911 E.11724
G1 X134.712 Y88.748
G1 X131.851 Y91.609 E.12431
G1 X131.318 Y91.609
G1 X134.179 Y88.748 E.12431
G1 X133.646 Y88.748
G1 X130.785 Y91.609 E.12431
G1 X130.252 Y91.609
G1 X133.112 Y88.748 E.12431
G1 X132.579 Y88.748
G1 X129.718 Y91.609 E.12431
G1 X129.418 Y91.376
G1 X132.046 Y88.748 E.11419
G1 X131.513 Y88.748
G1 X129.418 Y90.843 E.09101
G1 X129.418 Y90.31
G1 X130.979 Y88.748 E.06784
G1 X130.446 Y88.748
G1 X129.418 Y89.776 E.04467
G1 X129.418 Y89.243
G1 X129.913 Y88.748 E.0215
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F9547.055
M204 S6000
G1 X129.418 Y89.243 E-.26583
G1 X129.418 Y89.776 E-.20264
G1 X129.961 Y89.234 E-.29153
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
G1 E-0.8 F1800 ; retract
G1 Z8.5 F900 ; lower z a little
G1 X0 Y90 F18000 ; move to safe pos
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

    G1 Z108 F600
    G1 Z106

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

