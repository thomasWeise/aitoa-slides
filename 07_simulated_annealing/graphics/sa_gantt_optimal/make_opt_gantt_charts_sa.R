library(aitoaEvaluate);

files <- c("sa_exp_20_0d0000004_1swap_la24_0x342a1bca030631eb.txt",
           "sa_exp_20_0d0000008_1swap_la24_0xe9a172d90d9947f3.txt");

makespan.sa   <- c(946L, 946L);
makespan.opt  <- c(935L, 935L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  v <- components[[4L]];
  v <- as.character(substr(v, 4L, nchar(v)))[[1L]];
  v <- as.integer(v);
  name <- paste0("gantt_sa_20_", v, "em7_la24_opt");
  data <- aitoa.load.result.from.log.file(file);
  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.sa[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0("la24 / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.sa[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.opt[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0("la24 / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.opt[[i]]));
    });
  }
}
