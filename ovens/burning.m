time_divider = 1;

# fuel params
fuel.fuel_energy = 100e6;
fuel.remain_energy = 100e06;
fuel.degree_energy = 1000;
fuel.energy = 250000;
##fuel.fuel_energy = 10e6;
##fuel.remain_energy = 10e06;
##fuel.degree_energy = 100;
##fuel.energy = 25000;
fuel.coef_surface_vaporing = 0.2;
fuel.coef_energy_to_vapor = 0.4;
fuel.coef_air_need = 0.5;
fuel.coef_smoke_generate = 17.5;
fuel.coef_flame_to_fuel = 20;
fuel.coef_air_to_fuel = 5;
fuel.coef_fireplace_to_fuel = 10;
fuel.vaporing_temp = 260;
# smoke = energy_in_vapor*fuel.coef_smoke_generate + energy_in_vapor*coef_air_need
# smoke = energy_in_vapor*(fuel.coef_smoke_generate + fuel.coef_air_need)
# flame_temp = energy_in_vapor/(smoke*fireplace.air_unit_degree_energy)
# flame_temp = 1/((fuel.coef_smoke_generate + fuel.coef_air_need)*fireplace.air_unit_degree_energy)
fuel.flame_temp = 1100; # wood for smoke_gen 17.5 and air_need 0.5 and unit_degree_energy 5e-5

# fireplace data and params
fireplace.energy = 0;
fireplace.degree_energy = 50;

fireplace.coef_energy_to_vaporing = 0.2;
fireplace.air = 500000;
fireplace.air_energy = 0;
fireplace.air_unit_degree_energy = 5e-5;

fireplace.coef_fuel_transfer = 25;
fireplace.coef_air_lost = 5;
fireplace.coef_to_air = 25;
fireplace.coef_smoke_to_heater = 130;
fireplace.coef_smoke_to_cooker = 125;
fireplace.coef_smoke_to_air = 300;

heater_temp = 25; # 50k
cooker_temp = 25; # 30k

function printPlots(data)
  length(data.remain)
  
  hold off
  figure(1)
  plot(data.remain)
  title("Remain energy")
  figure(2)
  plot(data.energy)
  hold on
  plot(data.heater)
  plot(data.cooker)
  title("Energy in fireplace, energy to heater and cooker")
  hold off
  figure(3)
  plot(data.temp_fireplace)
  hold on
  plot(data.temp_air)
  plot(data.temp_fuel)
  plot(data.temp_smoke)
  title("Fireplace temp, air temp, fuel and smoke temp")
  hold off
  figure(4)
  plot(-diff(data.remain))
  title("Burning speed")
  figure(5)
  plot(data.profit)
  hold on
  plot(data.lost)
  plot(data.wasted)
  title("Energy profit, lost and wasted")
  hold off
  figure(6)
  plot(data.air_need)
  title("Air need")
endfunction

# t1 = e1/de1
# t2 = e2/de2
# move_12 = (t1-t2)*coef
# t*de1 + t*de2 = e1 + e2
# t(de1+de2) = e1 + e2
# move_max = t*de2 - t2*de2 = t1*de1 - t*de1

function move_energy = max_move_energy(e1, de1, e2, de2, coef)
  t1 = e1/de1;
  t2 = e2/de2;
  move_energy = (t1-t2)*coef;
  t = (e1 + e2)/(de1 + de2);
  move_max = t*de2 - t2*de2;
  if (t1>t2)
    if (move_energy>move_max)
      move_energy = move_max;
    endif
  else
    if (move_energy<move_max)
      move_energy = move_max;
    endif
  endif
endfunction

  

data.remain = [fuel.remain_energy];
data.energy= [fireplace.energy];
data.heater = [0];
data.cooker = [0];
data.profit = [0];
data.lost = [0];
data.wasted = [0];
data.temp_fireplace = [25];
data.temp_air = [25];
data.temp_fuel = [25];
data.temp_smoke = [25];
data.air_need = [0];

break_counter = 10;

while fuel.remain_energy > 0
  fuel_part_volume = fuel.remain_energy/fuel.fuel_energy;
  fuel_temp = (fuel.energy/(fuel.degree_energy*fuel_part_volume))+25;
  energy_for_vaporing = 0;
  energy_to_vapor = 0;
  smoke_energy = 0;
  smoke = 1;
  if (fuel_temp>fuel.vaporing_temp)
    energy_for_vaporing = (fuel_temp-fuel.vaporing_temp)*fuel.degree_energy*fuel_part_volume;
    
    surface = power(fuel.remain_energy, 2/3);
    max_energy_to_vapor = surface*fuel.coef_energy_to_vapor;
    if (max_energy_to_vapor>fuel.remain_energy)
      max_energy_to_vapor = fuel.remain_energy;
    endif
    max_vaporing_energy = max_energy_to_vapor*fuel.coef_energy_to_vapor;
    if (energy_for_vaporing>max_vaporing_energy)
      energy_for_vaporing = max_vaporing_energy;
    endif
    
    energy_to_vapor = energy_for_vaporing/fuel.coef_energy_to_vapor;
    
    remain_energy = fuel.remain_energy - energy_to_vapor;
    energy = fuel.energy - energy_for_vaporing;
    fuel.remain_energy = fuel.remain_energy - energy_to_vapor*time_divider;
    fuel.energy = fuel.energy - energy_for_vaporing;
    fuel.energy = fuel.remain_energy*(energy/remain_energy);
    
    if fuel.remain_energy < 0
      fuel.remain_energy = 0;
    endif
    
    # burning
    air_need = energy_to_vapor*fuel.coef_air_need;
    energy_wasted = 0;
    if (air_need > fireplace.air)
      air_need = fireplace.air;
      energy_wasted = (air_need-fireplace.air)/fuel.coef_air_need;
    endif
    energy_profit = air_need/fuel.coef_air_need;
    
    smoke = energy_to_vapor*fuel.coef_smoke_generate + air_need;
    
    # flame to fuel
    smoke_degree_energy = fireplace.air_unit_degree_energy*smoke;
    air_part = air_need/fireplace.air;
    flame_energy = energy_profit;
    fuel_part_volume = fuel.remain_energy/fuel.fuel_energy;
    fuel_temp = (fuel.energy/(fuel.degree_energy*fuel_part_volume))+25;
    fuel_part_surface = power(fuel.remain_energy, 2/3)/power(fuel.fuel_energy, 2/3);
    add_fuel_energy = (fuel.flame_temp-fuel_temp)*fuel.coef_flame_to_fuel*fuel_part_surface;
    coef_flame_to_fuel = fuel.coef_flame_to_fuel*fuel_part_surface;
    fuel_degree_energy = fuel.degree_energy*fuel_part_volume;
    add_fuel_energy = max_move_energy(flame_energy, smoke_degree_energy, fuel.energy, fuel_degree_energy, coef_flame_to_fuel);
    
    fuel.energy = fuel.energy + add_fuel_energy;
    smoke_energy = flame_energy - add_fuel_energy;
    
    coef_part = (fireplace.air-air_need)/(2*smoke+fireplace.air-air_need);
    
    smoke_degree_energy = fireplace.air_unit_degree_energy*smoke;
    air_degree_energy = fireplace.air_unit_degree_energy*fireplace.air;
    coef_smoke_to_air = fireplace.coef_smoke_to_air*coef_part;
    add_air_energy = max_move_energy(smoke_energy, smoke_degree_energy, fireplace.air_energy, air_degree_energy, coef_smoke_to_air);
    smoke_energy = smoke_energy - add_air_energy;
    fireplace.air_energy = fireplace.air_energy + add_air_energy;
  endif
  
  # conduct temp in fireplace
  fuel_degree_energy = fuel.degree_energy*fuel_part_volume;
  coef_fireplace_to_fuel = (fireplace.coef_fuel_transfer+fuel.coef_fireplace_to_fuel)*fuel_part_surface;
  energy_from_fireplace_to_fuel = max_move_energy(fireplace.energy, fireplace.degree_energy, fuel.energy, fuel_degree_energy, coef_fireplace_to_fuel);
  coef_smoke_to_air = fuel.coef_air_to_fuel*fuel_part_surface;
  energy_from_air_to_fuel = max_move_energy(smoke_energy, smoke_degree_energy, fuel.energy, fuel_degree_energy, coef_smoke_to_air);
  fuel.energy = fuel.energy + energy_from_fireplace_to_fuel + energy_from_air_to_fuel;
  fireplace.energy = fireplace.energy - energy_from_fireplace_to_fuel;
  fireplace.air_energy = fireplace.air_energy - energy_from_air_to_fuel;
  
  # conduct to heater, cooker
  smoke_temp = (smoke_energy/(fireplace.air_unit_degree_energy*smoke))+25;
  air_temp = (fireplace.air_energy/(fireplace.air_unit_degree_energy*fireplace.air))+25;
  fireplace_temp = (fireplace.energy/fireplace.degree_energy)+25;
  
  energy_lost = (fireplace_temp-25)*fireplace.coef_air_lost;
  energy_to_air = (fireplace_temp-air_temp)*fireplace.coef_to_air;
  energy_to_heater = (smoke_temp - heater_temp)*fireplace.coef_smoke_to_heater;
  energy_to_cooker = (smoke_temp - cooker_temp)*fireplace.coef_smoke_to_cooker;
  
  fireplace.energy = fireplace.energy - energy_lost - energy_to_air;
  fireplace.air_energy = fireplace.air_energy + energy_to_air;
  
  data.remain(end+1) = fuel.remain_energy;
  data.energy(end+1) = fireplace.energy;
  data.heater(end+1) = energy_to_heater;
  data.cooker(end+1) = energy_to_cooker;
  data.profit(end+1) = energy_profit;
  data.lost(end+1) = energy_lost;
  data.wasted(end+1) = energy_wasted;
  data.temp_fireplace(end+1) = (fireplace.energy/fireplace.degree_energy)+25;
  data.temp_air(end+1) = (fireplace.air_energy./(fireplace.air_unit_degree_energy*fireplace.air))+25;
  data.temp_fuel(end+1) = (fuel.energy/(fuel.degree_energy*fuel_part_volume))+25;
  data.temp_smoke(end+1) = smoke_temp;
  data.air_need(end+1) = air_need;
  
  if (fireplace.energy<=0) || ((data.remain(end-1)-data.remain(end))<=0)
    break_counter--;
  endif
  if (break_counter==0)
    break
  endif
endwhile

printPlots(data)
