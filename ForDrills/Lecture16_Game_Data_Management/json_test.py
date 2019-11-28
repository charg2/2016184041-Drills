import json
import pickle

numbers = [1,2,3,4]
numbers_string = json.dumps(numbers)
print(numbers_string)

number2 = [];
number2 = list(numbers);
print(number2);
print(type(str(number2)));
print(str(number2));

values_string = '{"x":10, "y":20, "size":4.5}'
values = json.loads(values_string)
print(type(values))


with open('ranking.json', 'wb') as f:
    
    for i in range(10):
       numbers.append(i);

    numbers.sort();
    pickle.dump(numbers, f);

    #print(f);

print("----------------------------------")
with open('ranking.json', 'rb') as f:
    ranking = pickle.load(f);
    print(ranking);

