# ✅ Setup Checklist

Complete these steps to get Learnvault running!

## 🎯 Phase 1: Initial Setup (30 minutes)

### 1. Clone Repository
```bash
git clone https://github.com/deepakpancholi535/learnvault.git
cd learnvault
npm install
```
- [ ] Repository cloned
- [ ] Dependencies installed

### 2. Supabase Setup
1. Go to [supabase.com](https://supabase.com) and create account
2. Create new project (choose region close to you)
3. Wait for project to initialize (~2 minutes)

**Get your credentials:**
- [ ] Copy Project URL from Settings → API
- [ ] Copy `anon` public key
- [ ] Copy `service_role` secret key

**Set up database:**
- [ ] Go to SQL Editor
- [ ] Copy content from `supabase/schema.sql`
- [ ] Run the SQL script
- [ ] Verify tables created (check Table Editor)

### 3. Environment Variables
```bash
cp .env.example .env.local
```

Fill in `.env.local`:
- [ ] `NEXT_PUBLIC_SUPABASE_URL`
- [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- [ ] `SUPABASE_SERVICE_ROLE_KEY`
- [ ] `NEXT_PUBLIC_APP_URL=http://localhost:3000`

### 4. Test Local Development
```bash
npm run dev
```
- [ ] Server starts on http://localhost:3000
- [ ] Landing page loads
- [ ] No console errors

---

## 🚀 Phase 2: Vercel Deployment (15 minutes)

### 1. Connect to Vercel
- [ ] Go to [vercel.com](https://vercel.com)
- [ ] Sign up with GitHub
- [ ] Click "Add New Project"
- [ ] Import `deepakpancholi535/learnvault`

### 2. Configure Project
- [ ] Framework Preset: Next.js (auto-detected)
- [ ] Root Directory: `./`
- [ ] Build Command: `npm run build` (default)
- [ ] Output Directory: `.next` (default)

### 3. Add Environment Variables
Copy from your `.env.local`:
- [ ] `NEXT_PUBLIC_SUPABASE_URL`
- [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- [ ] `SUPABASE_SERVICE_ROLE_KEY`
- [ ] `NEXT_PUBLIC_APP_URL` (use your Vercel URL)

### 4. Deploy
- [ ] Click "Deploy"
- [ ] Wait for build (~2-3 minutes)
- [ ] Visit your live site!

### 5. Update Supabase Auth Settings
- [ ] Go to Supabase → Authentication → URL Configuration
- [ ] Add your Vercel URL to "Site URL"
- [ ] Add `https://your-app.vercel.app/**` to "Redirect URLs"

---

## 💳 Phase 3: Stripe Setup (Optional - for payments)

### 1. Create Stripe Account
- [ ] Go to [stripe.com](https://stripe.com)
- [ ] Sign up for account
- [ ] Activate test mode

### 2. Get API Keys
- [ ] Go to Developers → API Keys
- [ ] Copy Publishable key
- [ ] Copy Secret key

### 3. Add to Environment Variables
In Vercel and `.env.local`:
- [ ] `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`
- [ ] `STRIPE_SECRET_KEY`

### 4. Create Products
- [ ] Go to Products
- [ ] Create "Premium Monthly" product
- [ ] Set price to $9.99/month
- [ ] Copy Price ID

### 5. Set up Webhooks (Later)
- [ ] Create webhook endpoint
- [ ] Add webhook secret to env vars

---

## 🤖 Phase 4: OpenAI Setup (Optional - for AI features)

### 1. Get API Key
- [ ] Go to [platform.openai.com](https://platform.openai.com)
- [ ] Create account / Sign in
- [ ] Go to API Keys
- [ ] Create new secret key

### 2. Add to Environment Variables
- [ ] `OPENAI_API_KEY`

### 3. Add Credits
- [ ] Go to Billing
- [ ] Add payment method
- [ ] Add $10-20 for testing

---

## 📦 Phase 5: File Storage (Choose One)

### Option A: Supabase Storage (Easier)
- [ ] Go to Supabase → Storage
- [ ] Create bucket "documents"
- [ ] Set to public or private
- [ ] Update code to use Supabase Storage

### Option B: AWS S3 (More Scalable)
- [ ] Create AWS account
- [ ] Create S3 bucket
- [ ] Create IAM user with S3 access
- [ ] Add credentials to env vars

---

## 🧪 Phase 6: Testing (30 minutes)

### Test Authentication
- [ ] Sign up with email
- [ ] Verify email works
- [ ] Log in
- [ ] Log out
- [ ] Password reset

### Test Basic Features
- [ ] Upload document (once built)
- [ ] View document list
- [ ] Search documents
- [ ] Download document

### Test Deployment
- [ ] Push to GitHub
- [ ] Vercel auto-deploys
- [ ] Live site updates
- [ ] No build errors

---

## 📊 Current Status

**Completed:**
- ✅ GitHub repository created
- ✅ Project structure set up
- ✅ Database schema designed
- ✅ Landing page created
- ✅ Deployment guide written

**Next Steps:**
- [ ] Complete Supabase setup
- [ ] Deploy to Vercel
- [ ] Build authentication pages
- [ ] Build document upload feature

---

## 🆘 Troubleshooting

### Build fails
- Check all env vars are set
- Verify no syntax errors
- Check Vercel build logs

### Database connection fails
- Verify Supabase credentials
- Check if schema is applied
- Test connection in Supabase dashboard

### Can't sign up
- Check Supabase Auth is enabled
- Verify email settings
- Check redirect URLs

---

## 📞 Need Help?

- Check `DEPLOYMENT.md` for detailed instructions
- Check `PROJECT_STRUCTURE.md` for code organization
- Open GitHub issue for bugs
- Review Next.js/Supabase docs

---

## 🎉 You're Ready!

Once you complete Phase 1-2, you'll have:
- ✅ Working local development environment
- ✅ Live production site on Vercel
- ✅ Database ready for data
- ✅ Foundation to build features

**Time to start building! 🚀**