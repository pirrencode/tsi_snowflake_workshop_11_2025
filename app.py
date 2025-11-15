import streamlit as st

# APP LOGIC GOES HERE

# STEP 1. CREATE SNOWFLAKE CONNECTOR

# Using st.connection to create a Snowflake connection
# This automatically handles secrets retrieval from .streamlit/secrets.toml
# or .snowflake/connections.toml
conn = st.connection("snowflake")

st.title("Snowflake Database Query")
st.write("This application connects to Snowflake and queries data from a table.")

# STEP 2. QUERY SINGLE TABLE (SELECT * FROM MYDB)

# Method 1: Using .query() method with caching
# The ttl parameter sets cache expiration time (10 minutes in this example)
# Set ttl=0 to disable caching
try:
    st.subheader("Query Results from MYTABLE")
    
    # Query the table with automatic caching
    df = conn.query("SELECT * FROM mytable;", ttl="10m")
    
    # Display the results
    if not df.empty:
        st.dataframe(df)
        
        # Display formatted output
        st.subheader("Formatted Output")
        for row in df.itertuples():
            st.write(f"{row.NAME} has a {row.PET}")
    else:
        st.info("No data found in the table.")
        
except Exception as e:
    st.error(f"Error connecting to Snowflake or querying data: {str(e)}")
# APP LOGIC GOES HERE

# STEP 1. CREATE SNOWFLAKE CONNECTOR

# STEP 2. QUERY SINGLE TABLE (SELECT * FROM MYDB)