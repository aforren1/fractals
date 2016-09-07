library(RSelenium)
library(stringr)

RSelenium::startServer()
filename <- 'file:///home/aforrence/Documents/BLAM/fractals/AF_MACHINE.html#'
dat <- expand.grid(angle = str_pad(seq(0, 180, 45), 4, pad = 0),
                   skew = str_pad(seq(0, 60, 20), 4, pad = 0),
                   sides = 3,
                   bumper = c(1, 2),
                   mirror = c(0, 1),
                   pointy = 0,
                   fractal = c(0, 1))
dat_args <- c(dat, sep = ',')
dat_names <- c(dat, sep = '_')
dat <- do.call(paste, dat_args)
dat_names <- do.call(paste, dat_names)
rem_dr <- remoteDriver(remoteServerAddr = 'localhost',
                       port = 4444,
                       browserName = 'firefox')

rem_dr$open()
rem_dr$setWindowSize(600, 671)
# scroll one in (zoom)

for (ii in 1:length(dat)) {
  rem_dr$navigate(paste0(filename, dat[ii]))
  if(ii == 1) {
      canvas$sendKeysToElement(list('h'))
  }
  canvas <- rem_dr$findElement(using = 'id', 'main')
  rem_dr$screenshot(file = paste0('~/Documents/BLAM/fractals/out/', dat_names[ii], '.png'))
}

rem_dr$close()



