# T1T2-histories-and-offresp

## Making Database
#### Set 1
1. Run `rechecking_units_db_all_animals.m`  to get an important var - `all_animals_response_cell_arr `
2. Run `cells_rates_sig_gap_change.m` to calculate signficance values . Important var - `all_units_analysis`

#### Set 2
1. Run `make_db_second_set_data.m`. Important var - `all_animals_response_cell_arr`
2. Run `second_set_gap_change_cells_rate_sig.m `. Imp Var - `all_units_analysis`

## Rates at re BF(f and BF are how many octaves apart)
#### Files with BF F and filename
- `t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat` - set 1 contains BF F filename
- `t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat`  - set 2 contains BF F filename

#### Files with rates and sig vals
- `set1_rates_and_sig.mat` - set 1 - 299 units
- `set2_rates_and_sig.mat` - set 2 - 259 units

- analysis code to make figures - rate at re BF at different gaps and different histories - `analyse_re_bf_rates.m`. Corresponding [figures link](https://docs.google.com/presentation/d/1YnXIZMT2-KRMjQ2-RVSNqCC7NJES12hL4gnLnyynIrI/edit?usp=sharing) 


