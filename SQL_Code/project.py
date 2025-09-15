import pymysql
import subprocess as sp

# Database Connection
def connect_to_database(host, user, password, db):
    try:
        connection = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=db,
            cursorclass=pymysql.cursors.DictCursor
        )
        print("Connected to the database.")
        return connection
    except Exception as e:
        print("Connection Refused:", e)
        return None

def execute_query(connection, query, params=None):
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, params)
            connection.commit()
            return cursor.fetchall()
    except Exception as e:
        print("Error executing query:", e)
        return None


def update_production_house(connection):
    try:
        query = "SELECT * FROM Production_House"
        results = execute_query(connection, query)
        if results:
            for row in results:
                print(row)
        else:
            print("No Production Houses found.")
        print("\n-- Update Production House --")
        studio_id = input("Enter the Studio ID to update: ")
        if not studio_id.isdigit():
            print("Invalid Studio ID.")
            return

        # Prompt the user for the attribute to update
        attribute = input("Enter the attribute to update (Name, Owner_Name): ").strip()
        
        # Validate the attribute
        valid_attributes = ["Name", "Owner_Name"]
        if attribute not in valid_attributes:
            print(f"Invalid attribute. Choose from {valid_attributes}.")
            return

        # Get the new value for the attribute
        new_value = input(f"Enter the new value for {attribute}: ").strip()
        if new_value == "":
            print("Value cannot be empty.")
            return

        # Build the query dynamically
        query = f"UPDATE Production_House SET {attribute} = %s WHERE Studio_ID = %s"
        params = (new_value, int(studio_id))

        # Execute the update query
        if execute_query(connection, query, params) is not None:
            print("Production House updated successfully!")
    except Exception as e:
        print("Error updating Production House:", e)


# Movie Database Functions
def add_movie(connection):
    try:
        print("\n-- Add Movie --")
        movie_data = {
            "title": input("Title: "),
            "tag_name": input("Tag: ") or None,
            "release_date": input("Release Date (YYYY-MM-DD): "),
            "duration": int(input("Duration (in minutes): ")),
            "budget": float(input("Budget: ")) or None,
            "collections": float(input("Collections: ")) or None,
            "studio_id": input("Studio ID: "), 
            "sequel_id": input("Sequel ID (Optional): ") or None
        }
        for val in movie_data.values():
            if val == "NULL" or val == "NA":
                val = None
        query = """
        INSERT INTO Movie (Movie_Name, Tag_Name, Release_Date, Duration, Budget, Collections, Studio_ID, Sequel_ID)
        VALUES ( %s, %s, %s, %s, %s, %s, %s, %s)
        """
        if execute_query(connection, query, tuple(movie_data.values())) != None:
            print("Movie added successfully!")
    except Exception as e:
        print("Error adding movie:", e)
        
def update_movie(connection):
    try:
        print("\n-- Update Movie --")
        movie_id = input("Enter the Movie ID to update: ")
        if not movie_id.isdigit():
            print("Invalid Movie ID.")
            return
        
        # Prompt the user for the attribute to update
        attribute = input("Enter the attribute to update (Movie_Name, Tag_Name, Collections, Released_Languages): ").strip()
        
        # Validate the attribute
        valid_attributes = ["Movie_Name", "Tag_Name", "Collections", "Released_Languages"]
        if attribute not in valid_attributes:
            print(f"Invalid attribute. Choose from {valid_attributes}.")
            return
        
        # Get the new value for the attribute
        new_value = input(f"Enter the new value for {attribute}: ").strip()
        if attribute == "Collections":
            if not new_value.isdigit():
                print("Collections must be a numeric value.")
                return
            new_value = int(new_value)  # Convert to int if it's Collections
        
        # Build the query dynamically
        query = f"UPDATE Movie SET {attribute} = %s WHERE Movie_ID = %s"
        params = (new_value, int(movie_id))
        
        # Execute the update query
        if execute_query(connection, query, params) != None:
            print("Movie updated successfully!")
    except Exception as e:
        print("Error updating movie:", e)

def delete_trailer(connection):
    try:
        print("\n-- Delete Trailer --")
        trailer_id = input("Enter Trailer ID: ")
        query = "DELETE FROM Trailer WHERE Trailer_ID = %s"
        if execute_query(connection, query, (trailer_id,)) != None:
            print("Trailer deleted successfully!")
    except Exception as e:
        print("Error deleting Trailer:", e)


# Movie Analysis Functions
def analysis1(connection):
    try:
        query = """
                    SELECT Production_House.Name
                    FROM Production_House
                    JOIN Movie ON Production_House.Studio_ID = Movie.Studio_ID
                    WHERE Movie.Collections > (
                        SELECT AVG(Collections)
                        FROM Movie
                        WHERE Release_Date >= DATE_SUB(CURRENT_DATE, INTERVAL 4 YEAR)
                    )
                    GROUP BY Production_House.Name
                    HAVING COUNT(Movie.Movie_ID) >= 3;
                """
        results = execute_query(connection, query)
        if results!=None:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in analysis1:", e)


def analysis2(connection):
    try:
        query = """
                    SELECT Genre, Category_Award.Category, COUNT(Award.Award_Name) AS Award_Count
                    FROM Genre_Movie
                    JOIN Movie ON Genre_Movie.Movie_ID = Movie.Movie_ID
                    JOIN Award ON Award.Movie_ID = Movie.Movie_ID
                    JOIN Category_Award ON Category_Award.Award_Name = Award.Award_Name
                    GROUP BY Genre, Category_Award.Category;
                """
        results = execute_query(connection, query)
        if results!=None:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in analysis2:", e)


# Movie Selection Functions
def selection1(connection):
    try:
        actor_name = input("Enter actor name: ")
        query = """
                SELECT Distinct Char_acter.Character_Name
                FROM Char_acter
                JOIN Actor ON Char_acter.Actor_ID = Actor.Actor_ID
                WHERE Actor.Name = %s;
                """
        
        results = execute_query(connection, query, (actor_name,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in selection1:", e)


def selection2(connection):
    try:
        genre = input("Enter genre: ")
        query = """
                SELECT DISTINCT Actor.Name
                FROM Actor
                JOIN ACTED_IN ON Actor.Actor_ID = ACTED_IN.Actor_ID
                JOIN Movie ON ACTED_IN.Movie_ID = Movie.Movie_ID
                JOIN Genre_Movie ON Movie.Movie_ID = Genre_Movie.Movie_ID
                WHERE Genre = %s;
                """
        results = execute_query(connection, query, (genre,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in selection2:", e)


# Movie Projection Functions
def projection1(connection):
    try:
        movie_count = input("Enter movie count: ")
        query = """
                SELECT Actor.Name
                FROM Actor
                JOIN ACTED_IN ON Actor.Actor_ID = ACTED_IN.Actor_ID
                GROUP BY Actor.Name
                HAVING COUNT(ACTED_IN.Movie_ID) >= %s;
                """
        results = execute_query(connection, query, (movie_count,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in projection1:", e)


def projection2(connection):
    try:
        department = input("Enter department: ")
        query = """
                SELECT Name
                FROM Technician
                WHERE Department = %s;
                """
        results = execute_query(connection, query, (department,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in projection2:", e)


# Movie Search Functions
def search2(connection):
    try:
        movie_name = input("Enter movie name to search for: ")
        query = """
                SELECT Movie_Name, Tag_Name
                FROM Movie
                WHERE Movie_name LIKE %s;
                """
        param = f"%{movie_name}%"
        results = execute_query(connection, query, (param,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in search2:", e)


def search1(connection):
    try:
        technician_name = input("Enter technician name to search for: ")
        query = """
                SELECT Name
                FROM Technician
                WHERE Name LIKE %s;
                """
        param = f"%{technician_name}%"
        results = execute_query(connection, query, (param,))
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in search1:", e)


# Movie Aggregation Functions
def aggregation1(connection):
    try:
        query = """
                SELECT Production_House.Name, MAX(Movie.Collections - Movie.Budget) AS Max_Profit
                FROM Production_House
                JOIN Movie ON Production_House.Studio_ID = Movie.Studio_ID
                GROUP BY Production_House.Name;
                """
        results = execute_query(connection, query)
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in aggregation1:", e)


def aggregation2(connection):
    try:
        query = """
                SELECT Genre, COUNT(*) AS Total_Movies
                FROM Genre_Movie
                GROUP BY Genre;
                """
        results = execute_query(connection, query)
        if results:
            for idx, row in enumerate(results):
                print(idx + 1, row)
    except Exception as e:
        print("Error in aggregation2:", e)

def update_trailer(connection):
    try:
        print("\n-- Update Trailer --")
        trailer_id = input("Enter the Trailer ID to update: ")
        if not trailer_id.isdigit():
            print("Invalid Trailer ID.")
            return

        # Prompt the user for the attribute to update
        attribute = input("Enter the attribute to update (Views, Duration): ").strip()

        # Validate the attribute
        valid_attributes = ["Views", "Duration"]
        if attribute not in valid_attributes:
            print(f"Invalid attribute. Choose from {valid_attributes}.")
            return

        # Get the new value for the attribute
        new_value = input(f"Enter the new value for {attribute}: ").strip()
        if new_value == "":
            print("Value cannot be empty.")
            return

        # Ensure the value is of the correct type
        if attribute == "Views" or attribute == "Duration":
            if not new_value.isdigit():
                print(f"Invalid value for {attribute}. It must be a number.")
                return
            new_value = int(new_value)

        # Build the query dynamically
        query = f"UPDATE Trailer SET {attribute} = %s WHERE Trailer_ID = %s"
        params = (new_value, int(trailer_id))

        # Execute the update query
        if execute_query(connection, query, params) is not None:
            print("Trailer updated successfully!")
    except Exception as e:
        print("Error updating Trailer:", e)
        
def update_technician_department(connection):
    try:
        print("\n-- Update Technician Department --")
        
        # Prompt the user for Technician_ID to update the department
        technician_id = input("Enter the Technician ID to update: ")
        if not technician_id.isdigit():
            print("Invalid Technician ID. Please enter a valid number.")
            return

        technician_id = int(technician_id)

        # Prompt the user for the new department name
        new_department = input("Enter the new Department: ").strip()
        if not new_department:
            print("Department cannot be empty.")
            return

        # Build the query to update the Technician's department
        query = "UPDATE Technician SET Department = %s WHERE Technician_ID = %s"
        params = (new_department, technician_id)

        # Execute the update query
        if execute_query(connection, query, params) is not None:
            print(f"Technician with ID {technician_id}'s department updated to {new_department}.")
        else:
            print(f"Technician with ID {technician_id} not found.")
    
    except Exception as e:
        print(f"Error updating Technician's department: {e}")
        
def add_trailer(connection):
    try:
        print("\n-- Add Trailer --")
        trailer_data = {
            "movie_id": input("Movie ID : ") or None,
            "published_date": input("Published Date (YYYY-MM-DD, Optional): ") or None,
            "url": input("URL : ") or None,
            "duration": input("Duration (in seconds, Optional): ") or None,
            "views": input("Views : ") or None
        }

        # Convert numeric fields to appropriate types if provided
        if trailer_data["duration"]:
            trailer_data["duration"] = int(trailer_data["duration"])
        if trailer_data["views"]:
            trailer_data["views"] = int(trailer_data["views"])
        if trailer_data["movie_id"]:
            trailer_data["movie_id"] = int(trailer_data["movie_id"])

        # Replace invalid inputs
        for key, val in trailer_data.items():
            if val == "NULL" or val == "NA":
                trailer_data[key] = None

        query = """
        INSERT INTO Trailer (Movie_ID, Published_Date, URL, Duration, Views)
        VALUES (%s, %s, %s, %s, %s)
        """

        if execute_query(connection, query, tuple(trailer_data.values())) is not None:
            print("Trailer added successfully!")
    except Exception as e:
        print("Error adding trailer:", e)
        
def add_award(connection):
    try:
        print("\n-- Add Award --")
        award_data = {
            "award_name": input("Award Name: "),
            "award_year": int(input("Award Year: ")),
            "movie_id": input("Movie ID (Optional): ") or None
        }

        # Replace invalid values with None
        for key, val in award_data.items():
            if val == "NULL" or val == "NA":
                award_data[key] = None

        query = """
        INSERT INTO Award (Award_Name, Award_Year, Movie_ID)
        VALUES (%s, %s, %s)
        """
        
        if execute_query(connection, query, tuple(award_data.values())) is not None:
            print("Award added successfully!")
    except Exception as e:
        print("Error adding award:", e)
        
def add_technician(connection):
    try:
        print("\n-- Add Technician --")
        technician_data = {
            "name": input("Name: "),
            "date_of_birth": input("Date of Birth (YYYY-MM-DD): ") or None,
            "nationality": input("Nationality: ") or None,
            "department": input("Department: ") or None
        }

        # Replace invalid values with None
        for key, val in technician_data.items():
            if val == "NULL" or val == "NA":
                technician_data[key] = None

        query = """
        INSERT INTO Technician (Name, Date_of_Birth, Nationality, Department)
        VALUES (%s, %s, %s, %s)
        """
        
        if execute_query(connection, query, tuple(technician_data.values())) is not None:
            print("Technician added successfully!")
    except Exception as e:
        print("Error adding technician:", e)
        
def add_production_house(connection):
    try:
        print("\n-- Add Production House --")
        production_house_data = {
            "name": input("Name: "),
            "established_date": input("Established Date (YYYY-MM-DD): ") or None,
            "street": input("Street: ") or None,
            "area": input("Area: ") or None,
            "city": input("City: ") or None,
            "state": input("State: ") or None,
            "pincode": input("PinCode: ") or None,
            "owner_name": input("Owner Name: ") or None
        }

        # Replace invalid values with None
        for key, val in production_house_data.items():
            if val == "NULL" or val == "NA":
                production_house_data[key] = None

        query = """
        INSERT INTO Production_House (Name, Established_Date, Street, Area, City, State, PinCode, Owner_Name)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        
        if execute_query(connection, query, tuple(production_house_data.values())) is not None:
            print("Production House added successfully!")
    except Exception as e:
        print("Error adding production house:", e)

def add_actor(connection):
    try:
        print("\n-- Add Actor --")
        actor_data = {
            "name": input("Name: "),
            "date_of_birth": input("Date of Birth (YYYY-MM-DD): ") or None,
            "nationality": input("Nationality: ") or None
        }

        # Replace invalid values with None
        for key, val in actor_data.items():
            if val == "NULL" or val == "NA":
                actor_data[key] = None

        query = """
        INSERT INTO Actor (Name, Date_of_Birth, Nationality)
        VALUES (%s, %s, %s)
        """
        
        if execute_query(connection, query, tuple(actor_data.values())) is not None:
            print("Actor added successfully!")
    except Exception as e:
        print("Error adding actor:", e)
        
def add_character(connection):
    try:
        print("\n-- Add Character --")
        
        # Prompt the user for input to add a character
        movie_id = input("Enter Movie ID: ")
        actor_id = input("Enter Actor ID: ")
        character_name = input("Enter Character Name: ").strip()
        role_type = input("Enter Role Type (e.g., lead, supporting): ").strip()
        gender = input("Enter Gender (e.g., Male, Female): ").strip()

        # Validate that Movie_ID and Actor_ID are integers
        if not movie_id.isdigit() or not actor_id.isdigit():
            print("Invalid Movie ID or Actor ID. Please enter valid numbers.")
            return

        movie_id = int(movie_id)
        actor_id = int(actor_id)

        # Handle possible empty values for character_name, role_type, and gender
        if not character_name:
            print("Character Name cannot be empty.")
            return
        if not role_type:
            print("Role Type cannot be empty.")
            return
        if not gender:
            print("Gender cannot be empty.")
            return

        # Prepare data to insert into the Character table
        character_data = {
            "movie_id": movie_id,
            "actor_id": actor_id,
            "character_name": character_name,
            "role_type": role_type,
            "gender": gender
        }

        # SQL query to insert the new character into the Character table
        query = """
        INSERT INTO Char_acter (Movie_ID, Actor_ID, Character_Name, Role_Type, Gender)
        VALUES (%s, %s, %s, %s, %s)
        """

        # Execute the query
        if execute_query(connection, query, tuple(character_data.values())) is not None:
            print("Character added successfully!")
        else:
            print("Failed to add character. Please check the Movie ID and Actor ID.")
    
    except Exception as e:
        print(f"Error adding character: {e}")



# User Interface Dispatch
def dispatch(connection, ch):
    try:
        if ch == 1:
            add_movie(connection)
        elif ch == 2:
            delete_trailer(connection)
        elif ch == 3:
            analysis1(connection)
        elif ch == 4:
            analysis2(connection)
        elif ch == 5:
            selection1(connection)
        elif ch == 6:
            selection2(connection)
        elif ch == 7:
            projection1(connection)
        elif ch == 8:
            projection2(connection)
        elif ch == 9:
            search1(connection)
        elif ch == 10:
            search2(connection)
        elif ch == 11:
            aggregation1(connection)
        elif ch == 12:
            aggregation2(connection)
        elif ch == 13:
            update_movie(connection)
        elif ch == 14:
            update_production_house(connection)
        elif ch == 15:
            update_trailer(connection)
        elif ch == 16:
            update_technician_department(connection)
        elif ch == 17:
            add_trailer(connection)
        elif ch == 18:
            add_award(connection)
        elif ch == 19:
            add_technician(connection)
        elif ch == 20:
            add_production_house(connection)
        elif ch == 21:
            add_actor(connection)
        elif ch == 22:
            add_character(connection)
        else:
            print("Invalid Option")
    except Exception as e:
        print("Error in dispatch:", e)


# Main Menu Loop
def main():
    # while True:
        sp.call('clear', shell=True)      # For Linux
        # sp.call('cls', shell=True)      # For Windows
        username = input("Username: ")
        password = input("Password: ")
        connection = connect_to_database("localhost", username, password, "moviedb")
        if connection:
            try:
                while True:
                    print("\n-- Menu --")
                    print("1. Add Movie")
                    print("2. Delete Trailer")
                    print("3. Lists production houses with movies that have above-average collections in the last 4 years.(Analysis 1)")
                    print("4. Shows the number of awards by genre and category.(Analysis 2)")
                    print("5. Lists the characters played by a specific actor.(Selection 1)")
                    print("6. Lists actors who acted in at least a movie of a specified genre.(Selection 2)")
                    print("7. Lists actors who have acted in a specified number of movies or more.(Projection 1)")
                    print("8. Lists technicians from a specified department.(Projection 2)")
                    print("9. Search for technicians by name.(Search 1)")
                    print("10. Search for movies by name.(Search 2)")
                    print("11. Shows the maximum profit for each production house.(Aggregation 1)")
                    print("12. Counts the total number of movies in each genre.(Aggregation 2)")
                    print("13. Update Movie")
                    print("14. Update Production House")
                    print("15. Update Trailer")
                    print("16. Update Technician Department")
                    print("17. Add Trailer")
                    print("18. Add Award")
                    print("19. Add Technician")
                    print("20. Add Production House")
                    print("21. Add Actor")
                    print("22. Add Character")
                    print("0. Exits the program.")

                    try:
                        ch = int(input("Enter your choice: "))
                        if ch == 0:
                            connection.close()
                            print("bye!")
                            break
                        else:
                            dispatch(connection, ch)
                    except ValueError:
                        print("Invalid input. Please try again.")        
            except Exception as e:
                print("Error in main loop:", e)
        else:
            print("Exiting...")
            # break


if __name__ == "__main__":
    main()
