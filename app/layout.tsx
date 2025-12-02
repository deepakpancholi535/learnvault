import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Learnvault - AI-Powered Study Materials Platform',
  description: 'Quality-verified study materials with AI tutoring. A better alternative to Studocu with fair pricing and interactive learning.',
  keywords: ['study materials', 'notes', 'exam prep', 'AI tutor', 'university', 'college'],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}