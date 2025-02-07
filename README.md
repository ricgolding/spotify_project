# README: European Music Festivals & Spotify Analysis Project

## **Slide Link**

https://docs.google.com/presentation/d/1P4ZyNYR9u3nwYB5Au8nzhGsWQB2inA31FhbB9lHld-o/edit#slide=id.g32b07c4d2dd_0_35

## **Project Overview**
This project aims to explore and analyze the landscape of music festivals in Europe and the popularity of streamed songs on Spotify. The goal is to identify underserved markets where new music festivals, specifically for urban and hip-hop genres, could thrive. By merging multiple datasets and creating insightful visualizations, we provide strategic recommendations for event organizers and artists.

---

## **Objectives**
1. Analyze Spotify streaming data to identify countries with high engagement for urban and hip-hop genres.
2. Examine existing music festivals across Europe and their genres.
3. Identify gaps between listener demand and festival supply.
4. Provide actionable insights on where to host future music events.

---

## **Data Sources**
- **Spotify Streaming Data:** CSV file containing the most streamed songs in Europe categorized by country, genre, and artist.
- **European Music Festivals Dataset:** CSV file listing festivals across European countries, including their locations and genres.

---

## **Tech Stack and Tools Used**
- **Python:** Data cleaning, analysis, and visualization.
  - Key Libraries: `pandas`, `matplotlib`, `seaborn`, `plotly`
- **SQL:** Database for storing and querying merged datasets.
- **Jupyter Notebook:** Interactive environment for data exploration.

---

## **Data Processing Steps**
1. **Data Cleaning:**
   - Removed duplicates and inconsistencies from both datasets.
   - Standardized genre labels and country names for seamless merging.
2. **Data Integration:**
   - Imported CSV files into an SQL database.
   - Joined tables based on country and genre attributes.
3. **Analysis and Visualization:**
   - Visualized streaming trends across countries using heatmaps.
   - Mapped existing festival locations and compared them with streaming demand hotspots.

---

## **Key Findings**
1. **Saturated Markets:**
   - Countries like Germany, France, and the UK already have numerous music festivals.
2. **Underserved Markets:**
   - Spain and Hungary emerged as promising opportunities for new urban and hip-hop music festivals.
   - Despite significant streaming activity, these countries lack major events catering to these genres.

---

## **Visualizations**
1. **Heatmap of Urban Music Streams:** Showed the intensity of streaming activity across Europe.
2. **Festival Distribution Map:** Highlighted regions with heavy festival clustering versus cold spots.
3. **Gap Analysis:** Combined insights from both datasets to identify underserved markets.

---

## **Recommendations**
1. **Target Markets:**
   - Spain and Hungary as primary candidates for new urban music festivals.
2. **Genre Focus:**
   - Urban and hip-hop genres to capitalize on rising listener demand.
3. **Event Strategy:**
   - Collaborate with rising local and international urban artists to attract diverse audiences.

---

## **How to Run the Project**
1. **Clone the Repository:**
   ```bash
   git clone [repository_link]
   cd project_directory

