#ncrename -O -v soil_moisture_vol,smc ufs_land_restart.2000-01-01_02-00-00.nc
#nccmp -dsSqf -v smc ufs_land_restart.2000-01-01_02-00-00.nc ../master_6a0f119/ufs_land_restart.2000-01-01_02-00-00.nc

#ncrename -O -v soil_moisture_vol,smc ufs_land_output.2000-01-01_06-00-00.nc
#nccmp -dsSqf -v smc ufs_land_output.2000-01-01_06-00-00.nc ../master_6a0f119/ufs_land_output.2000-01-01_06-00-00.nc

#nccmp -dqfsS ufs_land_output.2000-01-01_06-00-00.nc ../master_6a0f119/ufs_land_output.2000-01-01_06-00-00.nc

#!/usr/bin/perl


system("ncrename -O -v timestep,delt ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v pressure_surface,ps ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_forcing,t1 ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v spec_humidity_forcing,q1 ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v vegetation_fraction,sigmaf ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v emissivity_total,emiss ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v albedo_direct_vis,albdvis ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v albedo_direct_nir,albdnir ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v albedo_diffuse_vis,albivis ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v albedo_diffuse_nir,albinir ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v radiation_longwave_down,dlwflx ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v radiation_shortwave_down,dswsfc ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_soil_bot,tg3 ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v cm_noahmp,cm ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v ch_noahmp,ch ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v forcing_height,zf ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v wind_speed,wind ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v max_vegetation_frac,shdmax ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v albedo_total,sfalb ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_water_equiv,weasd ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_depth,snwdph ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_radiative,tskin ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v precipitation_total,tprcp ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_moisture_vol,smc ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_soil,stc ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_liquid_vol,slc ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v canopy_water,canopy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v transpiration_heat,trans ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v z0_total,zorl ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_cover_fraction,sncovr1 ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v spec_humidity_surface,qsurf ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v ground_heat_total,gflux ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v runoff_baseflow,drain ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v latent_heat_total,evap ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v sensible_heat_total,hflx ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v evaporation_potential,ep ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v runoff_surface,runoff ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v latent_heat_ground,evbs ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v latent_heat_canopy,evcw ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v sublimation_snow,sbsno ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_moisture_total,stm ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v precip_adv_heat_total,snohf ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v cosine_zenith,xcoszin ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_levels,snowxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_leaf,tvxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_ground,tgxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v canopy_ice,canicexy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v canopy_liquid,canliqxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v vapor_pres_canopy_air,eahxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_canopy_air,tahxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v canopy_wet_fraction,fwetxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_water_equiv_old,sneqvoxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_albedo_old,alboldxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snowfall,qsnowxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v lake_water,wslakexy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v depth_water_table,zwtxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v aquifer_water,waxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v saturated_water,wtxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v leaf_carbon,lfmassxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v root_carbon,rtmassxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v stem_carbon,stmassxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v wood_carbon,woodxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_carbon_stable,stblcpxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_carbon_fast,fastcpxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v leaf_area_index,xlaixy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v stem_area_index,xsaixy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_age,taussxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v soil_moisture_wtd,smcwtdxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v deep_recharge,deeprechxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v recharge,rechxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_2m,t2mmp ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v spec_humidity_2m,q2mp ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v eq_soil_water_vol,smoiseq ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v interface_depth,zsnsoxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v temperature_snow,tsnoxy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_level_ice,snicexy ufs_land_output.2000-01-01_06-00-00.nc");
system("ncrename -O -v snow_level_liquid,snliqxy ufs_land_output.2000-01-01_06-00-00.nc");
