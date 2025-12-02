# 📁 Project Structure

```
learnvault/
├── app/                          # Next.js 14 App Router
│   ├── (auth)/                   # Auth routes group
│   │   ├── login/
│   │   ├── signup/
│   │   └── reset-password/
│   ├── (dashboard)/              # Protected routes
│   │   ├── dashboard/
│   │   ├── documents/
│   │   ├── upload/
│   │   ├── tutor/
│   │   └── settings/
│   ├── api/                      # API routes
│   │   ├── auth/
│   │   ├── documents/
│   │   ├── stripe/
│   │   └── ai/
│   ├── layout.tsx                # Root layout
│   ├── page.tsx                  # Landing page
│   └── globals.css               # Global styles
│
├── components/                   # React components
│   ├── ui/                       # Reusable UI components
│   │   ├── Button.tsx
│   │   ├── Card.tsx
│   │   ├── Input.tsx
│   │   └── Modal.tsx
│   ├── documents/                # Document-related components
│   │   ├── DocumentCard.tsx
│   │   ├── DocumentUpload.tsx
│   │   └── DocumentViewer.tsx
│   ├── tutor/                    # AI tutor components
│   │   ├── ChatInterface.tsx
│   │   └── QuizGenerator.tsx
│   └── layout/                   # Layout components
│       ├── Header.tsx
│       ├── Footer.tsx
│       └── Sidebar.tsx
│
├── lib/                          # Utility functions
│   ├── supabase/                 # Supabase client & helpers
│   │   ├── client.ts
│   │   ├── server.ts
│   │   └── middleware.ts
│   ├── stripe/                   # Stripe integration
│   │   ├── client.ts
│   │   └── webhooks.ts
│   ├── openai/                   # OpenAI integration
│   │   ├── client.ts
│   │   ├── verification.ts
│   │   └── tutor.ts
│   ├── aws/                      # AWS S3 integration
│   │   └── s3.ts
│   └── utils/                    # General utilities
│       ├── validation.ts
│       ├── formatting.ts
│       └── constants.ts
│
├── types/                        # TypeScript types
│   ├── database.ts               # Supabase generated types
│   ├── document.ts
│   ├── user.ts
│   └── subscription.ts
│
├── hooks/                        # Custom React hooks
│   ├── useAuth.ts
│   ├── useDocuments.ts
│   ├── useSubscription.ts
│   └── useTutor.ts
│
├── supabase/                     # Supabase configuration
│   ├── schema.sql                # Database schema
│   ├── migrations/               # Database migrations
│   └── seed.sql                  # Seed data (optional)
│
├── public/                       # Static assets
│   ├── images/
│   ├── icons/
│   └── favicon.ico
│
├── .env.example                  # Environment variables template
├── .gitignore
├── next.config.js
├── package.json
├── tsconfig.json
├── tailwind.config.ts
├── postcss.config.js
├── vercel.json
├── README.md
├── DEPLOYMENT.md
└── PROJECT_STRUCTURE.md
```

## 🗂️ Key Directories Explained

### `/app` - Next.js App Router
- **Route Groups**: `(auth)` and `(dashboard)` for logical organization
- **API Routes**: Backend endpoints for auth, documents, payments
- **Server Components**: Default for better performance

### `/components` - React Components
- **ui/**: Reusable, generic UI components
- **documents/**: Document-specific features
- **tutor/**: AI tutor interface components
- **layout/**: App-wide layout components

### `/lib` - Business Logic
- **supabase/**: Database operations and auth
- **stripe/**: Payment processing
- **openai/**: AI features (verification, tutoring)
- **aws/**: File storage operations

### `/types` - TypeScript Definitions
- Type safety across the application
- Generated from Supabase schema

### `/hooks` - Custom React Hooks
- Reusable stateful logic
- Data fetching and state management

## 📝 Naming Conventions

- **Files**: PascalCase for components (`DocumentCard.tsx`)
- **Folders**: kebab-case for routes (`reset-password/`)
- **Functions**: camelCase (`getUserDocuments()`)
- **Types**: PascalCase (`DocumentType`)
- **Constants**: UPPER_SNAKE_CASE (`MAX_FILE_SIZE`)

## 🔄 Data Flow

```
User Action
    ↓
Component (UI)
    ↓
Custom Hook (State Management)
    ↓
API Route / Server Action
    ↓
Lib Function (Business Logic)
    ↓
Supabase / External Service
    ↓
Database / Storage
```

## 🎯 Next Steps to Build

### Phase 1: Authentication (Week 1)
- [ ] Create auth pages (login, signup)
- [ ] Set up Supabase auth
- [ ] Implement protected routes
- [ ] Add user profile management

### Phase 2: Document Management (Week 2)
- [ ] Document upload functionality
- [ ] Document listing and search
- [ ] Document viewer
- [ ] Download tracking

### Phase 3: AI Features (Week 3)
- [ ] Content quality verification
- [ ] AI tutor chat interface
- [ ] Quiz generation
- [ ] Plagiarism detection

### Phase 4: Payments (Week 4)
- [ ] Stripe integration
- [ ] Subscription management
- [ ] Usage tracking
- [ ] Billing portal

## 🛠️ Development Workflow

1. **Create feature branch**: `git checkout -b feature/document-upload`
2. **Build component**: Start with UI component
3. **Add business logic**: Create lib functions
4. **Connect to backend**: API routes or server actions
5. **Test locally**: `npm run dev`
6. **Commit & push**: `git push origin feature/document-upload`
7. **Auto-deploy**: Vercel deploys preview
8. **Merge to main**: Production deployment

## 📚 Resources

- [Next.js 14 Docs](https://nextjs.org/docs)
- [Supabase Docs](https://supabase.com/docs)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)