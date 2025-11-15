import streamlit as st

# APP LOGIC GOES HERE

# STEP 1. CREATE SNOWFLAKE CONNECTOR

# Using st.connection to create a Snowflake connection
# This automatically handles secrets retrieval from .streamlit/secrets.toml
# or .snowflake/connections.toml
conn = st.connection("snowflake")

st.title("Snowflake Database Query 2025")
st.write("This application connects to Snowflake and queries data from a table.")

# STEP 2. QUERY SINGLE TABLE (SELECT * FROM MYDB)

# Method 1: Using .query() method with caching
# The ttl parameter sets cache expiration time (10 minutes in this example)
# Set ttl=0 to disable caching
try:
    # Query all students
    st.subheader("📊 All Students")
    
    # Basic query to get all students
    df_all_students = conn.query("SELECT * FROM STUDENT_DPT ORDER BY student_id;", ttl="10m")
    
    if not df_all_students.empty:
        # Display total count
        st.metric("Total Students", len(df_all_students))
        
        # Department filter
        departments = ['All'] + sorted(df_all_students['DEPARTMENT'].unique().tolist())
        selected_dept = st.sidebar.selectbox("Select Department", departments)
        
        # Filter data based on selection
        if selected_dept != 'All':
            filtered_df = df_all_students[df_all_students['DEPARTMENT'] == selected_dept]
        else:
            filtered_df = df_all_students
        
        # Display filtered data
        st.dataframe(filtered_df, use_container_width=True)
        
        # Statistics Section
        st.subheader("📈 Statistics")
        
        col1, col2, col3 = st.columns(3)
        
        with col1:
            avg_gpa = filtered_df['GPA'].mean()
            st.metric("Average GPA", f"{avg_gpa:.2f}")
        
        with col2:
            total_credits = filtered_df['CREDITS_COMPLETED'].sum()
            st.metric("Total Credits", f"{total_credits:,}")
        
        with col3:
            intl_students = filtered_df['IS_INTERNATIONAL'].sum()
            st.metric("International Students", intl_students)
        
        # Department Distribution
        st.subheader("🏛️ Students by Department")
        dept_counts = conn.query("""
            SELECT department, COUNT(*) as student_count
            FROM STUDENT_DPT
            GROUP BY department
            ORDER BY student_count DESC;
        """, ttl="10m")
        
        st.bar_chart(dept_counts.set_index('DEPARTMENT'))
        
        # High Performers
        st.subheader("🌟 Top Performers (GPA >= 3.8)")
        high_performers = conn.query("""
            SELECT student_id, first_name, last_name, department, major, gpa
            FROM STUDENT_DPT
            WHERE gpa >= 3.8
            ORDER BY gpa DESC;
        """, ttl="10m")
        
        if not high_performers.empty:
            st.dataframe(high_performers, use_container_width=True)
        else:
            st.info("No students with GPA >= 3.8")
        
        # International Students
        st.subheader("🌍 International Students")
        intl_students_df = conn.query("""
            SELECT student_id, first_name, last_name, country, department, major, gpa
            FROM STUDENT_DPT
            WHERE is_international = TRUE
            ORDER BY country, last_name;
        """, ttl="10m")
        
        if not intl_students_df.empty:
            st.dataframe(intl_students_df, use_container_width=True)
        else:
            st.info("No international students found")
        
        # Academic Status Distribution
        st.subheader("📋 Academic Status Distribution")
        status_dist = conn.query("""
            SELECT academic_status, COUNT(*) as count
            FROM STUDENT_DPT
            GROUP BY academic_status
            ORDER BY count DESC;
        """, ttl="10m")
        
        st.dataframe(status_dist, use_container_width=True)
        
        # Average GPA by Department
        st.subheader("📊 Average GPA by Department")
        avg_gpa_dept = conn.query("""
            SELECT department, ROUND(AVG(gpa), 2) as avg_gpa
            FROM STUDENT_DPT
            GROUP BY department
            ORDER BY avg_gpa DESC;
        """, ttl="10m")
        
        st.bar_chart(avg_gpa_dept.set_index('DEPARTMENT'))
        
    else:
        st.warning("No data found in STUDENT_DPT table.")
        st.info("Please run the SQL script to create and populate the table.")
        
except Exception as e:
    st.error(f"Error connecting to Snowflake or querying data: {str(e)}")
    st.info("""
    **Troubleshooting Steps:**
    1. Ensure your Snowflake credentials are configured in Streamlit.io secrets
    2. Verify the STUDENT_DPT table exists in your database
    3. Check that your user has appropriate permissions
    4. Run the provided SQL script to create the table
    """)

# Footer
st.markdown("---")
st.caption("Data refreshes every 10 minutes | Powered by Snowflake & Streamlit")

# APP LOGIC GOES HERE

# STEP 1. CREATE SNOWFLAKE CONNECTOR

# STEP 2. QUERY SINGLE TABLE (SELECT * FROM MYDB)