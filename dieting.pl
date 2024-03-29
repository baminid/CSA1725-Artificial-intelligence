% Define the diet suggestions based on different diseases
diet_suggestions(heart_disease, ['Increase intake of fruits and vegetables.', 'Limit intake of saturated fats and cholesterol.', 'Reduce sodium intake.']).
diet_suggestions(diabetes, ['Monitor carbohydrate intake.', 'Choose whole grains over refined grains.', 'Limit sugary beverages and sweets.']).
diet_suggestions(hypertension, ['Reduce sodium intake.', 'Increase intake of potassium-rich foods.', 'Limit alcohol consumption.']).
diet_suggestions(obesity, ['Limit calorie intake.', 'Increase physical activity.', 'Focus on whole, nutrient-dense foods.']).
diet_suggestions(_, ['Consult with a healthcare professional for personalized diet recommendations.']).

% Predicate to suggest diet based on disease
suggest_diet(Disease, Suggestions) :-
    diet_suggestions(Disease, Suggestions), !.
suggest_diet(_, Suggestions) :-
    diet_suggestions(_, Suggestions).
