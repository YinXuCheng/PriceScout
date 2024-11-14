float calculateAttractionPercentage(float price, float maxPrice, float rating, float maxRating, float competition, float maxCompetition, float customerBudget) {
    float attractionScore;
    if (customerBudget < price) {
        return 0; 
    }

    float budgetFactor = min(1, (customerBudget - price) / (maxPrice - price));
    float priceScore = 1 - (price / maxPrice);    
    float ratingScore = rating / maxRating;              
    float competitionScore = 1 - (competition / maxCompetition); 

    float priceWeight = 0.3;
    float ratingWeight = 0.3;
    float competitionWeight = 0.2;
    float budgetWeight = 0.2;

    attractionScore = (priceScore * priceWeight) + (ratingScore * ratingWeight) + (competitionScore * competitionWeight) + (budgetFactor * budgetWeight);

    return constrain(attractionScore * 100, 0, 100);
}
