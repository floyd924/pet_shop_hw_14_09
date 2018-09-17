def pet_shop_name(pet_shop)
  return pet_shop[:name]
end



def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, change_in_cash)
   pet_shop[:admin][:total_cash] += change_in_cash
  return total_cash(pet_shop)
end
#can I store pet_shop[:admin][:total_cash] as a variable for DRY?

def pets_sold(pet_shop)
  num_sold = pet_shop[:admin][:pets_sold]
  return num_sold
end

#should I, at a later point, include a
# pet_shop[:pets].length - original length??
# see "stock count" on line 32-ish


def increase_pets_sold(pet_shop, how_many_sold)
  pet_shop[:admin][:pets_sold] += how_many_sold
end
#can I store pet_shop[:admin][:pets_sold] as a variable so code is DRY?

def stock_count(pet_shop)
  number_of_pets = pet_shop[:pets].length
  return number_of_pets
end

#make an empty array
#if breed = british shorthair, push to array
#return the array, because .count is in the test

def pets_by_breed(pet_shop, breed)
  breed_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_array.push(pet[:name])
    end
  end
  return breed_array
end



def find_pet_by_name(pet_shop, name_given)
  for pet in pet_shop[:pets]
    if pet[:name] == name_given
      return pet
    end
  end
  return nil
end

#just return pet, not return pet[:name]
#because the test then takes the pet
#and draws the name itself

#yeeeeeah so happy I got that one.
#I'm the bosssssss


def remove_pet_by_name(pet_shop, name_given)
#we must delete arthur and return nothing

  for pet in pet_shop[:pets]
    if pet[:name] == name_given
      #delete the pet specified
      #delete array item that doesn't have a name

      pet_shop[:pets].delete(pet)
    end
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer_id)
  return customer_id[:cash]
end

def remove_customer_cash(person, amount_spent)
  person[:cash] -= amount_spent
  return person[:cash]
end
#########################################
#cutomer variable defined on line 158 of spec
#could I use 'customer' instead of 'person?'


def customer_pet_count(customer)
  pet_count = customer[:pets].count
  return pet_count
end



def add_pet_to_customer(person, new_pet)
  person[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
  customer_money = customer[:cash]
  pet_price = pet[:price]
  if customer_money >= pet_price
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet_hash, customer_hash)

  for pet_desired in pet_shop[:pets]
    #if the pet exists && your money > value of pet
    if pet_desired == pet_hash && customer_cash(customer_hash) >= pet_hash[:price]
      ##########################why did it error when we defined value of pet outside the for loop??

      #add a pet to the customer [:pets]
      # customer_hash[:pets].push(pet_hash) # we could shorten this and include the 'add pet to customer' method above
      add_pet_to_customer(customer_hash, pet_hash)

      #increase (pet_shop)pets_sold by 1
      # pet_shop[:admin][:pets_sold] += 1 #again we could call a method above for this
      increase_pets_sold(pet_shop, 1)

      #subtract the value of the pet from the money of the customer
      value_of_pet = pet_hash[:price]
      # customer_hash[:cash] -= value_of_pet
      remove_customer_cash(customer_hash, value_of_pet)

      #add the value of the pet to the money in the shop
      # pet_shop[:admin][:total_cash] += value_of_pet
      add_or_remove_cash(pet_shop, value_of_pet)

      #return nothing
    end
  end

end






#
