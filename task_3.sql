import mysql.connector

# Database connection details
HOST = "localhost"
USER = "your_username"
PASSWORD = "your_password"
DATABASE = "alx_book_store"

try:
    # Connect to MySQL
    connection = mysql.connector.connect(
        host=HOST,
        user=USER,
        password=PASSWORD,
        database=DATABASE
    )

    if connection.is_connected():
        cursor = connection.cursor()
        
        # Query to list all tables
        cursor.execute("SHOW TABLES;")
        
        # Fetch and display the tables
        tables = cursor.fetchall()
        print("Tables in the 'alx_book_store' database:")
        for table in tables:
            print(table[0])

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Ensure the connection is closed
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()