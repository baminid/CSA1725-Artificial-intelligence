class VacuumCleaner:
    def __init__(self, location, dirt_locations):
        self.location = location
        self.dirt_locations = dirt_locations

    def act(self):
        if self.location in self.dirt_locations:
            self.dirt_locations.remove(self.location)
            return "clean"
        nearest_dirt_location = min(self.dirt_locations, key=lambda dirt_location: abs(dirt_location - self.location))
        self.location = nearest_dirt_location
        return "move"

def main():
    vacuum_cleaner = VacuumCleaner(0, [1, 2])

    while vacuum_cleaner.dirt_locations:
        action = vacuum_cleaner.act()
        print(action)

    print("All dirt locations cleaned!")

if __name__ == "__main__":
    main()
