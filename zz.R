
library(tidyverse)
library(koscrap)
library(dlookr)

# 아파트실거래 정보 API 인증키
auth_key <- "GzvFwOwkHDJDfbM5btVoyXf5HAjspv8CC0KO6whIyZzhBoBRBv6UqYU1M7s%2FOFG36V7UPOTscpoimtHA1JE5rw%3D%3D"

# 노원구 코드
cty_cd <- "11350"

# 거래월
deal_yms <- seq(as.Date("2006-01-01"), as.Date("2022-09-01"), by = "month") %>% 
  format("%Y%m")
deal_yms
trade_nowon <- deal_yms %>% 
  purrr::map_df({
    function(x) {
      trade_apt(auth_key, LAWD_CD = cty_cd, 
                DEAL_YMD = x, chunk = 300,  do_done = TRUE)
    }
  })
dim(trade_nowon)

