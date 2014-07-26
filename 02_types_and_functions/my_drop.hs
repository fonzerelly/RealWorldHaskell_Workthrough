my_drop num list = if num <= 0 || null list
   then list
   else my_drop(num-1)(tail list)
