# 🎓 Learnvault

AI-powered study materials platform with quality verification, interactive learning, and fair pricing. A better alternative to Studocu.

## 🚀 Key Features

### Core Differentiators
- **AI Quality Guardian**: Auto-detect plagiarism, content accuracy scoring, flag outdated materials
- **Interactive Learning**: AI tutor explains documents, generate quizzes, auto-flashcards
- **Ethical Monetization**: Transparent pricing, instant cancellation, contributor rewards
- **Smart Discovery**: Semantic search, AI recommendations, OCR for handwritten notes

### MVP Features (Phase 1)
- ✅ User authentication (email + Google)
- ✅ Document upload/download
- ✅ Basic search functionality
- ✅ University/course categorization
- ✅ Freemium limits (5 downloads/month)

## 🛠️ Tech Stack

**Frontend**
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- Lucide Icons

**Backend**
- Next.js API Routes
- Supabase (PostgreSQL + Auth)
- AWS S3 (File Storage)

**AI Layer**
- OpenAI GPT-4 (Content verification + tutoring)
- OpenAI Embeddings (Semantic search)

**Payments**
- Stripe

**Deployment**
- Vercel (Frontend)
- Supabase (Database + Auth)

## 📦 Getting Started

### Prerequisites
- Node.js 18+
- npm or yarn
- Supabase account
- Stripe account (for payments)
- OpenAI API key

### Installation

1. Clone the repository
```bash
git clone https://github.com/deepakpancholi535/learnvault.git
cd learnvault
```

2. Install dependencies
```bash
npm install
```

3. Set up environment variables
```bash
cp .env.example .env.local
# Fill in your environment variables
```

4. Run the development server
```bash
npm run dev
```

5. Open [http://localhost:3000](http://localhost:3000)

## 🗄️ Database Schema

See `supabase/schema.sql` for complete database structure.

## 📋 Roadmap

### Phase 1: Core (Weeks 1-4) ✅
- User auth
- Document CRUD
- Basic search
- Freemium limits

### Phase 2: Differentiators (Weeks 5-6)
- AI quality scoring
- AI tutor
- Plagiarism detection
- Premium subscriptions

### Phase 3: Growth (Weeks 7-8)
- Smart recommendations
- Community voting
- Contributor rewards
- Mobile optimization

## 💰 Business Model

**Free Tier**
- 5 downloads/month
- Basic search
- Community features
- Upload unlimited (earn credits)

**Premium ($9.99/mo)**
- Unlimited downloads
- AI tutor access
- Priority support
- Ad-free experience
- Advanced search

## 🤝 Contributing

Contributions welcome! Please read CONTRIBUTING.md first.

## 📄 License

MIT License - see LICENSE file for details.

## 🔗 Links

- [Live Demo](https://learnvault.vercel.app) (Coming soon)
- [Documentation](https://docs.learnvault.com) (Coming soon)
- [Discord Community](https://discord.gg/learnvault) (Coming soon)

---

Built with ❤️ by [Deepak Pancholi](https://github.com/deepakpancholi535)