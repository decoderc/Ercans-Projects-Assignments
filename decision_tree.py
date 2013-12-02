def create_decision_tree(data, attributes, target_attr, fitness_func):
    
    data    = data[:]
    vals    = [record[target_attr] for record in data]
    default = majority_value(data, target_attr)

    #Eğer veri kümesi veya özellikler listesi boş ise varsayılan(default) değeri döndür.
    #Boşluk için özellikler listesini kontrol ettiğimizde hedeflenen özellikten 1 çıkarmamız gerekir. 
	
    if not data or (len(attributes) - 1) <= 0:
        return default
		
    #Veri kümesindeki tüm kayıtlar aynı sınıflamaya sahipse bu sınıflamayı değerlendir.
	
    elif vals.count(vals[0]) == len(vals):
        return vals[0]
    else:
	
        #Verimizi en iyi sınıflandırma ile bir sonraki en iyi özelliği(attribute) seç.
		
        best = choose_attribute(data, attributes, target_attr,
                                fitness_func)

        # Create a new decision tree/node with the best attribute and an empty
        # dictionary object--we'll fill that up next.
        tree = {best:{}}
		

        #En iyi özellik ve boş bir sözlük ile yeni bir ağaç oluştur.
		
        for val in get_values(data, best):
		
            #En iyi özellik alanında her bir değer için yeni bir ağaç oluştur.
			
            subtree = create_decision_tree(
                get_examples(data, best, val),
                [attr for attr in attributes if attr != best],
                target_attr,
                fitness_func)

            # Yeni ağacımıza boş sözlük nesneleri için bir alt ağaç ekle.
			
            tree[best][val] = subtree

    return tree
