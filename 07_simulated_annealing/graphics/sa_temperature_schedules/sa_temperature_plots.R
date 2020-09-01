library(aitoaEvaluate);

width <- 6;
height <- 3;

x.lim   <- as.integer(c(1L, 3e7));
tau <- aitoa.sa.generate.tau(x.lim[[2L]]);

schedules <- c("exp_20_0.00000005",
               "exp_20_0.0000001",
               "exp_20_0.00000015",
               "exp_20_0.0000002",
               "exp_20_0.0000004",
               "exp_20_0.0000008");
epsilon <- c(5e-8, 1e-7, 1.5e-7,
             2e-7, 4e-7, 8e-7);
deltaE <- c(1L, 2L, 3L, 5L, 10L, 50L);

frame <- unlist(list(list(tau=tau),
                     lapply(seq_along(schedules),
                            function(i) {
                              name <- schedules[[i]];
                              eps <- epsilon[[i]];
                              T <- aitoa.sa.T.exp(Ts=20L, epsilon=eps, tau=tau);
                              res <- list();
                              res[[name]] <- T;
                              for(d in deltaE) {
                                nn <- paste0("P", d, "_", name);
                                res[[nn]] <- aitoa.sa.P(d, T);
                              }
                              return(res);
                            })),
                recursive = FALSE);

frame <- do.call(data.frame, frame);
stopifnot(nrow(frame) > 1L);

x.ticks <- as.integer(10L^(0L:7L));

x.tick.ch <- as.expression(lapply(x.ticks,
                                  function(tick) {
                                    if(tick<=10L) { return(tick); }
                                    t <- as.integer(floor(log10(tick)));
                                    return(substitute(10^t, list(t=t)))
                                  }));

x.grid <- x.ticks;

x.ticks2 <- sort(unique(as.integer(x.lim[2L] * 0.2 * 0L:5L)));
x.ticks2[x.ticks2 < 1] <- 1;
x.ticks2 <- sort(unique(x.ticks2));
x.tick2.ch <- as.expression(lapply(x.ticks2,
                                   function(tick) {
                                     if(tick<=10L) { return(tick); }
                                     t <- as.integer(floor(log10(tick)));
                                     if(as.integer(tick / (10L^t)) != (tick / (10L^t))) {
                                       t <- t - 1L;
                                     }
                                     v <- as.integer(tick / as.integer(10L^t));
                                     stopifnot( (v*10^t)== tick);
                                     if(v == 1L) {
                                       return(substitute(10^t, list(t=t)))
                                     }
                                     return(substitute(paste(v,"*",10^t), list(v=v, t=t)))
                                   }));
x.grid2 <- x.ticks2;

t.lim   <- as.integer(c(0L, 20L));
t.ticks <- as.integer(4L * (0L:5L));
t.grid  <- as.integer(2L*(0L:10L));

p.lim   <- as.integer(c(0L, 1L));
p.ticks <- 0.2 * as.integer(0L:5L);
p.grid  <- 0.1 * as.integer(0L:10L);

stopifnot(sum(colnames(frame) %in% schedules) == length(schedules));

colors <- aitoa.distinct.colors(length(schedules));

names <- as.expression(c(
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(5, "*", 10^-8)) ^ {tau - 1}})),
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(1, "*", 10^-7)) ^ {tau - 1}})),
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(1.5, "*", 10^-7)) ^ {tau - 1}})),
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(2, "*", 10^-7)) ^ {tau - 1}})),
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(4, "*", 10^-7)) ^ {tau - 1}})),
  expression(paste("exponential: ", T(tau), "=", 20 * {(1 - paste(8, "*", 10^-7)) ^ {tau - 1}}))
));

names2 <- as.expression(c(
  expression(paste(epsilon, "=", 5, "*", 10^-8, "\u00a0\u00a0")),
  expression(paste(epsilon, "=", 1, "*", 10^-7, "\u00a0\u00a0")),
  expression(paste(epsilon, "=", 1.5, "*", 10^-7)),
  expression(paste(epsilon, "=", 2, "*", 10^-7, "\u00a0\u00a0")),
  expression(paste(epsilon, "=", 4, "*", 10^-7, "\u00a0\u00a0")),
  expression(paste(epsilon, "=", 8, "*", 10^-7, "\u00a0\u00a0"))
));


for(type in c("svg", "pdf")) {
  aitoa.graphic(name="sa_temperature", skip.if.exists = FALSE,
                type=type, width=width, height=height, body={

par(mar=c(1.8, 2.2, 0.034, 0.034));

plot(x=x.lim,
     y=t.lim,
     xlim=x.lim,
     ylim=t.lim,
     type="n",
     log="x",
     xlab = NA,
     ylab = NA,
     xaxt="n",
     yaxt="n");

abline(v = x.grid, h = t.grid, col = "lightgray", lty = 1, lwd=1);

axis(side=1, at=x.ticks, labels=x.tick.ch);
axis(side=2, at=t.ticks, labels=as.character(t.ticks), las=1L);

for(i in seq_along(schedules)) {
  lines(x=unname(unlist(frame$tau)),
        y=unname(unlist(frame[schedules[i]])),
        col=colors[[i]],
        lwd=2L)
}

mtext(text=expression(tau),    side=1, at=x.lim[2L],     adj=1, line=1.0, cex=0.9);
mtext(text=expression(T(tau)), side=2, at=0.9*t.lim[2L], adj=1, line=0.5, cex=0.9, las=1L);

aitoa.legend.main(x="bottomleft",
                  legend=names,
                  col=colors,
                  lwd=2L,
                  seg.len=3L);
                });}

for(P in c(1L, 3L, 10L, 50L)) {
  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0("sa_probability_", P),
                  skip.if.exists = FALSE,
                  type=type, width=width, height=height, body={
  par(mar=c(if(P>=10) 2.25 else 1.8,
            2.7,
            if(P==1) 1.8 else 0.5,
            0.034));

  plot(x=x.lim,
       y=p.lim,
       xlim=x.lim,
       ylim=p.lim,
       type="n",
       #      log="x",
       xlab = NA,
       ylab = NA,
       xaxt="n",
       yaxt="n");

  abline(v = x.grid2, h = p.grid, col = "lightgray", lty = 1, lwd=1);

  axis(side=1, at=x.ticks2, labels=x.tick2.ch);
  axis(side=2, at=p.ticks, labels=as.character(p.ticks), las=1L);

  for(i in seq_along(schedules)) {
    lines(x=unname(unlist(frame$tau)),
          y=unname(unlist(frame[paste("P", P, "_", schedules[i], sep="", collapse="")])),
          col=colors[[i]],
          lwd=2L)
  }
  legend(x=if(P <= 1) "bottomleft" else "topright",
         legend=names2,
         col=colors,
         text.col = colors,
         bty="n",
         adj=c(0.25,0.1));

  mtext(text=expression(tau),    side=1, at=x.lim[2L]*0.9,     adj=1, line=1.0, cex=0.9);

  if(P == 1L) {
    mtext(text=as.expression(substitute(paste(P(paste("accept ", Delta, E, "=", y)), "=", e^{-y/T(tau)}), list(y=P))), side=2,
          at=1.12*p.lim[2L], adj=0,
          line=-1, cex=0.9, las=1);
  } else {
    mtext(text=as.expression(substitute(paste(P(paste("accept ", Delta, E, "=", y)), "=", e^{-y/T(tau)}), list(y=P))), side=2, at=0.95*p.lim[2L], adj=0, line=-1, cex=0.9, las=1);
  }


  });}}
