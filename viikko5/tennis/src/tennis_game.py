class TennisGame:
    def __init__(self, player1_name, player2_name):
        self.player1 = player1_name
        self.player2 = player2_name
        self.score1 = 0
        self.score2 = 0

    def won_point(self, player_name):
        if player_name == self.player1:  
            self.update_score1()
        else:
            self.update_score2()

    def update_score1(self):
        self.score1 += 1
            
    def update_score2(self):
        self.score2 += 1

    def get_score(self):
        score = ""

        if self.score1 == self.score2:
            points = self.score1
            score = self.even_score(points)

        elif self.score1 >= 4 or self.score2 >= 4:
            minus_result = self.score1 - self.score2
            score = self.advantage_score(minus_result)

        else:
            score1 = self.score1
            score2 = self.score2
            score = self.regular_score(score1, score2)

        return score

    def even_score(self, points):
        if points == 0:
            return "Love-All"
        elif points == 1:
            return "Fifteen-All"
        elif points == 2:
            return "Thirty-All"
        else:
            return "Deuce"
    
    def advantage_score(self, minus_result):
        if minus_result == 1:
            return "Advantage player1"
        elif minus_result == -1:
            return "Advantage player2"
        elif minus_result >= 2:
            return "Win for player1"
        else:
            return "Win for player2"
        
    def regular_score(self, score1, score2):
        temp_score = 0
        scores = ""
        for i in range(1, 3):
            if i == 1:
                temp_score = score1
            else:
                scores = scores + "-"
                temp_score = score2

            if temp_score == 0:
                scores = scores + "Love"
            elif temp_score == 1:
                scores = scores + "Fifteen"
            elif temp_score == 2:
                scores = scores + "Thirty"
            elif temp_score == 3:
                scores = scores + "Forty"
        return scores