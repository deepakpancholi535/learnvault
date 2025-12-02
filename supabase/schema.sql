-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users table (extends Supabase auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  university TEXT,
  subscription_tier TEXT DEFAULT 'free' CHECK (subscription_tier IN ('free', 'premium')),
  downloads_this_month INTEGER DEFAULT 0,
  credits INTEGER DEFAULT 0,
  stripe_customer_id TEXT UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Documents table
CREATE TABLE public.documents (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  file_url TEXT NOT NULL,
  file_size BIGINT,
  file_type TEXT,
  thumbnail_url TEXT,
  uploader_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  university TEXT,
  course_code TEXT,
  course_name TEXT,
  category TEXT CHECK (category IN ('notes', 'assignments', 'exams', 'projects', 'other')),
  semester TEXT,
  year INTEGER,
  
  -- AI Quality Metrics
  quality_score DECIMAL(3,2) DEFAULT 0.00 CHECK (quality_score >= 0 AND quality_score <= 1),
  plagiarism_score DECIMAL(3,2) DEFAULT 0.00 CHECK (plagiarism_score >= 0 AND plagiarism_score <= 1),
  ai_verified BOOLEAN DEFAULT FALSE,
  verification_notes TEXT,
  
  -- Engagement Metrics
  downloads_count INTEGER DEFAULT 0,
  views_count INTEGER DEFAULT 0,
  rating_avg DECIMAL(2,1) DEFAULT 0.0 CHECK (rating_avg >= 0 AND rating_avg <= 5),
  rating_count INTEGER DEFAULT 0,
  
  -- Status
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'flagged')),
  is_public BOOLEAN DEFAULT TRUE,
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Document ratings
CREATE TABLE public.document_ratings (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  document_id UUID REFERENCES public.documents(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  review TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(document_id, user_id)
);

-- Document downloads tracking
CREATE TABLE public.document_downloads (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  document_id UUID REFERENCES public.documents(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  downloaded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- AI tutor conversations
CREATE TABLE public.tutor_conversations (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  document_id UUID REFERENCES public.documents(id) ON DELETE CASCADE,
  messages JSONB DEFAULT '[]'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Subscriptions
CREATE TABLE public.subscriptions (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  stripe_subscription_id TEXT UNIQUE,
  status TEXT CHECK (status IN ('active', 'canceled', 'past_due', 'trialing')),
  current_period_start TIMESTAMP WITH TIME ZONE,
  current_period_end TIMESTAMP WITH TIME ZONE,
  cancel_at_period_end BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better query performance
CREATE INDEX idx_documents_uploader ON public.documents(uploader_id);
CREATE INDEX idx_documents_university ON public.documents(university);
CREATE INDEX idx_documents_course ON public.documents(course_code);
CREATE INDEX idx_documents_status ON public.documents(status);
CREATE INDEX idx_documents_created ON public.documents(created_at DESC);
CREATE INDEX idx_document_ratings_document ON public.document_ratings(document_id);
CREATE INDEX idx_document_downloads_user ON public.document_downloads(user_id);
CREATE INDEX idx_document_downloads_document ON public.document_downloads(document_id);

-- Enable Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.document_ratings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.document_downloads ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tutor_conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

-- RLS Policies for profiles
CREATE POLICY "Public profiles are viewable by everyone" ON public.profiles
  FOR SELECT USING (true);

CREATE POLICY "Users can update own profile" ON public.profiles
  FOR UPDATE USING (auth.uid() = id);

-- RLS Policies for documents
CREATE POLICY "Public documents are viewable by everyone" ON public.documents
  FOR SELECT USING (is_public = true AND status = 'approved');

CREATE POLICY "Users can insert own documents" ON public.documents
  FOR INSERT WITH CHECK (auth.uid() = uploader_id);

CREATE POLICY "Users can update own documents" ON public.documents
  FOR UPDATE USING (auth.uid() = uploader_id);

CREATE POLICY "Users can delete own documents" ON public.documents
  FOR DELETE USING (auth.uid() = uploader_id);

-- RLS Policies for ratings
CREATE POLICY "Ratings are viewable by everyone" ON public.document_ratings
  FOR SELECT USING (true);

CREATE POLICY "Users can insert own ratings" ON public.document_ratings
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own ratings" ON public.document_ratings
  FOR UPDATE USING (auth.uid() = user_id);

-- RLS Policies for downloads
CREATE POLICY "Users can view own downloads" ON public.document_downloads
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own downloads" ON public.document_downloads
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- RLS Policies for tutor conversations
CREATE POLICY "Users can view own conversations" ON public.tutor_conversations
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own conversations" ON public.tutor_conversations
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own conversations" ON public.tutor_conversations
  FOR UPDATE USING (auth.uid() = user_id);

-- RLS Policies for subscriptions
CREATE POLICY "Users can view own subscriptions" ON public.subscriptions
  FOR SELECT USING (auth.uid() = user_id);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers for updated_at
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_documents_updated_at BEFORE UPDATE ON public.documents
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_tutor_conversations_updated_at BEFORE UPDATE ON public.tutor_conversations
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_subscriptions_updated_at BEFORE UPDATE ON public.subscriptions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to reset monthly downloads
CREATE OR REPLACE FUNCTION reset_monthly_downloads()
RETURNS void AS $$
BEGIN
  UPDATE public.profiles SET downloads_this_month = 0;
END;
$$ LANGUAGE plpgsql;

-- Function to update document rating average
CREATE OR REPLACE FUNCTION update_document_rating()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE public.documents
  SET 
    rating_avg = (SELECT AVG(rating) FROM public.document_ratings WHERE document_id = NEW.document_id),
    rating_count = (SELECT COUNT(*) FROM public.document_ratings WHERE document_id = NEW.document_id)
  WHERE id = NEW.document_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for rating updates
CREATE TRIGGER update_document_rating_trigger
AFTER INSERT OR UPDATE OR DELETE ON public.document_ratings
FOR EACH ROW EXECUTE FUNCTION update_document_rating();