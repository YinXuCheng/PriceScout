float calculateAttractionPercentage(float price, float maxPrice, float rating, float maxRating, float competition, float maxCompetition, float customerBudget) {
    float attractionScore; // Define attraction varible
    if (customerBudget < price) { // if customer does not have enough money return 0
        return 0; 
    }

    float priceScore = 1 - (price / maxPrice); // the less the price the smaller the fraction and hence the larger the price score
    float ratingScore = rating / maxRating; // the higher the rating the higher the score
    float competitionScore = 1 - (competition / maxCompetition); // the less competiton the smaller the fraction and the larger the score

    float priceWeight = 0.6; // weights used in calculation
    float ratingWeight = 0.2;
    float competitionWeight = 0.2;
    
    // Calculate attraction just like grades, price score + rating score + competiton score with their respective weight
    attractionScore = (priceScore * priceWeight) + (ratingScore * ratingWeight) + (competitionScore * competitionWeight);
    return constrain(attractionScore * 100, 0, 100); // return the score as a number between 0 to 100
    // constrain is used to prevent scores such as 110 as it does not make sense
}
