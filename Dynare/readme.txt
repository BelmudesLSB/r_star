Steps to run rstar model

1. Load data
	gya   = 400*log(RGDP(t)/RGDP(t-1)), RGDP: real GDP
	pia  = 400*log(DGDP(t)/DGDP(t-1)), DGDP: GDP Deflator
	iras = Nominal policy rate (annual rate) or shadow policy rate.

2. run rstar_afe_shadow_gdp_new.mod

3. execute run_post.m