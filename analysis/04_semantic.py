import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
import pandas as pd

load_dotenv()
engine = create_engine(os.environ["DATABASE_URL"])

with engine.connect() as conn:
    target_id = conn.execute(
        text("SELECT job_id FROM job_embeddings LIMIT 1"))

q = pd.read_sql(text("""
    WITH target AS (
        SELECT embedding AS vec FROM job_embeddings WHERE job_id = :id
    )
    SELECT jobs.job_id, jobs.job_title,
           1 - (job_embeddings.embedding <=> target.vec) AS cosine_sim
    JOIN jobs USING (job_id)
    CROSS JOIN target
    WHERE job_embeddings.job_id <> :id
    ORDER BY job_embeddings.embedding <=> target.vec
    LIMIT 5
"""), engine, params={"id": target_id})

print(f"query job: {target_id}")
print(q)

