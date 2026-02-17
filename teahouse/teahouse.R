flavor <- readline('Light or Bold flavor? ')
caffeine <- readline('Do you want caffeine? ')
if (flavor != 'Light' && flavor != 'Bold') {
  print('Flavor should be either Light or Bold')
}else if (caffeine != 'Yes' && caffeine != "No"){
  print('Caffeine should be either Yes or No')
}else if (flavor == 'Light' && caffeine == 'Yes'){
  print('green tea.')
}else if (flavor == 'Bold' && caffeine == 'Yes'){
  print('black tea.')
}else if (flavor == 'Light' && caffeine == 'No'){
  print('chamomile tea.')
}else if (flavor == 'Bold' && caffeine == 'No'){
  print('rooibos tea.')
}
