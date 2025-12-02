# 🚀 Deployment Guide

## Vercel Deployment (Recommended)

### Prerequisites
- GitHub account (✅ Done)
- Vercel account (free tier)
- Supabase account (free tier)

### Step 1: Set up Supabase

1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Go to Project Settings > API
4. Copy these values:
   - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon public` key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `service_role` key → `SUPABASE_SERVICE_ROLE_KEY`
5. Go to SQL Editor and run the schema from `supabase/schema.sql`

### Step 2: Deploy to Vercel

#### Option A: Via Vercel Dashboard (Easiest)
1. Go to [vercel.com](https://vercel.com)
2. Click "Add New Project"
3. Import `deepakpancholi535/learnvault` from GitHub
4. Configure environment variables (see below)
5. Click "Deploy"

#### Option B: Via Vercel CLI
```bash
npm i -g vercel
vercel login
vercel --prod
```

### Step 3: Environment Variables

Add these in Vercel Dashboard → Settings → Environment Variables:

```env
# Supabase (from Step 1)
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...

# Stripe (get from stripe.com/dashboard)
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_...
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...

# OpenAI (get from platform.openai.com)
OPENAI_API_KEY=sk-...

# AWS S3 (optional for now, can use Supabase Storage)
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
AWS_REGION=us-east-1
AWS_S3_BUCKET=learnvault-documents

# App URL (your Vercel URL)
NEXT_PUBLIC_APP_URL=https://learnvault.vercel.app
```

### Step 4: Connect Custom Domain (Optional)

1. Go to Vercel Dashboard → Settings → Domains
2. Add your custom domain
3. Update DNS records as instructed

---

## Local Development

### Setup
```bash
# Clone the repo
git clone https://github.com/deepakpancholi535/learnvault.git
cd learnvault

# Install dependencies
npm install

# Copy environment variables
cp .env.example .env.local
# Fill in your values in .env.local

# Run development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

---

## Quick Start Checklist

- [ ] Create Supabase project
- [ ] Run database schema
- [ ] Create Vercel project
- [ ] Add environment variables
- [ ] Deploy!
- [ ] Test authentication
- [ ] Upload first document

---

## Troubleshooting

### Build fails on Vercel
- Check all environment variables are set
- Verify Supabase URL is correct
- Check build logs for specific errors

### Database connection fails
- Verify Supabase credentials
- Check if schema is applied
- Ensure RLS policies are enabled

### Authentication not working
- Check Supabase Auth settings
- Verify redirect URLs in Supabase dashboard
- Add your Vercel URL to allowed redirect URLs

---

## Next Steps After Deployment

1. **Set up Stripe webhooks** for subscription management
2. **Configure email templates** in Supabase
3. **Add custom domain** for professional look
4. **Set up monitoring** (Vercel Analytics)
5. **Enable error tracking** (Sentry optional)

---

## Cost Breakdown (Free Tier)

- **Vercel**: Free (100GB bandwidth, unlimited builds)
- **Supabase**: Free (500MB database, 1GB file storage, 50K monthly active users)
- **OpenAI**: Pay-as-you-go (~$5-20/month for MVP)
- **Stripe**: Free (2.9% + 30¢ per transaction)

**Total**: ~$5-20/month for MVP phase

---

## Support

Need help? Check:
- [Next.js Docs](https://nextjs.org/docs)
- [Supabase Docs](https://supabase.com/docs)
- [Vercel Docs](https://vercel.com/docs)

Or open an issue on GitHub!