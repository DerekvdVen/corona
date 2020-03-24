plot_cases = function(country,dataset){
  data_subset = subset(data, `Countries and territories` == country)
  
  ggplot(data_subset, aes(DateRep)) + 
    geom_line(aes(y = Deaths, colour = "Deaths"),size= 2) + 
    geom_line(aes(y = Cases, colour = "Cases"),size = 2)
  
  
}

plot_countries = function(countrylist,dataset,Deaths_or_Cases){
  data_subset = subset(data, `Countries and territories` %in% countrylist)
  
  ggplot(data_subset, aes(DateRep)) + 
    geom_line(aes_string(y = Deaths_or_Cases, colour = "`Countries and territories`"),size= 2)
}
