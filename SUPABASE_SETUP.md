# Supabase Setup Guide for Rails Blog App

## Step 1: Get Your Supabase Database Credentials

1. Go to your Supabase project dashboard (https://supabase.com/dashboard)
2. Navigate to **Settings** → **Database**
3. Copy the following information:
   - **Host**: Something like `db.xxxxxxxxxxxxxxxxxxxx.supabase.co`
   - **Database name**: Usually `postgres`
   - **Username**: Usually `postgres`
   - **Password**: Your database password
   - **Port**: Usually `5432`

## Step 2: Create Your .env File

1. Copy the example file:
   ```bash
   cp .env.example .env
   ```

2. Edit the `.env` file with your actual Supabase credentials:
   ```bash
   # Replace these with your actual Supabase values
   SUPABASE_DB_HOST=db.your-project-ref.supabase.co
   SUPABASE_DB_PORT=5432
   SUPABASE_DB_USERNAME=postgres
   SUPABASE_DB_PASSWORD=your-actual-password
   SUPABASE_DB_NAME=postgres
   ```

## Step 3: Test the Connection

1. Test the database connection:
   ```bash
   rails db:version
   ```

2. If the connection works, run migrations:
   ```bash
   rails db:migrate
   ```

3. Seed your database:
   ```bash
   rails db:seed
   ```

## Step 4: Start Your Rails Server

```bash
rails server
```

## Alternative: Using DATABASE_URL

Instead of individual environment variables, you can use a single DATABASE_URL:

```bash
# In your .env file
DATABASE_URL=postgresql://postgres:your-password@db.your-project-ref.supabase.co:5432/postgres
```

## Troubleshooting

1. **SSL Connection Issues**: The configuration includes `sslmode: require` for secure connections
2. **Connection Timeout**: Check if your Supabase project is paused (free tier auto-pauses after inactivity)
3. **Authentication Failed**: Double-check your password in the Supabase dashboard

## Security Notes

- Never commit your `.env` file to git (it's already in .gitignore)
- Use different credentials for production
- Consider using Supabase's connection pooling for production apps
