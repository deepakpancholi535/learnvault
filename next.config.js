/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['your-supabase-project.supabase.co', 'learnvault-documents.s3.amazonaws.com'],
  },
  experimental: {
    serverActions: true,
  },
}

module.exports = nextConfig