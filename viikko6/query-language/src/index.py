from statistics import Statistics
from player_reader import PlayerReader
from matchers import And, HasAtLeast, PlaysIn, HasFewerThan, Not, All, Or

def main():
    url = "https://studies.cs.helsinki.fi/nhlstats/2023-24/players.txt"
    reader = PlayerReader(url)
    stats = Statistics(reader)

    matcher = And(
        HasAtLeast(5, "goals"),
        HasAtLeast(20, "assists"),
        PlaysIn("PHI")
    )

    for player in stats.matches(matcher):
        print(player)

    matcher = And(
        HasFewerThan(2, "goals"),
        PlaysIn("NYR")
    )

    for player in stats.matches(matcher):
        print(player)


    filtered_with_all = stats.matches(All())
    print(len(filtered_with_all))


    matcher = And(
        HasAtLeast(70, "points"),
        Or(
            PlaysIn("NYR"),
            PlaysIn("FLA"),
            PlaysIn("BOS")
        )
    )
    
    for player in stats.matches(matcher):
        print(player)

if __name__ == "__main__":
    main()
