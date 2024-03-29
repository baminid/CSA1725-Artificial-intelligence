# Define a function to calculate entropy
def calculate_entropy(data):
    classes = list(set(data))
    entropy = 0
    total_samples = len(data)
    
    for cls in classes:
        probability = data.count(cls) / total_samples
        entropy -= probability * math.log2(probability)
    
    return entropy

# Define a function to split data based on a given feature and value
def split_data(feature, value, dataset):
    left, right = [], []
    
    for data in dataset:
        if data[feature] < value:
            left.append(data)
        else:
            right.append(data)
    
    return left, right

# Define a function to find the best split point for a given dataset
def find_best_split(dataset):
    best_entropy = float('inf')
    best_feature, best_value = -1, -1
    
    for feature in range(len(dataset[0]) - 1):
        for data in dataset:
            left, right = split_data(feature, data[feature], dataset)
            entropy = (len(left) / len(dataset)) * calculate_entropy(left) + (len(right) / len(dataset)) * calculate_entropy(right)
            
            if entropy < best_entropy:
                best_entropy = entropy
                best_feature = feature
                best_value = data[feature]
    
    return best_feature, best_value

# Define a function to build the decision tree recursively
def build_tree(dataset, depth):
    classes = [data[-1] for data in dataset]
    
    # Check for stopping conditions
    if len(set(classes)) == 1:
        return classes[0]
    
    if depth == max_depth:
        return max(set(classes), key=classes.count)
    
    if len(dataset) == 0:
        return max(set(classes), key=classes.count)
    
    # Find the best split point
    best_feature, best_value = find_best_split(dataset)
    
    # Split the dataset
    left, right = split_data(best_feature, best_value, dataset)
    
    # Build subtrees
    left_subtree = build_tree(left, depth + 1)
    right_subtree = build_tree(right, depth + 1)
    
    return {'feature': best_feature, 'value': best_value, 'left': left_subtree, 'right': right_subtree}

# Define a function to make predictions
def predict(tree, data):
    if data[tree['feature']] < tree['value']:
        if isinstance(tree['left'], dict):
            return predict(tree['left'], data)
        else:
            return tree['left']
    else:
        if isinstance(tree['right'], dict):
            return predict(tree['right'], data)
        else:
            return tree['right']

# Define a function to evaluate the accuracy of the decision tree
def evaluate_accuracy(tree, test_data):
    correct_predictions = 0
    
    for data in test_data:
        prediction = predict(tree, data)
        if prediction == data[-1]:
            correct_predictions += 1
    
    return correct_predictions / len(test_data)

# Define the dataset (Example: XOR dataset)
dataset = [
    [0, 0, 0],
    [0, 1, 1],
    [1, 0, 1],
    [1, 1, 0]
]

# Define the maximum depth of the decision tree
max_depth = 2

# Build the decision tree
tree = build_tree(dataset, 0)

# Test the decision tree
accuracy = evaluate_accuracy(tree, dataset)
print("Accuracy:", accuracy)
