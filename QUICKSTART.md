# ⚡ Quick Start - Get Running in 10 Minutes

## 🎯 Goal
Get Learnvault running locally and deployed to Vercel ASAP!

---

## Step 1: Clone & Install (2 min)

```bash
git clone https://github.com/deepakpancholi535/learnvault.git
cd learnvault
npm install
```

---

## Step 2: Supabase Setup (5 min)

### Create Project
1. Go to [supabase.com/dashboard](https://supabase.com/dashboard)
2. Click "New Project"
3. Fill in:
   - Name: `learnvault`
   - Database Password: (save this!)
   - Region: (closest to you)
4. Click "Create new project"
5. Wait 2 minutes for setup

### Get Credentials
1. Go to Settings (⚙️) → API
2. Copy these 3 values:

```
Project URL: https://xxxxx.supabase.co
anon public: eyJhbGc...
service_role: eyJhbGc...
```

### Set Up Database
1. Click SQL Editor (left sidebar)
2. Click "New Query"
3. Open `supabase/schema.sql` from your project
4. Copy ALL the SQL code
5. Paste into Supabase SQL Editor
6. Click "Run" (or Ctrl+Enter)
7. Should see "Success. No rows returned"

---

## Step 3: Environment Variables (1 min)

```bash
cp .env.example .env.local
```

Edit `.env.local` and add your Supabase values:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

---

## Step 4: Run Locally (1 min)

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

**You should see the landing page! 🎉**

---

## Step 5: Deploy to Vercel (3 min)

### Import Project
1. Go to [vercel.com/new](https://vercel.com/new)
2. Click "Import" next to `deepakpancholi535/learnvault`
3. Click "Deploy" (don't add env vars yet)
4. Wait for deployment

### Add Environment Variables
1. Go to your project → Settings → Environment Variables
2. Add the same 3 Supabase variables from `.env.local`
3. Click "Save"

### Redeploy
1. Go to Deployments tab
2. Click "..." on latest deployment
3. Click "Redeploy"

### Update Supabase Auth
1. Go back to Supabase → Authentication → URL Configuration
2. Add your Vercel URL:
   - Site URL: `https://your-app.vercel.app`
   - Redirect URLs: `https://your-app.vercel.app/**`
3. Click "Save"

---

## ✅ You're Live!

**Local:** http://localhost:3000
**Production:** https://your-app.vercel.app

---

## 🎯 What You Have Now

- ✅ Beautiful landing page
- ✅ Database ready for users & documents
- ✅ Auto-deployment on every git push
- ✅ Production-ready infrastructure

---

## 🚀 Next Steps

### Immediate (This Week)
1. **Build Auth Pages** - Login, signup, password reset
2. **Test Authentication** - Make sure users can sign up
3. **Build Document Upload** - Core feature #1

### Soon (Next Week)
4. **Document Listing** - Show uploaded documents
5. **Search Functionality** - Find documents
6. **Download Tracking** - Track usage

### Later (Week 3-4)
7. **AI Quality Check** - Verify document quality
8. **AI Tutor** - Interactive learning
9. **Stripe Integration** - Premium subscriptions

---

## 📚 Documentation

- **Full Setup:** See `SETUP_CHECKLIST.md`
- **Deployment:** See `DEPLOYMENT.md`
- **Structure:** See `PROJECT_STRUCTURE.md`
- **Main README:** See `README.md`

---

## 🆘 Common Issues

### "Module not found" error
```bash
rm -rf node_modules package-lock.json
npm install
```

### Supabase connection fails
- Double-check your env vars
- Make sure you copied the full keys
- Verify schema was applied (check Table Editor)

### Vercel build fails
- Check environment variables are set
- Look at build logs for specific error
- Make sure all dependencies are in package.json

---

## 💡 Pro Tips

1. **Use Git Branches:** Create feature branches for new work
2. **Test Locally First:** Always test before pushing
3. **Check Vercel Logs:** Great for debugging production issues
4. **Supabase Dashboard:** Monitor database in real-time

---

## 🎉 Congratulations!

You now have a production-ready Next.js app with:
- Database (Supabase)
- Authentication (ready to build)
- Hosting (Vercel)
- Auto-deployment (GitHub → Vercel)

**Time to build features! 🚀**

---

## 📞 Questions?

- Check the other docs in this repo
- Open a GitHub issue
- Review Next.js/Supabase documentation

**Happy coding! 💻**