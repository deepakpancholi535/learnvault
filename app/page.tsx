import Link from 'next/link'
import { BookOpen, Brain, Shield, Zap, Check, X } from 'lucide-react'

export default function Home() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-blue-50 to-white">
      {/* Hero Section */}
      <div className="container mx-auto px-4 py-16">
        <nav className="flex justify-between items-center mb-16">
          <div className="flex items-center gap-2">
            <BookOpen className="w-8 h-8 text-blue-600" />
            <span className="text-2xl font-bold text-gray-900">Learnvault</span>
          </div>
          <div className="flex gap-4">
            <Link href="/login" className="px-4 py-2 text-gray-700 hover:text-blue-600">
              Login
            </Link>
            <Link href="/signup" className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
              Get Started
            </Link>
          </div>
        </nav>

        <div className="text-center max-w-4xl mx-auto mb-16">
          <h1 className="text-5xl font-bold text-gray-900 mb-6">
            Study Smarter with <span className="text-blue-600">AI-Verified</span> Materials
          </h1>
          <p className="text-xl text-gray-600 mb-8">
            Quality-checked study materials, interactive AI tutoring, and fair pricing. 
            Everything Studocu should have been.
          </p>
          <div className="flex gap-4 justify-center">
            <Link href="/signup" className="px-8 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-lg font-semibold">
              Start Free
            </Link>
            <Link href="/explore" className="px-8 py-3 border-2 border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 text-lg font-semibold">
              Explore Materials
            </Link>
          </div>
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8 mb-16">
          <FeatureCard 
            icon={<Shield className="w-8 h-8 text-blue-600" />}
            title="AI Quality Guardian"
            description="Every document verified for accuracy and plagiarism"
          />
          <FeatureCard 
            icon={<Brain className="w-8 h-8 text-blue-600" />}
            title="Interactive AI Tutor"
            description="Ask questions, get explanations, generate quizzes"
          />
          <FeatureCard 
            icon={<Zap className="w-8 h-8 text-blue-600" />}
            title="Smart Discovery"
            description="Semantic search finds exactly what you need"
          />
          <FeatureCard 
            icon={<Check className="w-8 h-8 text-blue-600" />}
            title="Fair Pricing"
            description="Transparent costs, instant cancellation, no tricks"
          />
        </div>

        {/* Comparison Table */}
        <div className="max-w-5xl mx-auto mb-16">
          <h2 className="text-3xl font-bold text-center mb-8">Why Choose Learnvault?</h2>
          <div className="bg-white rounded-xl shadow-lg overflow-hidden">
            <table className="w-full">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-4 text-left">Feature</th>
                  <th className="px-6 py-4 text-center">Learnvault</th>
                  <th className="px-6 py-4 text-center">Studocu</th>
                  <th className="px-6 py-4 text-center">Course Hero</th>
                </tr>
              </thead>
              <tbody className="divide-y">
                <ComparisonRow feature="AI Quality Verification" learnvault={true} studocu={false} courseHero={false} />
                <ComparisonRow feature="Interactive AI Tutor" learnvault={true} studocu={false} courseHero={false} />
                <ComparisonRow feature="Fair Pricing" learnvault={true} studocu={false} courseHero={false} />
                <ComparisonRow feature="No Hidden Fees" learnvault={true} studocu={false} courseHero={true} />
                <ComparisonRow feature="Instant Cancellation" learnvault={true} studocu={false} courseHero={true} />
                <ComparisonRow feature="Semantic Search" learnvault={true} studocu={false} courseHero={false} />
              </tbody>
            </table>
          </div>
        </div>

        {/* Pricing */}
        <div className="max-w-4xl mx-auto mb-16">
          <h2 className="text-3xl font-bold text-center mb-8">Simple, Transparent Pricing</h2>
          <div className="grid md:grid-cols-2 gap-8">
            <PricingCard 
              title="Free"
              price="$0"
              features={[
                '5 downloads per month',
                'Basic search',
                'Community features',
                'Upload unlimited'
              ]}
              cta="Get Started"
              ctaLink="/signup"
            />
            <PricingCard 
              title="Premium"
              price="$9.99"
              period="/month"
              features={[
                'Unlimited downloads',
                'AI tutor access',
                'Advanced search',
                'Priority support',
                'Ad-free experience'
              ]}
              cta="Start Free Trial"
              ctaLink="/signup?plan=premium"
              highlighted={true}
            />
          </div>
        </div>

        {/* CTA */}
        <div className="text-center bg-blue-600 text-white rounded-2xl p-12">
          <h2 className="text-3xl font-bold mb-4">Ready to Study Smarter?</h2>
          <p className="text-xl mb-8">Join thousands of students already using Learnvault</p>
          <Link href="/signup" className="inline-block px-8 py-3 bg-white text-blue-600 rounded-lg hover:bg-gray-100 text-lg font-semibold">
            Get Started Free
          </Link>
        </div>
      </div>
    </main>
  )
}

function FeatureCard({ icon, title, description }: { icon: React.ReactNode, title: string, description: string }) {
  return (
    <div className="bg-white p-6 rounded-xl shadow-md">
      <div className="mb-4">{icon}</div>
      <h3 className="text-xl font-semibold mb-2">{title}</h3>
      <p className="text-gray-600">{description}</p>
    </div>
  )
}

function ComparisonRow({ feature, learnvault, studocu, courseHero }: { 
  feature: string, 
  learnvault: boolean, 
  studocu: boolean, 
  courseHero: boolean 
}) {
  return (
    <tr>
      <td className="px-6 py-4 font-medium">{feature}</td>
      <td className="px-6 py-4 text-center">
        {learnvault ? <Check className="w-6 h-6 text-green-600 mx-auto" /> : <X className="w-6 h-6 text-red-600 mx-auto" />}
      </td>
      <td className="px-6 py-4 text-center">
        {studocu ? <Check className="w-6 h-6 text-green-600 mx-auto" /> : <X className="w-6 h-6 text-red-600 mx-auto" />}
      </td>
      <td className="px-6 py-4 text-center">
        {courseHero ? <Check className="w-6 h-6 text-green-600 mx-auto" /> : <X className="w-6 h-6 text-red-600 mx-auto" />}
      </td>
    </tr>
  )
}

function PricingCard({ 
  title, 
  price, 
  period, 
  features, 
  cta, 
  ctaLink, 
  highlighted 
}: { 
  title: string
  price: string
  period?: string
  features: string[]
  cta: string
  ctaLink: string
  highlighted?: boolean
}) {
  return (
    <div className={`bg-white p-8 rounded-xl shadow-lg ${highlighted ? 'ring-2 ring-blue-600' : ''}`}>
      {highlighted && <div className="text-blue-600 font-semibold mb-2">MOST POPULAR</div>}
      <h3 className="text-2xl font-bold mb-2">{title}</h3>
      <div className="mb-6">
        <span className="text-4xl font-bold">{price}</span>
        {period && <span className="text-gray-600">{period}</span>}
      </div>
      <ul className="space-y-3 mb-8">
        {features.map((feature, i) => (
          <li key={i} className="flex items-center gap-2">
            <Check className="w-5 h-5 text-green-600" />
            <span>{feature}</span>
          </li>
        ))}
      </ul>
      <Link 
        href={ctaLink} 
        className={`block text-center px-6 py-3 rounded-lg font-semibold ${
          highlighted 
            ? 'bg-blue-600 text-white hover:bg-blue-700' 
            : 'border-2 border-blue-600 text-blue-600 hover:bg-blue-50'
        }`}
      >
        {cta}
      </Link>
    </div>
  )
}