
import pandas as pd

#Function to generate ID mapping
def generate_id(df: pd.DataFrame, columns: list, id_name: str = "album_id"):
    """
    Generate a unique ID based on specified columns.

    Parameters:
    df (pd.DataFrame): The input DataFrame.
    columns (list): List of column names to combine for unique ID generation.
    id_name (str): The name of the new ID column (default: 'album_id').

    Returns:
    pd.DataFrame: The DataFrame with the new ID column.
    """
    
    # Check if all specified columns exist in the DataFrame
    missing_columns = [col for col in columns if col not in df.columns]
    if missing_columns:
        raise ValueError(f"Columns not found in DataFrame: {', '.join(missing_columns)}")

    # Apply the factorization
    df.loc[:, id_name] = pd.factorize(df[columns].astype(str).fillna("Unknown").agg('-'.join, axis=1))[0] + 1
    
    return df

#Function to save to csv
def save_to_csv(df: pd.DataFrame, csv_name: str):
    """
    Save a DataFrame to a CSV file in the '../data/clean/' directory.

    Parameters:
    df (pd.DataFrame): The DataFrame to be saved.
    csv_name (str): The name of the CSV file (without path) to save the DataFrame.

    Returns:
    None
    """
    directory_path = '../data/clean/'
    full_path = directory_path + csv_name
    df.to_csv(full_path, index=False)
    print(f"DataFrame successfully saved to {full_path}")


